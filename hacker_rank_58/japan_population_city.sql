SET
    NOCOUNT ON;

SELECT
    SUM(POPULATION) AS total_population
FROM
    CITY
WHERE
    CountryCode = 'JPN' go