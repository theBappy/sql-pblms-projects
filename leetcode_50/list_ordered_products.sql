/* Write your T-SQL query statement below */
WITH
    FeburuaryOrderList AS (
        SELECT
            product_id,
            SUM(unit) AS total_units
        FROM
            Orders
        WHERE
            order_date BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY
            product_id
        HAVING
            SUM(unit) >= 100
    )
SELECT
    p.product_name,
    fo.total_units AS unit
FROM
    Products p
    JOIN FeburuaryOrderList fo ON p.product_id = fo.product_id