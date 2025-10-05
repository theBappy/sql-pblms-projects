/* Write your T-SQL query statement below */
SELECT
    w2.id
FROM
    Weather w1
    JOIN Weather w2 ON DATEDIFF (DAY, w1.recordDate, w2.recordDate) = 1
WHERE
    w2.temperature > w1.temperature