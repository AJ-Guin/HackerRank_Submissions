-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/select-all-sql/problem?isFullScreen=true
-- Problem     Select All
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 10:36 p.m.
-- Technique   select-all-columns
-- Time        O(N)
-- Space       O(N)
-- Insight     The query retrieves every attribute for every record present in the CITY table by utilizing the wildcard operator.
-- Interview   Before: "How do I fetch all data from a table?" After: "Use the SELECT * syntax to retrieve all columns for every row in O(N) time, where N is the number of rows in the CITY table."
-- Pitfalls    (1) Using SELECT * in production environments can lead to performance degradation by retrieving unnecessary columns.  (2) The wildcard operator does not allow for column filtering or specific ordering of the result set.
-- ──────────────────────────────────────────────────


SELECT * FROM CITY
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

