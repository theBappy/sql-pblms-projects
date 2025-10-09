SELECT
    MAX(salary) AS SecondHighestSalary
FROM
    Employee
WHERE
    Salary != (
        SELECT
            MAX(salary)
        FROM
            Employee
    )