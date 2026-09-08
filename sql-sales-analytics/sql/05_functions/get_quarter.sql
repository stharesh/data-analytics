-- Return fiscal quarter for an April-March financial calendar.

DELIMITER $$

CREATE FUNCTION get_quarter(calendar_date DATE)
RETURNS CHAR(2)
DETERMINISTIC
BEGIN
    DECLARE month_num INT;

    SET month_num = MONTH(calendar_date);

    RETURN CASE
        WHEN month_num IN (4, 5, 6) THEN 'Q1'
        WHEN month_num IN (7, 8, 9) THEN 'Q2'
        WHEN month_num IN (10, 11, 12) THEN 'Q3'
        ELSE 'Q4'
    END;
END$$

DELIMITER ;
