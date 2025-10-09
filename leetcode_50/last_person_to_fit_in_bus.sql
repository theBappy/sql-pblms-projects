/* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            turn,
            person_id,
            person_name,
            weight,
            SUM(weight) OVER (
                ORDER BY
                    turn
            ) AS cum_wei
        FROM
            Queue
    )
SELECT
    TOP 1 person_name
FROM
    CTE
WHERE
    cum_wei <= 1000
ORDER BY
    cum_wei DESC