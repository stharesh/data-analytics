-- Compare forecast accuracy across two fiscal years by customer.
-- The result makes year-over-year forecast quality directly comparable.

DELIMITER $$

CREATE PROCEDURE get_forecast_accuracy_year_on_year(
    IN in_year_1 YEAR,
    IN in_year_2 YEAR
)
BEGIN
    WITH actuals AS (
        SELECT
            customer_code,
            get_fiscal_year(date) AS fiscal_year,
            SUM(sold_quantity) AS actual_quantity
        FROM fact_sales_monthly
        WHERE get_fiscal_year(date) IN (in_year_1, in_year_2)
        GROUP BY customer_code, get_fiscal_year(date)
    ),
    forecasts AS (
        SELECT
            customer_code,
            get_fiscal_year(date) AS fiscal_year,
            SUM(forecast_quantity) AS forecast_quantity
        FROM fact_forecast_monthly
        WHERE get_fiscal_year(date) IN (in_year_1, in_year_2)
        GROUP BY customer_code, get_fiscal_year(date)
    ),
    accuracy AS (
        SELECT
            a.customer_code,
            a.fiscal_year,
            100 * (1 - ABS(f.forecast_quantity - a.actual_quantity)
                / NULLIF(a.actual_quantity, 0)) AS accuracy_pct
        FROM actuals AS a
        JOIN forecasts AS f
          ON f.customer_code = a.customer_code
         AND f.fiscal_year = a.fiscal_year
    )
    SELECT
        c.customer_code,
        c.customer,
        MAX(CASE WHEN fiscal_year = in_year_1 THEN accuracy_pct END) AS year_1_accuracy_pct,
        MAX(CASE WHEN fiscal_year = in_year_2 THEN accuracy_pct END) AS year_2_accuracy_pct,
        MAX(CASE WHEN fiscal_year = in_year_2 THEN accuracy_pct END)
          - MAX(CASE WHEN fiscal_year = in_year_1 THEN accuracy_pct END) AS accuracy_change_pct
    FROM accuracy AS a
    JOIN dim_customer AS c
      ON c.customer_code = a.customer_code
    GROUP BY c.customer_code, c.customer
    ORDER BY accuracy_change_pct DESC;
END$$

DELIMITER ;
