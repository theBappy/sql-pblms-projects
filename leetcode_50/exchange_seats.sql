/* Write your T-SQL query statement below */
SELECT
    id,
    CASE
        WHEN id % 2 = 1 THEN COALESCE(
            LEAD(student) OVER(ORDER BY id),
            student
        )
        ELSE LAG(student) OVER(ORDER BY id)
    END student
FROM Seat


/* Write your T-SQL query statement below */
SELECT
    CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 = 1 AND id + 1 NOT IN(SELECT Id FROM Seat) THEN id
        ELSE id + 1
    END AS id,
    student
FROM Seat
ORDER BY Id

