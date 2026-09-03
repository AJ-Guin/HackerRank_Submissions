-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true
-- Problem     Placements
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 11:21 p.m.
-- Technique   multi-table-join-filtering
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query joins students with their friends and respective salary packages to filter for pairs where the friend's salary exceeds the student's salary, then sorts by the friend's salary.
-- Interview   Before: "How would you compare salaries across related entities?" After: "I use multiple joins to align student and friend data with their respective salary records, then apply a filter and sort. This approach runs in O(N log N) time due to the final sort operation."
-- Pitfalls    (1) Failing to join the Packages table twice, once for the student and once for the friend, prevents the necessary salary comparison.  (2) Ordering by the student's salary instead of the friend's salary violates the specific output requirement.  (3) Using an inner join on the wrong ID column can lead to incorrect salary associations between students and their best friends.
-- ──────────────────────────────────────────────────


with cte as (
    select
        s.name, 
        f.id,
        f.friend_id,
        p.salary as friend_salary
    from friends f join packages p on f.friend_id = p.id
    join students s on s.id = f.id
)
select 
    c.name
from cte c join packages p on c.id = p.id  
where c.friend_salary > p.salary
order by c.friend_salary;
