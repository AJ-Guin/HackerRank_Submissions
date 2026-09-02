-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
-- Problem     Contest Leaderboard
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
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




