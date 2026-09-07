# Query Performance Optimization

## Case study: customer lookup on `fact_sales_monthly`

### Before indexing

```sql
EXPLAIN ANALYZE
SELECT *
FROM gdb0041.fact_sales_monthly
WHERE customer_code = 90022082;
```

The recorded execution plan showed a table scan over approximately 1,425,706 rows.

### Optimization

```sql
ALTER TABLE gdb0041.fact_sales_monthly
ADD INDEX idx_customer_code (customer_code);
```

### After indexing

Running the same `EXPLAIN ANALYZE` query showed an index lookup on `idx_customer_code` and approximately 8,194 rows at the relevant plan node.

### Recorded comparison

| | Before | After |
|---|---:|---:|
| Access method | Table scan | Index lookup |
| Rows at relevant plan node | ~1,425,706 | ~8,194 |
| Reported plan-node time | ~1,396 ms | ~60 ms |

The comparison documents the observed execution-plan change. Plan-node timing is not represented as a universal end-to-end speedup claim.

## Key lesson

Indexes can reduce the amount of data the database needs to scan for selective predicates. `EXPLAIN ANALYZE` provides actual execution information that can be used to validate whether an optimization changes the access path as expected.
