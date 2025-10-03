SET
    NOCOUNT ON;

WITH
    CTE AS (
        SELECT
            Hackers.hacker_id AS hacker_id,
            Hackers.name AS name,
            COUNT(Challenges.challenge_id) AS cnt
        FROM
            Hackers
            JOIN Challenges ON Hackers.hacker_id = Challenges.hacker_id
        GROUP BY
            Hackers.hacker_id,
            Hackers.name
    )
SELECT
    hacker_id,
    name,
    cnt
FROM
    (
        SELECT
            hacker_id,
            name,
            cnt,
            MAX(cnt) OVER () AS mx,
            COUNT(*) OVER (
                PARTITION BY
                    cnt
            ) AS freq
        FROM
            CTE
    ) t
WHERE
    cnt = mx
    OR freq = 1
ORDER BY
    cnt DESC,
    hacker_id go