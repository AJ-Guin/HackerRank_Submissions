-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
-- Problem     Weather Observation Station 3
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:20 p.m.
-- Technique   distinct-modulo-filtering
-- Time        O(N)
-- Space       O(N)
-- Insight     The query filters the STATION table for rows where the ID is divisible by two and applies a distinct constraint to remove duplicate city names.
-- Interview   Before: "How would you retrieve unique city names for even IDs?" After: "I used SELECT DISTINCT with a modulo operator to filter even IDs, resulting in O(N) time complexity to scan the table and identify unique entries."
-- Pitfalls    (1) Failing to use the DISTINCT keyword results in duplicate city names being returned if multiple stations share the same city name.  (2) Using an incorrect modulo operator or syntax for the specific SQL dialect can cause execution errors.
-- ──────────────────────────────────────────────────



SELECT DISTINCT CITY FROM STATION WHERE ID % 2 = 0;




/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

