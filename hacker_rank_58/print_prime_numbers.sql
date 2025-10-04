-- Approach 1
SET NOCOUNT ON;
WITH Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 1000
)SELECT
    STRING_AGG(CAST(n AS VARCHAR), '&') AS primes
FROM Numbers x 
WHERE NOT EXISTS(
    SELECT 1 FROM Numbers y
    WHERE y.n > 1
    AND y.n < x.n
    AND x.n % y.n = 0
) OPTION (MAXRECURSION 1000)
go

-- Approach 2(Optimization of previous one)
SET NOCOUNT ON;
WITH Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 1000
),
Divisors AS (
    SELECT n AS divisor
    FROM Numbers
)
SELECT STRING_AGG(CAST(x.n AS VARCHAR(10)), '&') AS primes
FROM Numbers x
WHERE NOT EXISTS (
    SELECT 1
    FROM Divisors y
    WHERE y.divisor > 1
      AND y.divisor * y.divisor <= x.n   
      AND x.n % y.divisor = 0
)
OPTION (MAXRECURSION 1000, RECOMPILE);   
go