# Data Analytics Portfolio

**Business-focused analytics projects built with SQL, Excel, Power BI, Python, and DAX.**

I use data to answer business questions, build reusable analytical solutions, and communicate results clearly. Projects are organized to show not only the final analysis, but also the reasoning, data model, SQL implementation, validation, and performance considerations behind the work.

## ⭐ Featured Project

### SQL Sales Analytics & Query Optimization

A MySQL analytics project built around a **1.4M+ row retail sales fact table**. The project covers sales, customers, products, markets, pricing, deductions, costs, and forecast accuracy.

**What this project demonstrates**

| Area | Evidence |
|---|---|
| Business analysis | Monthly/yearly sales, market performance, product rankings, forecast accuracy |
| Advanced SQL | CTEs, subqueries, window functions, `DENSE_RANK()` |
| Database design | Fact/dimension analytical model, generated columns, composite keys |
| Reusable SQL | Views, stored procedures, stored functions |
| Performance engineering | Indexing + `EXPLAIN ANALYZE` |
| Documentation | Business questions, data dictionary, data model, validation notes |

**Performance case study:** a customer filter that initially used a table scan was re-tested after adding an index on `customer_code`. The observed plan changed to an index lookup, with the relevant plan node processing far fewer rows.

➡️ **[Open the SQL Sales Analytics project](./sql-sales-analytics/)**

## 🧭 How I approach analytics

```text
Business question
      ↓
Understand the data + grain
      ↓
Build the SQL analysis
      ↓
Validate the result
      ↓
Optimize where necessary
      ↓
Document the business takeaway
```

This portfolio is intended to demonstrate a practical workflow rather than a collection of isolated syntax exercises.

## 🛠️ Core Skills

**SQL & Databases**  
MySQL · Joins · CTEs · Window Functions · Views · Stored Procedures · Stored Functions · Query Optimization

**Analytics**  
Business Questions · KPI Analysis · Sales Analysis · Market Analysis · Forecast Accuracy · Data Validation

**Tools**  
Excel · Power BI · Python · DAX · MySQL Workbench · GitHub

## 👤 About This Portfolio

Each project emphasizes clear problem definition, readable implementation, evidence of results, and honest documentation of assumptions and limitations.
