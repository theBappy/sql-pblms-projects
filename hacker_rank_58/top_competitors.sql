SET
    NOCOUNT ON;

SELECT
    a.hacker_id,
    d.name
FROM
    Submissions a
    JOIN Challenges b ON a.challenge_id = b.challenge_id
    JOIN Difficulty c ON c.difficulty_level = b.difficulty_level
    JOIN Hackers d ON d.hacker_id = a.hacker_id
WHERE
    c.score = a.score
GROUP BY
    a.hacker_id,
    d.name
HAVING
    COUNT(a.challenge_id) > 1
ORDER BY
    COUNT(a.challenge_id) DESC,
    a.hacker_id ASC go