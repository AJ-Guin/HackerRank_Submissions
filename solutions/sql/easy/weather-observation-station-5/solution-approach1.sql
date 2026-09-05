-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
-- Problem     Weather Observation Station 5
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:20 p.m.
-- Technique   cte-top-n-sorting
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The solution uses common table expressions to isolate the shortest and longest city names by sorting by length and then lexicographically to handle ties.
-- Interview   Before: "How would you find the extreme values in a dataset with tie-breaking rules?" After: "I used two CTEs with TOP 1 and ORDER BY clauses to extract the extremes in O(N log N) time, ensuring the lexicographical tie-break rule is satisfied by the secondary sort key."
-- Pitfalls    (1) Failing to include the secondary alphabetical sort key in the ORDER BY clause leads to incorrect results when multiple cities share the same minimum or maximum length.  (2) Using LIMIT instead of TOP 1 in environments like SQL Server will cause a syntax error, as the problem requires specific dialect compatibility.
-- ──────────────────────────────────────────────────


WITH shortest AS (
    SELECT TOP 1
        CITY,
        LEN(CITY) AS CITY_LENGTH
    FROM STATION
    ORDER BY LEN(CITY), CITY
),
longest AS (
    SELECT TOP 1
        CITY,
        LEN(CITY) AS CITY_LENGTH
    FROM STATION
    ORDER BY LEN(CITY) DESC, CITY
)
SELECT CITY, CITY_LENGTH
FROM shortest
UNION ALL
SELECT CITY, CITY_LENGTH
FROM longest;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

