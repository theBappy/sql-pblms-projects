SET
    NOCOUNT ON;

WITH
    CTE AS (
        SELECT
            s.ID,
            s.NAME,
            p.Salary,
            f.Friend_ID
        FROM
            Students s
            INNER JOIN Friends f ON s.ID = f.ID
            INNER JOIN Packages p ON p.ID = s.ID
    )
SELECT
    c.NAME
FROM
    CTE c
    INNER JOIN Packages g ON c.Friend_ID = g.ID
WHERE
    c.Salary < g.Salary
ORDER BY
    g.Salary go