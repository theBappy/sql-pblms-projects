SET
    NOCOUNT ON;

SELECT
    w.id,
    p.age,
    w.coins_needed,
    w.power
FROM
    Wands w
    JOIN Wands_Property p ON w.code = p.code
WHERE
    p.is_evil = 0
    AND w.coins_needed = (
        SELECT
            MIN(w1.coins_needed)
        FROM
            Wands w1
            JOIN Wands_Property p1 ON w1.code = p1.code
        WHERE
            w1.power = w.power
            AND p1.age = p.age
    )
ORDER BY
    w.power DESC,
    p.age DESC go