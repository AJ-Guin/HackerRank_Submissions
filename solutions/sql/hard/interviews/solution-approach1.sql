-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=true
-- Problem     Interviews
-- Difficulty  Hard
-- Subdomain   Advanced Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:30 a.m.
-- ──────────────────────────────────────────────────


SELECT
    c.contest_id,
    c.hacker_id,
    c.name,
    SUM(ISNULL(s.total_submissions, 0)) AS total_submissions,
    SUM(ISNULL(s.total_accepted_submissions, 0)) AS total_accepted_submissions,
    SUM(ISNULL(v.total_views, 0)) AS total_views,
    SUM(ISNULL(v.total_unique_views, 0)) AS total_unique_views
FROM contests c

JOIN colleges co
    ON c.contest_id = co.contest_id

JOIN challenges ch
    ON co.college_id = ch.college_id

LEFT JOIN
(
    SELECT
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM submission_stats
    GROUP BY challenge_id
) s ON ch.challenge_id = s.challenge_id
LEFT JOIN
(
    SELECT
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM view_stats
    GROUP BY challenge_id
) v ON ch.challenge_id = v.challenge_id
GROUP BY
    c.contest_id,
    c.hacker_id,
    c.name

HAVING
    SUM(ISNULL(s.total_submissions, 0))
    + SUM(ISNULL(s.total_accepted_submissions, 0))
    + SUM(ISNULL(v.total_views, 0))
    + SUM(ISNULL(v.total_unique_views, 0)) > 0

ORDER BY
    c.contest_id;
    
