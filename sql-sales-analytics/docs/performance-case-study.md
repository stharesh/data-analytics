# Query Performance Case Study

## Problem

A customer-level lookup on the large `fact_sales_monthly` table initially required a table scan.

```sql
EXPLAIN ANALYZE
SELECT *
FROM fact_sales_monthly
WHERE customer_code = 90022082;
```

## Optimization

The query was optimized by adding an index on `customer_code`:

```sql
ALTER TABLE fact_sales_monthly
ADD INDEX idx_customer_code (customer_code);
```

The same query was then executed again with `EXPLAIN ANALYZE`.

## Observed plan change

| Metric | Before index | After index |
|---|---:|---:|
| Access method | Table scan | Index lookup |
| Rows at relevant plan node | ~1,425,706 | ~8,194 |
| Reported plan-node time | ~1,396 ms | ~60 ms |

These figures come from the observed execution-plan outputs used in the project. The timing is reported at the relevant plan node and should not be interpreted as a universal end-to-end speedup for every environment or workload.

## Why the index helps

The original query filters on `customer_code`. Without a supporting index, MySQL has to inspect the large fact table to find matching rows. The index gives the optimizer a selective access path to the requested customer records.

## Interview explanation

> "I first reproduced the slow access pattern with `EXPLAIN ANALYZE`. The plan showed a table scan across the large sales fact table. I added an index on the column used by the equality filter, reran the exact same query, and verified that the access path changed to an index lookup with far fewer rows processed at the relevant plan node."

## Important engineering caveat

Indexes are not automatically beneficial for every query. They add storage and write-maintenance cost, and the optimizer may still choose a scan when a filter is not selective or when scanning is cheaper. The correct approach is to measure the workload and inspect the execution plan.
