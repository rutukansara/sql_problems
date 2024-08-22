# Write your MySQL query statement below
SELECT EmployeeUNI.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI ON e.id = EmployeeUNI.id