-- Return the top N customers by net sales within a market and fiscal year.

DELIMITER $$

CREATE PROCEDURE get_top_n_customer_by_net_sales(
    IN in_market VARCHAR(45),
    IN in_fiscal_year YEAR,
    IN in_top_n INT
)
BEGIN
    SELECT
        c.customer_code,
        c.customer,
        c.market,
        ROUND(SUM(n.net_sales), 2) AS net_sales
    FROM net_sales AS n
    JOIN dim_customer AS c
      ON c.customer_code = n.customer_code
    WHERE c.market = in_market
      AND get_fiscal_year(n.date) = in_fiscal_year
    GROUP BY c.customer_code, c.customer, c.market
    ORDER BY net_sales DESC
    LIMIT in_top_n;
END$$

DELIMITER ;
