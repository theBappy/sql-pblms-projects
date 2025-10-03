SET
    NOCOUNT ON;

SELECT
    CAST(
        ROUND(
            (MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W)),
            4
        ) AS DECIMAL(10, 4)
    )
FROM
    STATION go