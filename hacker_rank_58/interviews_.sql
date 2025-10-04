SET
    NOCOUNT ON;

WITH
    SubmissionSummary AS (
        SELECT
            challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM
            Submission_Stats
        GROUP BY
            challenge_id
    ),
    ViewSummary AS (
        SELECT
            challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM
            View_Stats
        GROUP BY
            challenge_id
    )
SELECT
    c.contest_id,
    c.hacker_id,
    c.name,
    COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(vs.total_views), 0) AS total_views,
    COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM
    Contests AS c
    LEFT JOIN Colleges AS col ON c.contest_id = col.contest_id
    LEFT JOIN Challenges AS ch ON ch.college_id = col.college_id
    LEFT JOIN SubmissionSummary AS ss ON ss.challenge_id = ch.challenge_id
    LEFT JOIN ViewSummary AS vs ON vs.challenge_id = ch.challenge_id
GROUP BY
    c.contest_id,
    c.hacker_id,
    c.name
HAVING
    NOT (
        COALESCE(SUM(ss.total_submissions), 0) = 0
        AND COALESCE(SUM(ss.total_accepted_submissions), 0) = 0
        AND COALESCE(SUM(vs.total_views), 0) = 0
        AND COALESCE(SUM(vs.total_unique_views), 0) = 0
    )
ORDER BY
    c.contest_id go