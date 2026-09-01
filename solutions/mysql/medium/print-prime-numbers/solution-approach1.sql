-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
-- Problem     Print Prime Numbers
-- Difficulty  Medium
-- Subdomain   Alternative Queries
-- Platform    HackerRank
-- Language    mysql
-- Status      Accepted
-- Submitted   2026-09-01, 01:11 p.m.
-- Technique   recursive-cte-prime-filtering
-- Time        O(N^2)
-- Space       O(N)
-- Insight     The query generates a sequence of integers up to 1000 and filters out composite numbers by checking for divisors using a correlated subquery.
-- Interview   Before: "How would you find primes up to 1000 in SQL?" After: "I used a recursive CTE to generate the range and a NOT EXISTS clause to filter composites, resulting in O(N^2) time complexity, which is efficient enough for N=1000."
-- Pitfalls    (1) Failing to use the correct separator character '&' as specified in the problem statement.  (2) Exceeding the default group_concat_max_len limit if the range of numbers were significantly larger than 1000.  (3) Incorrectly including 1 as a prime number by failing to handle the base case of the divisor check.
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
