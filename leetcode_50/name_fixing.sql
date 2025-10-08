/* Write your T-SQL query statement below */
SELECT
    user_id,
    name = UPPER(LEFT (name, 1)) + LOWER(RIGHT (name, LEN (name) -1))
FROM
    Users
ORDER BY
    user_id ASC;