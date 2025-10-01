SET
    NOCOUNT ON;

SELECT
    CASE
        WHEN A = B
        AND B = C
        AND C = A Then 'Equilateral'
        WHEN A + B <= C
        OR B + C <= A
        OR C + A <= B THEN 'Not A   Triangle'
        WHEN A = B
        OR B = C
        OR C = A THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM
    TRIANGLES;

go