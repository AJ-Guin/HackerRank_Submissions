-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
-- Problem     Revising the Select Query II
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:25 p.m.
-- Technique   conditional-projection-filtering
-- Time        O(N)
-- Space       O(N)
-- Insight     The query filters the dataset by applying a logical conjunction to the population and country code attributes before projecting the name column.
-- Interview   Before: "How would you retrieve specific city names based on multiple criteria?" After: "I use a WHERE clause with AND to filter rows by population and country code, resulting in O(N) time complexity where N is the number of rows in the table."
-- Pitfalls    (1) Failing to use the exact string literal 'USA' for the CountryCode column.  (2) Using an incorrect comparison operator instead of the strictly greater than operator for the population threshold of 120000.
-- ──────────────────────────────────────────────────


SELECT 
    NAME
FROM CITY
WHERE 
    POPULATION > 120000 AND COUNTRYCODE = 'USA'
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

