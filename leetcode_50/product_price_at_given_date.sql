/* Write your T-SQL query statement below */
SELECT
    Product_id,
    FIRST_VALUE (new_price) OVER (
        PARTITION BY
            Product_id
        ORDER BY
            change_date DESC
    ) AS price
FROM
    Products
WHERE
    Change_date <= '2019-08-16'
UNION
SELECT
    Product_id,
    10 AS Price
FROM
    Products
GROUP BY
    Product_id
HAVING
    MIN(change_date) > '2019-08-16'