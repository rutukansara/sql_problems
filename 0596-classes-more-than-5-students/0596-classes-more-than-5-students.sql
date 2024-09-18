# Write your MySQL query statement below
SELECT class FROM (SELECT class, COUNT(*) AS number
FROM Courses
GROUP BY class) courses
WHERE number >= 5