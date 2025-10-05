-- Subqueries
/* Write your T-SQL query statement below */
SELECT
    machine_id,
    ROUND(AVG(time_taken), 3) AS processing_time
FROM
    (
        SELECT
            machine_id,
            process_id,
            MAX(timestamp) - MIN(timestamp) AS time_taken
        FROM
            Activity
        GROUP BY
            machine_id,
            process_id
    ) t
GROUP BY
    machine_id