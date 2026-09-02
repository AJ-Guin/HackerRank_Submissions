-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
-- Problem     The Report
-- Difficulty  Medium
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-02, 10:50 a.m.
-- Technique   cross-join-range-filter
-- Time        O(N * M)
-- Space       O(N)
-- Insight     The query maps student marks to grade ranges using a cross join with a range filter, then applies conditional logic to mask names and sort based on the grade threshold.
-- Interview   Before: "How do I join tables without a common key?" After: "Use a cross join with a range filter on the marks column. This O(N * M) approach correctly handles the grade-based sorting requirements and the conditional NULL name requirement for grades below 8."
-- Pitfalls    (1) Failing to use a cross join with a range filter results in missing grade assignments for students.  (2) Incorrectly ordering by name when the grade is below 8 violates the requirement to sort by marks ascending.  (3) Omitting the conditional logic for the name column causes names to appear for students with grades lower than 8.
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
