SET
    NOCOUNT ON;

SELECT
    MAX(POPULATION) - MIN(POPULATION) AS difference_of_population
FROM
    CITY go