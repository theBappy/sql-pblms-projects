-- Approach 1
SET
    NOCOUNT ON;

SELECT
    MAX(salary * months),
    COUNT(*)
FROM
    Employee
WHERE
    salary * months = (
        SELECT
            MAX(salary * months)
        FROM
            Employee
    ) go


-- Approach 2
SET
    NOCOUNT ON;

SELECT
    TOP 1 (salary * months),
    COUNT(*)
FROM
    Employee
GROUP BY
    (salary * months)
ORDER BY
    (salary * months) DESC go