-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
-- Problem     Ollivander's Inventory
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
-- Technique   common-table-expression-aggregation-join
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query identifies the minimum cost for each unique combination of age and power using a CTE, then filters the original inventory to match these specific minimums.
-- Interview   Before: "I would try to filter the wands directly in one pass." After: "That fails because you need the minimum coins per group. I used a CTE to aggregate the minimums first, resulting in O(N log N) time complexity due to the final sort, which handles the power and age requirements correctly."
-- Pitfalls    (1) Failing to filter is_evil = 0 in both the CTE and the final join leads to incorrect results including dark arts wands.  (2) Grouping by age and power without including coins_needed in the CTE prevents identifying the correct minimum cost for each wand category.  (3) Incorrectly sorting by power and age in ascending order instead of descending order violates the problem's specific output requirements.
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
