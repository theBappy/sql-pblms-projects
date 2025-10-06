/* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            class,
            COUNT(*) OVER (
                PARTITION BY
                    class
            ) AS cnt
        FROM
            Courses
    )
SELECT DISTINCT
    class
FROM
    CTE
WHERE
    cnt >= 5