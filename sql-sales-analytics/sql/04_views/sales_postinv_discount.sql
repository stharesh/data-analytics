-- Calculate gross sales, pre-invoice discounts, and post-invoice deductions.
-- This view keeps the transformation logic reusable for net-sales analysis.

CREATE OR REPLACE VIEW sales_postinv_discount AS
SELECT
    s.date,
    s.fiscal_year,
    s.customer_code,
    c.market,
    p.product,
    p.variant,
    s.product_code,
    s.sold_quantity,
    ROUND(s.sold_quantity * g.gross_price, 2) AS gross_price_total,
    pre.pre_invoice_discount_pct,
    (1 - pre.pre_invoice_discount_pct)
        * ROUND(s.sold_quantity * g.gross_price, 2) AS net_invoice_sales,
    po.discounts_pct + po.other_deductions_pct AS post_invoice_deductions
FROM fact_sales_monthly AS s
JOIN dim_customer AS c
    ON c.customer_code = s.customer_code
JOIN dim_product AS p
    ON p.product_code = s.product_code
JOIN fact_gross_price AS g
    ON g.product_code = s.product_code
   AND g.fiscal_year = s.fiscal_year
JOIN fact_pre_invoice_deductions AS pre
    ON pre.customer_code = s.customer_code
   AND pre.fiscal_year = s.fiscal_year
JOIN fact_post_invoice_deductions AS po
    ON po.date = s.date
   AND po.product_code = s.product_code
   AND po.customer_code = s.customer_code;
