-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true
-- Problem     SQL Project Planning
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:47 a.m.
-- Technique   window-function-grouping-gaps
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The solution identifies project boundaries by assigning a new group ID whenever the current start date does not match the previous end date.
-- Interview   Before: "How do I group consecutive date ranges?" After: "I used window functions to detect gaps in the timeline, assigning a unique ID to each contiguous block. This approach runs in O(N log N) time due to sorting, effectively handling the requirement to group tasks by consecutive dates."
-- Pitfalls    (1) Failing to use the correct window function order, which disrupts the identification of consecutive date sequences.  (2) Misinterpreting the grouping logic by using Start_Date instead of End_Date for the LAG comparison.  (3) Incorrectly ordering the final result set by failing to calculate the project duration using DATEDIFF.
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
