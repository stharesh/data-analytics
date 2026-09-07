-- Total sold quantity by market for fiscal year 2021.
-- This supports market-level demand comparison.

SELECT
    c.market,
    SUM(s.sold_quantity) AS total_quantity
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON c.customer_code = s.customer_code
WHERE get_fiscal_year(s.date) = 2021
GROUP BY c.market
ORDER BY total_quantity DESC;
