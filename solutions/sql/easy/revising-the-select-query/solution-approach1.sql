-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
-- Problem     Revising the Select Query I
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 10:35 p.m.
-- Technique   select-where-clause-filtering
-- Time        O(N)
-- Space       O(1)
-- Insight     The query retrieves all columns for rows in the CITY table that satisfy both the population threshold and the country code equality constraint.
-- Interview   Before: "How do I filter rows based on multiple conditions?" After: "Use the WHERE clause with AND to combine conditions. This operation runs in O(N) time, where N is the number of rows, as it performs a linear scan to check the population and country code for each record."
-- Pitfalls    (1) Using an incorrect comparison operator like >= instead of > for the population threshold.  (2) Failing to use single quotes for the string literal 'USA' in the WHERE clause.  (3) Omitting the AND operator when attempting to filter by multiple columns.
-- ──────────────────────────────────────────────────



/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select * 
from CITY
where POPULATION > 100000 AND COUNTRYCODE = 'USA'

