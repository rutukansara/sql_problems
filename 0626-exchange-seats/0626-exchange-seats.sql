# Write your MySQL query statement below
# swap seat id of every two consecutive students
# if no. of students = odd, id of last student is not swapped
# order by id in ascending order

SELECT 
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
        ELSE COALESCE(LEAD(student) OVER(ORDER BY id), student)
    END AS student
FROM Seat