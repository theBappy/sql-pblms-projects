-- Approach 1
/* Write your T-SQL query statement below */

DECLARE @Counter INT
SELECT @Counter = COUNT(*)
FROM Product;
SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = @Counter;

-- Approach 2
/* Write your T-SQL query statement below */
SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
FROM Product
)