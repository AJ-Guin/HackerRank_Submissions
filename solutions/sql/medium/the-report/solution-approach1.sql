-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- Problem     The Report
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:50 a.m.
-- ──────────────────────────────────────────────────


SELECT
    iif(g.grade >= 8, s.name, null),
    g.grade,
    s.marks
from students s cross join grades g 
where s.marks between g.min_mark and g.max_mark 
ORDER by 
    g.grade desc,
    iif(g.grade >= 8, s.name, null),
    iif(g.grade <8, s.marks, null);
