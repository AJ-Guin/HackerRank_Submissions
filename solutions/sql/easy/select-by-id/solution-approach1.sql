-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true
-- Problem     Select By ID
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:26 p.m.
-- Technique   select-where-clause
-- Time        O(N)
-- Space       O(1)
-- Insight     The query filters the CITY table by matching the ID column against the literal value 1661 to retrieve all associated row attributes.
-- Interview   Before: "How would you retrieve a specific record by its primary key?" After: "I would use a SELECT statement with a WHERE clause to filter by the ID. This operation runs in O(N) time complexity, where N is the number of rows in the table, as it performs a linear scan to find the matching ID."
-- Pitfalls    (1) Failing to use the correct column name ID as specified in the table schema.  (2) Using incorrect syntax for the WHERE clause which is required to filter rows by specific criteria.
-- ──────────────────────────────────────────────────


SELECT * FROM CITY WHERE ID = '1661'
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

