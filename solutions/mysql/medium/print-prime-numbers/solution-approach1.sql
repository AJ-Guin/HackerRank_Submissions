-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
-- Problem     Print Prime Numbers
-- Difficulty  Medium
-- Subdomain   Alternative Queries
-- Platform    HackerRank
-- Language    mysql
-- Status      Accepted
-- Submitted   2026-09-01, 01:11 p.m.
-- ──────────────────────────────────────────────────

with recursive temp as (
select 2 as n
union all
select n+1 from temp
where n+1 <=1000
),
prime as (
select n from temp
    -- contions for prime no
where not exists (
    SELECT 1 FROM temp AS d
    WHERE d.n < temp.n AND temp.n % d.n = 0
)
)
select group_concat(n SEPARATOR '&') from prime
