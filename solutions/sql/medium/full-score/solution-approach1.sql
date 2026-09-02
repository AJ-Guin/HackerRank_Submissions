-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
-- Problem     Top Competitors
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:50 a.m.
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

