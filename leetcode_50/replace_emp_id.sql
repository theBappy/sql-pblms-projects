/* Write your T-SQL query statement below */
SELECT
    j.unique_id AS unique_id,
    i.name AS name
FROM
    Employees AS i
    LEFT JOIN EmployeeUNI AS j ON i.id = j.id