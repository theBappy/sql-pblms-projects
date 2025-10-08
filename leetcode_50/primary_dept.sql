-- Approach 1 (Union All)
/* Write your T-SQL query statement below */
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y'
UNION ALL
SELECT
    employee_id,
    MAX(department_id) AS department_id
FROM
    Employee
GROUP BY
    employee_id
HAVING
    COUNT(*) = 1
    -- Approach 2(Grouping & Join)
    /* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            employee_id,
            COUNT(*) AS cnt
        FROM
            Employee
        GROUP BY
            employee_id
    )
SELECT
    c.employee_id,
    e.department_id
FROM
    CTE c
    JOIN Employee e ON c.employee_id = e.employee_id
WHERE
    cnt = 1
    OR primary_flag = 'Y'
    -- Approach 3 (Window Function)
    /* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            employee_id,
            department_id,
            primary_flag,
            COUNT(*) OVER (
                PARTITION BY
                    employee_id
            ) AS cnt
        FROM
            Employee
    )
SELECT
    employee_id,
    department_id
FROM
    CTE
WHERE
    cnt = 1
    OR primary_flag = 'Y'