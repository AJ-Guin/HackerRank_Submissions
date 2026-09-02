-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true
-- Problem     SQL Project Planning
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:47 a.m.
-- ──────────────────────────────────────────────────


WITH TaskGroups AS (
    SELECT 
        Start_Date,
        End_Date,
        CASE 
            WHEN Start_Date = LAG(End_Date) OVER (ORDER BY Start_Date)
                THEN 0
            ELSE 1
        END AS new_project
    FROM Projects
),
ProjectNumbers AS (
    SELECT 
        Start_Date,
        End_Date,
        SUM(new_project) OVER (
            ORDER BY Start_Date 
            ROWS UNBOUNDED PRECEDING
        ) AS project_id
    FROM TaskGroups
)
SELECT 
    MIN(Start_Date) AS Start_Date,
    MAX(End_Date) AS End_Date
FROM ProjectNumbers
GROUP BY project_id
ORDER BY 
    DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)),
    MIN(Start_Date);
