-- Return monthly gross sales for a customer in a requested fiscal year.
-- Example call: CALL get_monthly_gross_sales_for_customer(90002002, 2021);

DELIMITER $$

CREATE PROCEDURE get_monthly_gross_sales_for_customer(
    IN in_customer_code INT,
    IN in_fiscal_year YEAR
)
BEGIN
    SELECT
        MONTH(s.date) AS calendar_month,
        ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS gross_sales
    FROM fact_sales_monthly AS s
    JOIN fact_gross_price AS g
        ON g.product_code = s.product_code
       AND g.fiscal_year = get_fiscal_year(s.date)
    WHERE s.customer_code = in_customer_code
      AND get_fiscal_year(s.date) = in_fiscal_year
    GROUP BY MONTH(s.date)
    ORDER BY calendar_month;
END$$

DELIMITER ;
