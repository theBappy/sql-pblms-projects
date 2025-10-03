SET
    NOCOUNT ON;

WITH
    CTE AS (
        SELECT
            X,
            Y,
            ROW_NUMBER() OVER (
                ORDER BY
                    X
            ) AS rn
        FROM
            Functions
    )
SELECT DISTINCT
    c1.X,
    c1.Y
FROM
    CTE c1
    CROSS JOIN CTE c2
WHERE
    c1.X = c2.Y
    AND c1.Y = c2.X
    AND c1.X <= c1.Y
    AND c1.rn != c2.rn
ORDER BY
    c1.X ASC,
    c1.Y ASC go