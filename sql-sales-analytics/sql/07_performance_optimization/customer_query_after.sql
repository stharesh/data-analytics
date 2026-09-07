-- Same customer lookup used for the AFTER-index comparison.
EXPLAIN ANALYZE
SELECT *
FROM gdb0041.fact_sales_monthly
WHERE customer_code = 90022082;
