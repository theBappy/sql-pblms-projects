/* Write your T-SQL query statement below */
SELECT
    Department,
    Employee,
    Salary
FROM
    (
        SELECT
            d.name AS Department,
            e.name AS Employee,
            e.salary AS Salary,
            DENSE_RANK() OVER (
                PARTITION BY
                    e.departmentId
                ORDER BY
                    e.salary DESC
            ) rnk
        FROM
            Employee e
            JOIN Department d ON e.departmentId = d.id
    ) t
WHERE
    rnk <= 3
ORDER BY
    Department,
    Salary DESC