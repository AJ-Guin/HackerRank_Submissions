-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true
-- Problem     New Companies
-- Difficulty  Medium
-- Subdomain   Advanced Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 10:11 p.m.
-- Technique   relational-join-aggregation
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query aggregates distinct counts of hierarchical entities by joining the company table with the employee table and grouping by company attributes.
-- Interview   Before: "I would join all five tables to count the hierarchy levels." After: "Joining only the company and employee tables is sufficient because the employee table contains all foreign keys for the hierarchy, resulting in O(N log N) complexity due to sorting."
-- Pitfalls    (1) Failing to use count(distinct) will result in incorrect totals because the problem statement explicitly notes that tables may contain duplicate records.  (2) Joining all tables instead of just the employee table creates unnecessary complexity and potential performance overhead.  (3) Sorting the company_code as a string is required, so numeric sorting will produce incorrect output order.
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

