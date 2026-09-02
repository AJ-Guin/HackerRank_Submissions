-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true
-- Problem     Placements
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:45 a.m.
-- Technique   multi-table-join-cte
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query joins student, friend, and salary tables to compare a student's salary against their best friend's salary, filtering for higher friend earnings before sorting by the friend's salary.
-- Interview   Before: "How would you compare related records across three tables?" After: "I use multiple joins to align student, friend, and salary data. By calculating the salary difference in a CTE, I can filter and sort in O(N log N) time, ensuring the friend's salary is strictly greater than the student's."
-- Pitfalls    (1) Joining the packages table twice without distinct aliases for the student's salary and the friend's salary causes ambiguous column references.  (2) Failing to join the friends table correctly results in missing the best friend's ID mapping.  (3) Ordering by the student's salary instead of the friend's salary violates the problem's output requirement.
-- ──────────────────────────────────────────────────


WITH cte AS (
    SELECT
    s.name as name,
    own_p.salary as own_salary,
    frnd_p.salary as frnd_salary
    from students s join 
    friends f on s.id = f.id
    join packages own_p on s.id = own_p.id
    join packages frnd_p on f.friend_id = frnd_p.id  
)
select name from cte
where own_salary < frnd_salary
order by  frnd_salary;

    
    
    
    
    
    
