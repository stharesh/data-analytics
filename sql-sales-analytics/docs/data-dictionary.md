# Data Dictionary

## Core tables

| Table | Role | Key analytical fields |
|---|---|---|
| `fact_sales_monthly` | Monthly sales fact | date, fiscal_year, product_code, customer_code, sold_quantity |
| `dim_customer` | Customer dimension | customer_code, customer, market, region |
| `dim_product` | Product dimension | product_code, product, variant, division |
| `dim_date` | Date dimension | calendar_date, fiscal attributes |
| `fact_gross_price` | Pricing fact | product_code, fiscal_year, gross_price |
| `fact_forecast_monthly` | Forecast fact | date, fiscal_year, product_code, customer_code, forecast_quantity |
| `fact_manufacturing_cost` | Cost fact | product/cost attributes |
| `fact_freight_cost` | Freight fact | freight-related attributes |
| `fact_pre_invoice_deductions` | Discount inputs | customer_code, fiscal_year, deduction percentage |
| `fact_post_invoice_deductions` | Post-invoice deductions | deduction-related attributes |
| `fact_act_est` | Actual vs forecast analytical table | date, product_code, customer_code, sold_quantity, forecast_quantity |

`fact_sales_monthly` contains approximately 1.43 million records in the working dataset.
