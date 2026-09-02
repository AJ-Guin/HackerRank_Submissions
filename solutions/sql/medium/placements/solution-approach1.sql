-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true
-- Problem     Placements
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:45 a.m.
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

    
    
    
    
    
    
