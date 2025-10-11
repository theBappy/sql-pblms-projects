/* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            *,
            COUNT(LAT) OVER (
                PARTITION BY
                    Lat,
                    Lon
            ) CountLatLon,
            COUNT(tiv_2015) OVER (
                PARTITION BY
                    tiv_2015
            ) AS CountT_2015
        FROM
            Insurance T1
    )
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    CTE
WHERE
    CountLatLon = 1
    AND CountT_2015 > 1