-- Using CTE
SET
    NOCOUNT ON;

WITH
    CTE AS (
        SELECT
            Start_Date,
            End_Date,
            ROW_NUMBER() OVER (
                ORDER BY
                    End_Date
            ) AS rn
        FROM
            Projects
    )
SELECT
    MIN(Start_Date),
    MAX(End_Date)
FROM
    CTE
GROUP BY
    DAY (End_Date) - rn
ORDER BY
    DATEDIFF (DAY, MIN(Start_Date), MAX(End_Date)),
    1 go