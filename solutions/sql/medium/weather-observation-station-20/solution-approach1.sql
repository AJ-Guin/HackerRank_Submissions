-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- Problem     Weather Observation Station 20
-- Difficulty  Medium
-- Subdomain   Aggregation
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-01, 10:57 a.m.
-- ──────────────────────────────────────────────────


SELECT top 1
    cast(percentile_cont(0.5) within group (order by lat_n)
    over() as decimal(16,4))
FROM
station

