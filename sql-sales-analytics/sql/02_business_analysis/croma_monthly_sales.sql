-- Monthly gross sales for Croma (customer_code = 90002002)
-- Gross sales = sold quantity × fiscal-year gross price.

SELECT
    s.date,
    ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS gross_total
FROM fact_sales_monthly AS s
JOIN fact_gross_price AS g
    ON g.product_code = s.product_code
   AND g.fiscal_year = get_fiscal_year(s.date)
WHERE s.customer_code = 90002002
GROUP BY s.date
ORDER BY s.date;
