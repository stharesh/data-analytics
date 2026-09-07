CREATE OR REPLACE VIEW gross_sales AS
SELECT
    s.date,
    s.fiscal_year,
    s.customer_code,
    s.product_code,
    s.sold_quantity,
    g.gross_price,
    s.sold_quantity * g.gross_price AS gross_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g
  ON g.product_code = s.product_code
 AND g.fiscal_year = get_fiscal_year(s.date);
