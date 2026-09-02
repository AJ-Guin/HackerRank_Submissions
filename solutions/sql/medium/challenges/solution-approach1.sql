-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
-- Problem     Challenges
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:49 a.m.
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

