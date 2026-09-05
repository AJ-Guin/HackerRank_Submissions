-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
-- Problem     Weather Observation Station 7
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:21 p.m.
-- Technique   distinct-pattern-matching
-- Time        O(N)
-- Space       O(N)
-- Insight     The query filters unique city names by checking if the final character matches any vowel using the SQL LIKE operator with a wildcard prefix.
-- Interview   Before: "How would you extract unique cities ending in specific characters?" After: "I use the DISTINCT keyword to remove duplicates and a series of OR conditions with the LIKE operator to identify vowels, resulting in O(N) time complexity where N is the number of rows in the STATION table."
-- Pitfalls    (1) Failing to use DISTINCT results in duplicate city names, violating the problem requirement.  (2) Using incorrect wildcard placement like 'A%' instead of '%A' fails to target the end of the string.
-- ──────────────────────────────────────────────────


SELECT DISTINCT 
CITY
FROM 
STATION
WHERE
CITY LIKE '%A'
OR CITY LIKE '%E'
OR CITY LIKE '%I'
OR CITY LIKE '%O'
OR CITY LIKE '%U'
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

