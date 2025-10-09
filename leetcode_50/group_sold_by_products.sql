SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG (product, ',') WITHIN GROUP (
        ORDER BY
            Product
    ) AS products
FROM
    (
        SELECT DISTINCT
            sell_date,
            product
        FROM
            Activities
    ) t
GROUP BY
    sell_date
ORDER BY
    sell_date