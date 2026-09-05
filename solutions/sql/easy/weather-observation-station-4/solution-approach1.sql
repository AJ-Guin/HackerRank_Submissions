-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true
-- Problem     Weather Observation Station 4
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:20 p.m.
-- Technique   aggregate-difference-calculation
-- Time        O(N)
-- Space       O(N)
-- Insight     The query calculates the difference between the total count of city entries and the count of unique city entries by subtracting the result of two aggregate functions.
-- Interview   Before: "How would you find the number of duplicate city names in a table?" After: "I would subtract the count of distinct city names from the total count of city entries, which runs in O(N) time complexity to scan the table."
-- Pitfalls    (1) Failing to account for NULL values in the CITY column, as COUNT(CITY) excludes them while COUNT(DISTINCT CITY) also ignores them.  (2) Assuming the result is always positive when the table could be empty, resulting in a NULL or zero difference.
-- ──────────────────────────────────────────────────


SELECT COUNT(CITY) - COUNT(DISTINCT CITY) AS difference
FROM STATION;
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

