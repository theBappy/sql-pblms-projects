SET
    NOCOUNT ON;

SELECT
    AVG(POPULATION) AS average_population
FROM
    CITY
WHERE
    DISTRICT = 'California' go