-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/japanese-cities-name/problem?isFullScreen=true
-- Problem     Japanese Cities' Names
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:27 p.m.
-- Technique   conditional-column-projection
-- Time        O(N)
-- Space       O(N)
-- Insight     The query filters the CITY table by matching the COUNTRYCODE column against the literal string 'JPN' and projects only the NAME column.
-- Interview   Before: "How do I extract specific city names based on a country code?" After: "Use a SELECT clause to project the NAME column and a WHERE clause to filter by COUNTRYCODE = 'JPN'. This operation runs in O(N) time relative to the number of rows in the table."
-- Pitfalls    (1) Failing to use single quotes for the string literal 'JPN' will cause a syntax error in standard SQL.  (2) Selecting the wrong column instead of NAME will result in an incorrect output format.
-- ──────────────────────────────────────────────────


SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN'
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

