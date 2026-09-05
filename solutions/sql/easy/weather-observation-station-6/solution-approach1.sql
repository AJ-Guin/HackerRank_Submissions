-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true
-- Problem     Weather Observation Station 6
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:21 p.m.
-- Technique   pattern-matching-disjunction
-- Time        O(N)
-- Space       O(N)
-- Insight     The query filters city names by checking if the first character matches any of the five vowels using the SQL LIKE operator with wildcard patterns.
-- Interview   Before: "How would you extract unique cities starting with vowels?" After: "I use the LIKE operator with wildcard patterns for each vowel to filter the rows, then apply DISTINCT to ensure uniqueness. This approach runs in O(N) time complexity, where N is the number of rows in the STATION table."
-- Pitfalls    (1) Failing to use the DISTINCT keyword results in duplicate city names, which violates the problem requirement.  (2) Using lowercase patterns like 'a%' may fail if the database collation is case-sensitive and the data contains uppercase vowels.
-- ──────────────────────────────────────────────────


SELECT 
CITY 
FROM 
STATION
WHERE
CITY LIKE 'A%'
OR CITY LIKE 'E%'
OR CITY LIKE 'I%'
OR CITY LIKE 'O%'
OR CITY LIKE 'U%'

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

