-- Approach (With Common Table Expression + Left Join)
WITH
    CompanyHierarchy AS (
        SELECT
            C.company_code,
            C.founder,
            COUNT(DISTINCT L.lead_manager_code) AS lead_count,
            COUNT(DISTINCT S.senior_manager_code) AS senior_count,
            COUNT(DISTINCT M.manager_code) AS manager_count,
            COUNT(DISTINCT E.employee_code) AS employee_count
        FROM
            Company AS C
            LEFT JOIN Lead_Manager L ON L.company_code = C.company_code
            LEFT JOIN Senior_Manager S ON S.company_code = C.company_code
            LEFT JOIN Manager M ON M.company_code = C.company_code
            LEFT JOIN Employee E ON E.company_code = C.company_code
        GROUP BY
            C.company_code,
            C.founder
    )
SELECT
    company_code,
    founder,
    lead_count,
    senior_count,
    manager_count,
    employee_count
FROM
    CompanyHierarchy
ORDER BY
    company_code