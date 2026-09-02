-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
-- Problem     Symmetric Pairs
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:35 a.m.
-- Technique   self-join-union-aggregation
-- Time        O(N^2)
-- Space       O(N)
-- Insight     The query identifies symmetric pairs by joining the table with itself to find cross-matches where X1=Y2 and X2=Y1, while separately handling identical pairs using aggregation to ensure they appear at least twice.
-- Interview   Before: "How do I handle pairs where X equals Y?" After: "Use a UNION to combine distinct symmetric pairs with identical pairs that appear more than once, ensuring O(N^2) complexity while satisfying the X1 <= Y1 constraint."
-- Pitfalls    (1) Failing to use GROUP BY and HAVING COUNT(*) > 1 for identical pairs results in missing cases where X equals Y.  (2) Omitting the X1 < Y1 condition in the join leads to duplicate rows for non-identical symmetric pairs.  (3) Ordering by X is required by the problem statement to ensure the output sequence is correct.
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


