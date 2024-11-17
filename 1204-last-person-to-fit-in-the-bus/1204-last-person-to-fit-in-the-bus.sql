# Write your MySQL query statement below
SELECT person_name FROM (SELECT person_id, person_name, weight, SUM(weight) OVER (ORDER BY turn ASC) AS cumulative_sum
FROM Queue) AS subquery
WHERE cumulative_sum <= 1000
ORDER BY cumulative_sum DESC
LIMIT 1;