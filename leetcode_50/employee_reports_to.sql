/* Write your T-SQL query statement below */
SELECT
    m.employee_id,
    m.name,
    COUNT(e.reports_to) AS reports_count,
    ROUND(AVG(e.age * 1.00), 0) AS average_age
FROM
    Employees e,
    Employees m
WHERE
    e.reports_to = m.Employee_id
GROUP BY
    m.Employee_id,
    m.name
ORDER BY
    Employee_id ASC