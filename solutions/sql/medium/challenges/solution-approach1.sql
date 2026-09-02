-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
-- Problem     Challenges
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
-- Technique   group-by-having-subquery-filtering
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query filters hackers by retaining those whose challenge count matches the global maximum or is a unique frequency value among all hackers.
-- Interview   Before: "I would join the tables and filter by count." After: "I used a subquery to identify the maximum count and another to find unique counts, ensuring O(N log N) complexity while correctly excluding non-unique counts less than the maximum as required."
-- Pitfalls    (1) Failing to exclude hackers with duplicate challenge counts that are less than the maximum.  (2) Incorrectly sorting by name instead of hacker_id when challenge counts are equal.  (3) Omitting the group-by clause on hacker_id and name, which causes aggregation errors.
-- ──────────────────────────────────────────────────


SELECT
    h.hacker_id,
    h.name,
    count(*) as no_challenges
from hackers h join challenges c on h.hacker_id = c.hacker_id
GROUP by h.hacker_id, h.name
HAVING COUNT(*) = (
    SELECT MAX(challenge_count)
    FROM (
        SELECT COUNT(*) AS challenge_count
        FROM Challenges
        GROUP BY hacker_id
    ) counts
)
OR count(*) in (
    SELECT challenge_count
    from (
        SELECT count(*) as challenge_count
        from challenges
        GROUP by  hacker_id
    ) counts
    GROUP by challenge_count
    HAVING count(*) = 1
)
ORDER BY no_challenges DESC, h.hacker_id;
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

