-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
-- Problem     Top Competitors
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:50 a.m.
-- Technique   multi-table-join-aggregation
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query identifies hackers with multiple full-score submissions by joining four tables and filtering for equality between submission scores and difficulty-level maximums.
-- Interview   Before: "How do I filter for full scores across different difficulty levels?" After: "Join the tables to align submission scores with difficulty maximums, then use HAVING COUNT(DISTINCT challenge_id) > 1 to isolate top performers. This runs in O(N log N) due to sorting, where N is the number of submissions."
-- Pitfalls    (1) Failing to use DISTINCT in the COUNT function, which would incorrectly count multiple full-score submissions for the same challenge.  (2) Forgetting to join the difficulty table, which is required to determine the maximum score for each challenge level.  (3) Incorrectly grouping by only hacker_id, which may cause issues in SQL dialects requiring all non-aggregated columns to be in the GROUP BY clause.
-- ──────────────────────────────────────────────────



SELECT
    h.hacker_id,
    h.name
from hackers h 
join submissions s on h.hacker_id = s.hacker_id
join challenges c on s.challenge_id = c.challenge_id
join difficulty d on c.difficulty_level = d.difficulty_level
where s.score = d.score 
GROUP BY 
    h.hacker_id,
    h.name 
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT s.challenge_id) DESC,
    h.hacker_id ASC;

