/* Write your T-SQL query statement below */
SELECT
    E.employee_id
FROM
    Employees E
    LEFT JOIN Employees M ON M.employee_id = E.manager_id
WHERE
    E.salary < 30000
    AND M.employee_id IS NULL
    AND E.manager_id IS NOT NULL
ORDER BY
    Employee_id