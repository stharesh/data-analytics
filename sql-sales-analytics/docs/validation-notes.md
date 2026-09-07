# Validation & Portfolio Notes

## Scope

The project is based on MySQL Workbench learning and analytical work performed against the `gdb0041` sales model. The repository contains curated SQL rather than raw Workbench history.

## Verified portfolio claims

- `fact_sales_monthly` contains 1,425,706 records in the working dataset referenced by the analysis.
- The work includes 9 distinct stored procedures in the source history and 2 SQL functions: fiscal-year and fiscal-quarter helpers.
- The project uses joins, CTEs, subqueries, temporary tables, window functions, views, generated columns, composite keys, indexes, and `EXPLAIN ANALYZE`.
- The customer filtering case study changed the observed execution plan from a table scan to an index lookup after adding an index on `customer_code`.

## Important modeling note

The documented relationships are logical analytical relationships inferred from the SQL joins. The portfolio does not claim that foreign-key constraints were physically defined in the source database unless independently verified.

## Security note

Raw MySQL Workbench history is intentionally excluded. It can contain local connection details, credentials, and machine-specific file paths. Only sanitized SQL and documentation should be published.

## Cleanup policy

Historical experiments with typos, placeholder procedure names, duplicate approaches, or incomplete statements should not be presented as production-ready SQL. Canonical examples in this repository should be readable, descriptive, and safe to run after adapting schema-specific assumptions.
