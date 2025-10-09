/* Write your T-SQL query statement below */

-- Approach 2
WITH CTE1 AS (
    SELECT * FROM Accounts WHERE Income < 20000
),
CTE2 AS (
    SELECT * FROM Accounts WHERE Income BETWEEN 20000 AND 50000
),
CTE3 AS (
    SELECT * FROM Accounts WHERE Income > 50000
)
SELECT 'Low Salary' AS Category, COUNT(*) AS accounts_count FROM CTE1
UNION
SELECT 'Average Salary' AS Category, COUNT(*) AS accounts_count FROM CTE2
UNION 
SELECT 'High Salary' AS Category, COUNT(*) AS accounts_count FROM CTE3

-- Approach 2
/* Write your T-SQL query statement below */
WITH CTE_Table AS (
    SELECT  
        CASE 
            WHEN Income < 20000 THEN 'Low Salary'
            WHEN Income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN Income > 50000 THEN 'High Salary'
        END AS Category, 1 Count
    FROM Accounts
UNION ALL SELECT 'Low Salary', 0
UNION ALL SELECT 'Average Salary', 0
UNION ALL SELECT 'High Salary' , 0
)
SELECT 
    Category,
    SUM(COUNT) AS accounts_count
FROM CTE_Table
GROUP BY Category
