-- Calculate net sales from post-invoice-adjusted sales.
-- Depends on the curated sales_postinv_discount view.

CREATE OR REPLACE VIEW net_sales AS
SELECT
    date,
    fiscal_year,
    customer_code,
    market,
    product,
    variant,
    product_code,
    sold_quantity,
    gross_price_total,
    pre_invoice_discount_pct,
    net_invoice_sales,
    post_invoice_deductions,
    (1 - post_invoice_deductions) * net_invoice_sales AS net_sales
FROM sales_postinv_discount;
