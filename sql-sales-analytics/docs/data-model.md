# Logical Data Model

The sales analysis is centered on `fact_sales_monthly` and combines customer, product, date, pricing, forecast, cost, freight, and deduction data through SQL join keys.

## Core relationships

- `fact_sales_monthly.customer_code` → `dim_customer.customer_code`
- `fact_sales_monthly.product_code` → `dim_product.product_code`
- `fact_sales_monthly.date` → `dim_date.calendar_date`
- `fact_sales_monthly.product_code` + fiscal year → `fact_gross_price.product_code` + fiscal year
- Sales and forecast records are combined by date, product, and customer into `fact_act_est`

This is documented as a **logical analytical model**. No physical ER diagram or foreign-key implementation is claimed for `gdb0041`.

## Supporting fact tables

- `fact_forecast_monthly`
- `fact_gross_price`
- `fact_manufacturing_cost`
- `fact_freight_cost`
- `fact_pre_invoice_deductions`
- `fact_post_invoice_deductions`
- `fact_act_est`

The design supports reusable analytical transformations such as gross sales, discount adjustments, net sales, and forecast accuracy.
