-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
-- Problem     Symmetric Pairs
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:35 a.m.
-- ──────────────────────────────────────────────────


SELECT
    f1.x,f1.y
from Functions f1
JOIN Functions f2
    ON f1.X = f2.Y
    AND f1.Y = f2.X
WHERE f1.X < f1.Y
UNION
SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) > 1
ORDER BY X;


