# Write your MySQL query statement below
SELECT id, COUNT(*) AS num FROM (SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted) friends
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1