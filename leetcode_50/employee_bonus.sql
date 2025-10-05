-- Approach 1
/* Write your T-SQL query statement below */
SELECT
    e.name,
    b.bonus
FROM
    Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
WHERE
    b.bonus < 1000
    OR b.bonus IS NULL
    -- Approach 2
    /* Write your T-SQL query statement below */
SELECT
    e.name,
    b.bonus
FROM
    Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
WHERE
    ISNULL (b.bonus, 0) < 1000