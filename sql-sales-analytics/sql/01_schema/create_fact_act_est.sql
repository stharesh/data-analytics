-- Build an analytical actual-vs-estimate table.
-- LEFT JOIN in both directions preserves records that exist only in actuals
-- or only in forecasts; UNION ALL then produces a combined analytical grain.

CREATE TABLE fact_act_est AS
SELECT
    COALESCE(s.date, f.date) AS date,
    COALESCE(s.product_code, f.product_code) AS product_code,
    COALESCE(s.customer_code, f.customer_code) AS customer_code,
    s.sold_quantity,
    f.forecast_quantity
FROM fact_sales_monthly AS s
LEFT JOIN fact_forecast_monthly AS f
    ON f.date = s.date
   AND f.product_code = s.product_code
   AND f.customer_code = s.customer_code

UNION ALL

SELECT
    f.date,
    f.product_code,
    f.customer_code,
    s.sold_quantity,
    f.forecast_quantity
FROM fact_forecast_monthly AS f
LEFT JOIN fact_sales_monthly AS s
    ON s.date = f.date
   AND s.product_code = f.product_code
   AND s.customer_code = f.customer_code
WHERE s.date IS NULL;
