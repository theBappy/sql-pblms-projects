SET
    NOCOUNT ON;

-- Step 1: Prepare submissions with hacker info, day number, and submission streak
WITH
    cte1 AS (
        SELECT
            s.submission_date, -- submission date
            s.submission_id, -- unique submission ID
            s.hacker_id, -- hacker who submitted
            h.name, -- hacker name
            DAY (s.submission_date) AS day_num, -- day of the month (1-15)
            -- Rank submissions per hacker in order of submission date to track streak
            DENSE_RANK() OVER (
                PARTITION BY
                    s.hacker_id
                ORDER BY
                    s.submission_date
            ) AS rnk
        FROM
            submissions s
            JOIN hackers h ON h.hacker_id = s.hacker_id
        WHERE
            s.submission_date BETWEEN '2016-03-01' AND '2016-03-15'
    ),
    -- Step 2: Count unique hackers who submitted consecutively starting from Day 1
    cte2 AS (
        SELECT
            submission_date,
            COUNT(DISTINCT hacker_id) AS unique_h_count
        FROM
            cte1
            -- Only include hackers whose submission streak matches the day number
        WHERE
            day_num = rnk
        GROUP BY
            submission_date
    ),
    -- Step 3: Count total submissions per hacker per day
    cte3 AS (
        SELECT
            submission_date,
            hacker_id,
            COUNT(submission_id) AS s_count
        FROM
            cte1
        GROUP BY
            submission_date,
            hacker_id
    ),
    -- Step 4: Identify the hacker with maximum submissions per day
    cte4 AS (
        SELECT
            *,
            -- Assign row number so that rn = 1 is the hacker with max submissions per day
            ROW_NUMBER() OVER (
                PARTITION BY
                    submission_date
                ORDER BY
                    s_count DESC,
                    hacker_id ASC
            ) AS rn
        FROM
            cte3
    )
    -- Step 5: Final output
SELECT
    cte4.submission_date, -- the date of submission
    cte2.unique_h_count, -- number of hackers with submissions every day from Day 1
    cte4.hacker_id, -- hacker with max submissions
    h.name -- name of hacker
FROM
    cte4
    JOIN hackers h ON h.hacker_id = cte4.hacker_id
    JOIN cte2 ON cte2.submission_date = cte4.submission_date
    -- Only take the hacker with max submissions per day
WHERE
    rn = 1
ORDER BY
    cte4.submission_date;

go