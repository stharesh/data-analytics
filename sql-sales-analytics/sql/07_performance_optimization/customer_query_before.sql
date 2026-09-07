-- Query used for the performance case study BEFORE indexing.
-- Expected access path: table scan on the large sales fact table.
EXPLAIN ANALYZE
SELECT *
FROM gdb0041.fact_sales_monthly
WHERE customer_code = 90022082;
