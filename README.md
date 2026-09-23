# Data Analytics Portfolio

**An evolving portfolio of business-focused data analytics projects.**

I use data to answer business questions, build reusable analytical solutions, and communicate results clearly. Each completed project includes the problem context, analytical approach, implementation, evidence, and documented assumptions.

> **Current focus:** SQL Sales Analytics & Query Optimization. A Python analytics project is in progress; Power BI, Excel, DAX, Microsoft Fabric, and Databricks projects will be added as completed work is ready to share.

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

## 🛠️ Skills demonstrated in this repository

**SQL & Databases**  
MySQL · Joins · CTEs · Window Functions · Views · Stored Procedures · Stored Functions · Query Optimization

**Analytics**  
Business Questions · KPI Analysis · Sales Analysis · Market Analysis · Forecast Accuracy · Data Validation

**Tools**  
MySQL · MySQL Workbench · GitHub

## 🔜 Portfolio roadmap

This repository is designed to grow into a collection of independently reviewable analytics projects. New work will be added only when it includes a clear business question, reproducible analysis, and evidence of the result.

| Area | Status | Planned evidence |
|---|---|---|
| Python analytics | In progress | Data preparation, analysis, and documented findings |
| Power BI & DAX | Planned | Data model, dashboard screenshots, KPI definitions, and insights |
| Excel analytics | Planned | Workbook, methodology, and decision-focused analysis |
| Microsoft Fabric | Planned | Architecture, transformations, and analytical outputs |
| Databricks | Planned | Notebook or pipeline, data transformations, and results |

Completed projects will use descriptive top-level folders such as `python-customer-churn-analysis/` or `power-bi-sales-dashboard/` so each project can be reviewed independently.

## 👤 About This Portfolio

Each project emphasizes clear problem definition, readable implementation, evidence of results, and honest documentation of assumptions and limitations. Skills are listed as demonstrated only when a corresponding project artifact is available in this repository.
