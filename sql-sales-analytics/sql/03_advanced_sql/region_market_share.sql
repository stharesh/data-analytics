-- Net sales by customer and region, with each customer's share within its region.
-- Assumes net_sales is the curated analytical view created from the sales model.

WITH customer_region_sales AS (
    SELECT
        c.region,
        c.customer_code,
        c.customer,
        SUM(n.net_sales) AS net_sales
    FROM net_sales AS n
    JOIN dim_customer AS c
        ON c.customer_code = n.customer_code
    GROUP BY c.region, c.customer_code, c.customer
)
SELECT
    region,
    customer_code,
    customer,
    ROUND(net_sales, 2) AS net_sales,
    ROUND(
        100 * net_sales / SUM(net_sales) OVER (PARTITION BY region),
        2
    ) AS region_share_pct
FROM customer_region_sales
ORDER BY region, region_share_pct DESC;
