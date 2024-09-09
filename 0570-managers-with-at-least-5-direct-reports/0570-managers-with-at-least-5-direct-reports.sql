# Write your MySQL query statement below
SELECT name
FROM Employee
WHERE id IN (SELECT managerID FROM EMPLOYEE GROUP BY managerID HAVING COUNT(*) >= 5)