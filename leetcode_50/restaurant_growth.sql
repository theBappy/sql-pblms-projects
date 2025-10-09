/* Write your T-SQL query statement below */
WITH
    DailyAmount AS (
        SELECT
            visited_on,
            SUM(amount) AS total_amount
        FROM
            Customer
        GROUP BY
            visited_on
    )
SELECT
    d1.visited_on,
    SUM(d2.total_amount) AS amount,
    ROUND(AVG(CAST(d2.total_amount AS FLOAT)), 2) AS average_amount
FROM
    DailyAmount d1
    JOIN DailyAmount d2 ON d2.visited_on BETWEEN DATEADD (DAY, -6, d1.visited_on) AND d1.visited_on
GROUP BY
    d1.visited_on
HAVING
    COUNT(*) = 7
ORDER BY
    d1.visited_on