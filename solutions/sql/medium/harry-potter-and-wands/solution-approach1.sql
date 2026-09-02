-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
-- Problem     Ollivander's Inventory
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
-- ──────────────────────────────────────────────────



with cte as (
    select
        p.age,
        w.power,
        min(w.coins_needed) as coins_needed
    from wands w join wands_property p ON w.code = p.code
    where is_evil = 0
    group by p.age, w.power
)
select
    w.id,
    p.age,
    w.coins_needed,
    w.power
from wands w join wands_property p 
on w.code = p.code
join cte c 
on c.age = p.age
and c.power = w.power
and c.coins_needed = w.coins_needed
where p.is_evil=0
ORDER BY
w.power DESC, p.age DESC;
