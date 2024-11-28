# Write your MySQL query statement below

# products with no price changes up to 2019-08-16, defaulting their price to 10
SELECT DISTINCT
    product_id,
    10 AS price
FROM
    Products
WHERE
    product_id NOT IN (
        SELECT DISTINCT product_id
        FROM Products
        WHERE change_date <= '2019-08-16'
    )
UNION
# the most recent price for products with changes up to 2019-08-16
SELECT
    p.product_id,
    p.new_price AS price
FROM
    Products p
JOIN (
    SELECT
        product_id,
        MAX(change_date) AS max_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY
        product_id
) recent_changes
ON
    p.product_id = recent_changes.product_id
    AND p.change_date = recent_changes.max_date;