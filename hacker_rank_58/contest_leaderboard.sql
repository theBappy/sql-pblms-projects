-- Using Common Table Expression(CTE)
SET
    NOCOUNT ON;

WITH
    CTE AS (
        SELECT
            h.hacker_id,
            h.name,
            MAX(s.score) AS max_scr
        FROM
            Hackers h
            JOIN Submissions s ON h.hacker_id = s.hacker_id
        WHERE
            s.score != 0
        GROUP BY
            h.hacker_id,
            h.name,
            s.challenge_id
    )
SELECT
    hacker_id,
    name,
    SUM(max_scr)
FROM
    CTE
GROUP BY
    hacker_id,
    name
ORDER BY
    SUM(max_scr) DESC,
    hacker_id ASC go