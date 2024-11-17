# Write your MySQL query statement below
# might have logged in and played 0 games
# find total players
# find players that logged in again after the day they first logged in
SELECT
    ROUND(
        (COUNT(DISTINCT first_day_players.player_id) * 1.0)
        / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM (
    SELECT
        a.player_id
    FROM Activity a
    JOIN (
        SELECT
            player_id,
            MIN(event_date) AS first_login_date
        FROM Activity
        GROUP BY player_id
    ) first_login ON a.player_id = first_login.player_id
    WHERE DATEDIFF(a.event_date, first_login.first_login_date) = 1
) AS first_day_players;