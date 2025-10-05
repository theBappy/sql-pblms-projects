SELECT
    name
FROM
    Employee e
    INNER JOIN (
        SELECT
            managerId
        FROM
            Employee
        GROUP BY
            managerId
        HAVING
            COUNT(*) >= 5
    ) t ON e.id = t.managerId