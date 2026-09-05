-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true
-- Problem     Weather Observation Station 1
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:19 p.m.
-- Technique   basic-select-projection
-- Time        O(N)
-- Space       O(N)
-- Insight     The query performs a direct projection of two specific columns from the entire STATION table without filtering or sorting.
-- Interview   Before: "How do I retrieve specific columns from a table?" After: "You use the SELECT statement followed by the column names. This operation has O(N) time complexity as it scans all N rows in the STATION table to return the requested CITY and STATE fields."
-- Pitfalls    (1) Selecting columns in the wrong order relative to the problem requirements.  (2) Including unnecessary columns that were not requested in the prompt.
-- ──────────────────────────────────────────────────


SELECT CITY, STATE FROM STATION;
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

