-- Top N products by sold quantity within each division.
-- This procedure wraps the analytical ranking pattern for reuse.

DELIMITER $$

CREATE PROCEDURE get_top_n_products_per_division_by_qty_sold(
    IN in_top_n INT
)
BEGIN
    WITH product_sales AS (
        SELECT
            p.division,
            s.product_code,
            p.product,
            SUM(s.sold_quantity) AS total_quantity
        FROM fact_sales_monthly AS s
        JOIN dim_product AS p
          ON p.product_code = s.product_code
        GROUP BY p.division, s.product_code, p.product
    ),
    ranked_products AS (
        SELECT
            division,
            product_code,
            product,
            total_quantity,
            DENSE_RANK() OVER (
                PARTITION BY division
                ORDER BY total_quantity DESC
            ) AS product_rank
        FROM product_sales
    )
    SELECT
        division,
        product_code,
        product,
        total_quantity,
        product_rank
    FROM ranked_products
    WHERE product_rank <= in_top_n
    ORDER BY division, product_rank, product_code;
END$$

DELIMITER ;
