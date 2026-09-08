-- Return fiscal year for an April-March financial calendar.
-- Example: 2021-03-31 -> 2021; 2021-04-01 -> 2022.

DELIMITER $$

CREATE FUNCTION get_fiscal_year(calendar_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(DATE_ADD(calendar_date, INTERVAL 4 MONTH));
END$$

DELIMITER ;
