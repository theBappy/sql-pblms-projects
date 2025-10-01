SET
    NOCOUNT ON;

SELECT
    SUM(C.POPULATION) AS total_population
FROM
    CITY C
    LEFT JOIN Country Cou ON C.CountryCode = Cou.Code
WHERE
    CONTINENT = 'Asia' go