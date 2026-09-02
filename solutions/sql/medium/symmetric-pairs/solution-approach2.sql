-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
-- Problem     Symmetric Pairs
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:44 a.m.
-- ──────────────────────────────────────────────────


SELECT
    f1.x,f1.y
from Functions f1
JOIN Functions f2
    ON f1.x = f2.y
    and f1.y = f2.x
where f1.x < f1.y
UNION
SELECT x, y
from Functions
where x=y
GROUP by x,y
having count(*) > 1
ORDER by x;


