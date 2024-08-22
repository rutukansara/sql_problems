# Write your MySQL query statement below
SELECT Product.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product on s.product_id = Product.product_id