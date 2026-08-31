-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true
-- Problem     New Companies
-- Difficulty  Medium
-- Subdomain   Advanced Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 10:11 p.m.
-- ──────────────────────────────────────────────────



select 
    c.company_code,
    c.founder,
    count(distinct e.lead_manager_code),
    count(distinct e.senior_manager_code),
    count(distinct e.manager_code),
    count(distinct e.employee_code)
FROM company c join employee e on c.company_code = e.company_code
GROUP BY
    c.company_code,
    founder
ORDER BY 
    company_code;
    



/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

