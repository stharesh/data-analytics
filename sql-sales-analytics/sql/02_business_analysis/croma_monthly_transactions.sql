-- Monthly transaction detail for Croma in fiscal year 2021.
-- The join to fact_gross_price is fiscal-year aware because product prices can vary by year.

SELECT
    s.date,
    s.product_code,
    p.product,
    p.variant,
    s.sold_quantity,
    g.gross_price,
    ROUND(g.gross_price * s.sold_quantity, 2) AS gross_total
FROM fact_sales_monthly AS s
JOIN dim_product AS p
    ON p.product_code = s.product_code
JOIN fact_gross_price AS g
    ON g.product_code = s.product_code
   AND g.fiscal_year = get_fiscal_year(s.date)
WHERE s.customer_code = 90002002
  AND get_fiscal_year(s.date) = 2021
ORDER BY s.date, s.product_code;
