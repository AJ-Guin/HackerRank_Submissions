-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true
-- Problem     Placements
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 11:21 p.m.
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
