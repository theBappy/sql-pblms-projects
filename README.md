SQL Practice & Projects

Details: Collection of SQL problems solved and SQL-focused projects — HackerRank: 58 problems, LeetCode: 50 problems.
Organized by difficulty, platform, query type, and project. Includes schemas, sample queries, and instructions to run example datasets.

🚀 About this repo

This repository contains my SQL practice (HackerRank + LeetCode) and SQL-centric projects such as a SQL Data Warehouse project, ETL pipelines, analytics dashboards, and example OLAP queries.
Goal: demonstrate SQL problem solving, query optimization, data modelling, and real-world BI/warehouse work.

📦 Repo structure (suggested)
├── README.md
├── problems/
│   ├── hackerrank/
│   │   ├── 001--sales-aggregation.sql
│   │   └── README.md
│   └── leetcode/
│       ├── 001--employees-earnings.sql
│       └── README.md
├── projects/
│   ├── sql-warehouse/
│   │   ├── schema.sql
│   │   ├── etl/
│   │   ├── reports/
│   │   └── README.md
│   └── analytics-dashboard/
├── datasets/
│   ├── sample_sales.csv
│   └── sample_customers.csv
└── docs/
    └── data-dictionary.md

🧾 Quick stats

HackerRank problems solved: 58

LeetCode problems solved: 50

Key skills: SQL (MySQL, PostgreSQL, SQL Server), Data Modeling, ETL, Window Functions, Aggregations, Indexing & Query Tuning, OLAP/OLTP design

🔍 How to read this repo
Problems

Each problem file lives in problems/<platform>/ and is named:

<index>--<short-title>--<difficulty>.sql


Example filename:

001--employee-salary-aggregation--medium.sql


Each problem SQL file should contain:

brief comment header with link to original problem

assumptions (table schemas)

the solution SQL query

optional optimized/alternate solutions and complexity notes

Example top of *.sql:

-- Problem: Employee Salary Aggregation
-- Platform: HackerRank
-- Link: https://www.hackerrank.com/...
-- Difficulty: Medium
-- Tables:
-- employees(emp_id INT, name TEXT, dept_id INT, salary NUMERIC)
-- departments(dept_id INT, dept_name TEXT)

📋 Problems index (template)

Use this markdown table in problems/README.md to track what you've solved.

HackerRank (58)
#	Title	Difficulty	Tags	Solution
001	Employee Salary Aggregation	Medium	aggregation, group-by	problems/hackerrank/001--employee-salary-aggregation--medium.sql
002	...	Easy	joins	problems/hackerrank/002--...
...				
LeetCode (50)
#	Title	Difficulty	Tags	Solution
001	Departments Top Earners	Medium	window-functions, ranking	problems/leetcode/001--departments-top-earners--medium.sql
002	...	Hard	joins, subqueries	problems/leetcode/002--...
...				

Tip: Keep the table updated with links to each solution file and the original problem URL.

🧩 Example problem entry (README snippet)
### 001 - Employee Salary Aggregation (HackerRank)
- Difficulty: Medium
- Tags: aggregation, joins
- Link: https://www.hackerrank.com/...
- Solution: `problems/hackerrank/001--employee-salary-aggregation--medium.sql`
- Notes: used GROUP BY with conditional aggregation; discussed index on (dept_id, salary) for performance.

🏗 Projects
SQL Data Warehouse (example)

Location: projects/sql-warehouse/
Description: End-to-end mini-data-warehouse example for a retail dataset. Includes staging, fact & dimension tables, simple ETL scripts, sample BI reports and OLAP queries.
