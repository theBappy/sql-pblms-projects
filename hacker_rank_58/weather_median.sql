-- Approach 1
SET
    NOCOUNT ON;

SELECT
    CAST(ROUND(AVG(LAT_N), 4) AS DECIMAL(10, 4)) AS MedianLat
FROM
    (
        SELECT
            LAT_N,
            COUNT(*) OVER () AS n,
            ROW_NUMBER() OVER (
                ORDER BY
                    LAT_N
            ) AS rn
        FROM
            STATION
        WHERE
            LAT_N > 0
    ) t
WHERE
    rn = (n + 1) / 2
    OR rn = (n + 2) / 2 go