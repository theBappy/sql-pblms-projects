/* Write your T-SQL query statement below */
SELECT
    p.product_id,
    ROUND(
        SUM(price * ISNULL (units, 0)) * 1.0 / ISNULL (SUM(units), 1),
        2
    ) AS average_price
FROM
    Prices p
    LEFT JOIN UnitsSold u ON p.product_id = u.product_id
WHERE
    purchase_date BETWEEN start_date AND end_date
GROUP BY
    p.product_id