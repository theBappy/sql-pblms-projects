/* Write your T-SQL query statement below */
WITH
    CTE AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY
                    customer_id
                ORDER BY
                    order_date
            ) AS rn
        FROM
            Delivery
    )
SELECT
    ROUND(
        100.00 * (
            SUM(
                CASE
                    WHEN order_date = customer_pref_delivery_date THEN 1
                    ELSE 0
                END
            )
        ) / COUNT(*),
        2
    ) AS immediate_percentage
FROM
    CTE
WHERE
    rn = 1