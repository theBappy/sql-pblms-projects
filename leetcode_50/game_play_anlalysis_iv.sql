WITH
    CTE AS (
        SELECT
            player_id,
            MIN(event_date) AS first_date
        FROM
            Activity
        GROUP BY
            player_id
    ),
    logged_users AS (
        SELECT
            A.player_id
        FROM
            Activity A
            JOIN CTE C ON A.player_id = C.player_id
        WHERE
            DATEDIFF (DAY, C.first_date, A.event_date) = 1
    )
SELECT
    ROUND(
        COUNT(DISTINCT logged_users.player_id) * 1.0 / (
            SELECT
                COUNT(DISTINCT player_id)
            FROM
                Activity
        ),
        2
    ) AS fraction
FROM
    logged_users