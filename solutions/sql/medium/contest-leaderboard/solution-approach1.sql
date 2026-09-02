-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
-- Problem     Contest Leaderboard
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
-- Technique   cte-aggregation-group-by
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query calculates the maximum score per challenge for each hacker using a CTE, then aggregates these maximums to compute the total score while filtering out zero-score participants.
-- Interview   Before: "How would you handle multiple submissions for the same challenge?" After: "I use a CTE to group by hacker and challenge to isolate the maximum score first, then aggregate. This ensures O(N log N) complexity while correctly excluding zero-score hackers as required by the problem statement."
-- Pitfalls    (1) Failing to filter out hackers with a total score of zero using the HAVING clause.  (2) Incorrectly summing all submission scores instead of only the maximum score per challenge.  (3) Sorting by total score descending and then hacker_id ascending as specified in the requirements.
-- ──────────────────────────────────────────────────


with MaxScores AS (
    SELECT 
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
)
SELECT
    h.hacker_id,
    h.name,
    sum(m.max_score) AS total_score
from hackers h 
JOIN MaxScores m 
    ON h.hacker_id = m.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(m.max_score) > 0
ORDER BY total_score DESC, h.hacker_id ASC;




