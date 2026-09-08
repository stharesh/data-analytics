-- Schema design notes derived from the analytical work.
-- Review and adapt the ALTER statements to the target database before execution.

-- Fiscal year is derived from the April-March financial calendar.
ALTER TABLE fact_sales_monthly
    ADD COLUMN fiscal_year YEAR
    GENERATED ALWAYS AS (YEAR(DATE_ADD(date, INTERVAL 4 MONTH))) STORED;

-- The sales fact is modeled at date + product + customer grain.
ALTER TABLE fact_sales_monthly
    ADD PRIMARY KEY (date, product_code, customer_code);

-- Forecast data uses the same business grain for actual-vs-estimate matching.
ALTER TABLE fact_forecast_monthly
    ADD PRIMARY KEY (date, product_code, customer_code);

-- Fiscal-period attributes are used throughout pricing and sales analysis.
-- The source work also uses a reusable get_fiscal_year() function.
