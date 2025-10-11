/* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            requester_id AS id
        FROM
            RequestAccepted
        UNION ALL
        SELECT
            accepter_id AS id
        FROM
            RequestAccepted
    )
SELECT
    TOP 1 id,
    COUNT(*) AS num
FROM
    CTE
GROUP BY
    id
ORDER BY
    num DESC