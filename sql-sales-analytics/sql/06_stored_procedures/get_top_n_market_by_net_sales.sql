-- Return the top N markets by net sales for a fiscal year.

DELIMITER $$

CREATE PROCEDURE get_top_n_market_by_net_sales(
    IN in_fiscal_year YEAR,
    IN in_top_n INT
)
BEGIN
    SELECT
        c.market,
        ROUND(SUM(n.net_sales), 2) AS net_sales
    FROM net_sales AS n
    JOIN dim_customer AS c
      ON c.customer_code = n.customer_code
    WHERE get_fiscal_year(n.date) = in_fiscal_year
    GROUP BY c.market
    ORDER BY net_sales DESC
    LIMIT in_top_n;
END$$

DELIMITER ;
