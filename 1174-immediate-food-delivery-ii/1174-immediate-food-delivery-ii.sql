# Write your MySQL query statement below
WITH FirstOrders AS (
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
),
ImmediateOrders AS (
    SELECT 
        D.customer_id,
        D.order_date,
        D.customer_pref_delivery_date,
        CASE 
            WHEN D.order_date = D.customer_pref_delivery_date THEN 1
            ELSE 0
        END AS is_immediate
    FROM Delivery D
    INNER JOIN FirstOrders F
    ON D.customer_id = F.customer_id
    AND D.order_date = F.first_order_date
)
SELECT 
    ROUND(100.0 * SUM(is_immediate) / COUNT(*), 2) AS immediate_percentage
FROM ImmediateOrders;
