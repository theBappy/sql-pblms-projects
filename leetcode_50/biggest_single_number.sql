/* Write your T-SQL query statement below */
SELECT
    COALESCE(
        (
            SELECT
                Top 1 num
            FROM
                MyNumbers
            GROUP BY
                num
            HAVING
                COUNT(*) = 1
            ORDER BY
                num DESC
        ),
        null
    ) AS num;