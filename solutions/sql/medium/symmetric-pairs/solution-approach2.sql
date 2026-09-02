-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
-- Problem     Symmetric Pairs
-- Difficulty  Medium
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:46 a.m.
-- Technique   self-join-union-aggregation
-- Time        O(N^2)
-- Space       O(N)
-- Insight     The query identifies symmetric pairs by joining the table with itself to find cross-matches where X1 < Y1, then appends cases where X equals Y that appear at least twice.
-- Interview   Before: "How do you handle pairs where X equals Y?" After: "I use a UNION to combine the cross-joined pairs with a grouped count check for identical values, ensuring O(N^2) complexity while satisfying the X1 <= Y1 constraint."
-- Pitfalls    (1) Failing to handle the X=Y case separately leads to duplicate rows or missing pairs when only one instance exists.  (2) Ignoring the X1 <= Y1 constraint results in redundant output pairs like (20, 21) and (21, 20).  (3) Using a simple join without the count check for X=Y fails to identify symmetric pairs when only one instance of a value exists.
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


