# SQL Sales Analytics & Query Optimization

A business-focused MySQL analytics project using a 1.4M+ row sales dataset to analyze sales performance, customers, products, markets, discounts, and forecast accuracy. The project also demonstrates reusable SQL database objects and query-performance optimization using indexes and `EXPLAIN ANALYZE`.

## Project Highlights

- **1,425,706** records in `fact_sales_monthly`
- **4 analytical views** for gross-to-net sales transformations
- **9 stored procedures** identified in the source learning work
- **2 SQL functions** for fiscal-year and fiscal-quarter logic
- CTEs, subqueries, temporary tables, joins, and window functions
- Customer, market, product, and forecast analysis
- Query optimization using indexing and `EXPLAIN ANALYZE`

## Business Questions

- How are monthly and yearly sales performing?
- Which markets generate the highest sales?
- Which customers contribute the most net sales?
- Which products perform best within each division?
- How does discounting affect net sales?
- How does actual sales performance compare with forecasts?
- How can query performance be improved on a large fact table?

## Data Model

The sales analysis uses a logical fact/dimension structure. Relationships are established through business keys in SQL joins rather than claiming a separately authored ER diagram for the sales database.

```text
                    dim_customer
                         |
                    customer_code
                         |
                         v
                 fact_sales_monthly
                    /           \
           product_code         date
                 |                |
                 v                v
           dim_product         dim_date
                 |
                 v
          fact_gross_price
```

Supporting datasets include forecast, freight, manufacturing-cost, pre-invoice deduction, and post-invoice deduction data.

## Query Performance Case Study

A customer-level query initially used a table scan across approximately 1.43M sales rows. After adding an index on `customer_code`, `EXPLAIN ANALYZE` showed an index lookup instead.

| Metric | Before | After |
|---|---:|---:|
| Access method | Table scan | Index lookup |
| Rows at relevant plan node | ~1,425,706 | ~8,194 |
| Reported plan-node time | ~1,396 ms | ~60 ms |

The timing comparison is reported at the relevant execution-plan node; it is not presented as a claim that every end-to-end query becomes exactly 23x faster.

## SQL Techniques

**Analytics:** aggregations, fiscal-period analysis, joins, CTEs, subqueries, temporary tables, window functions, ranking.

**Database development:** views, stored procedures, user-defined functions, logical fact/dimension analysis.

**Performance:** indexes, execution plans, `EXPLAIN ANALYZE`.

## Repository Structure

```text
sql-sales-analytics/
├── docs/
├── sql/
│   ├── 01_data_exploration/
│   ├── 02_business_analysis/
│   ├── 03_advanced_sql/
│   ├── 04_views/
│   ├── 05_stored_procedures/
│   ├── 06_functions/
│   └── 07_performance_optimization/
├── data/
├── outputs/
└── screenshots/
```

## Data Availability

The repository contains SQL definitions and selected derived outputs. Source datasets may be subject to their original distribution terms and are not assumed to be redistributable.

## Notes on Portfolio Preparation

The SQL in this repository is based on original learning and analytical work and has been organized for clarity. Intermediate experiments and raw Workbench history are intentionally excluded from the recruiter-facing structure.
