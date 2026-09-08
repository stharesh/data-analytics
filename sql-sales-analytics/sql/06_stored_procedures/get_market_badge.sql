-- Classify a market by total sold quantity in a fiscal year.
-- The OUT parameter makes the procedure convenient for application/reporting use.

DELIMITER $$

CREATE PROCEDURE get_market_badge(
    IN in_market VARCHAR(45),
    IN in_fiscal_year YEAR,
    OUT out_badge VARCHAR(45)
)
BEGIN
    DECLARE qty BIGINT DEFAULT 0;

    IF in_market IS NULL OR TRIM(in_market) = '' THEN
        SET in_market = 'India';
    END IF;

    SELECT COALESCE(SUM(s.sold_quantity), 0)
      INTO qty
    FROM fact_sales_monthly AS s
    JOIN dim_customer AS c
      ON c.customer_code = s.customer_code
    WHERE get_fiscal_year(s.date) = in_fiscal_year
      AND c.market = in_market;

    SET out_badge = CASE
        WHEN qty > 5000000 THEN 'Gold'
        ELSE 'Silver'
    END;
END$$

DELIMITER ;
