-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true
-- Problem     Japanese Cities' Attributes
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:27 p.m.
-- Technique   select-all-with-filter
-- Time        O(N)
-- Space       O(N)
-- Insight     The query retrieves all columns for every record in the CITY table that matches the specified country code filter.
-- Interview   Before: "How do I extract specific rows based on a column value?" After: "Use the WHERE clause to filter by the COUNTRYCODE column. This operation runs in O(N) time, where N is the number of rows in the table, as it requires a full scan to identify all Japanese cities."
-- Pitfalls    (1) Failing to use single quotes for the string literal 'JPN' will cause a syntax error.  (2) Assuming the table contains only Japanese cities without applying the COUNTRYCODE filter will return incorrect results.
-- ──────────────────────────────────────────────────


SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN'
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

