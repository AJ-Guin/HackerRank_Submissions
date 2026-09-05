-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
-- Problem     Weather Observation Station 5
-- Difficulty  Easy
-- Subdomain   Basic Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-05, 01:20 p.m.
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

