-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- Problem     Weather Observation Station 20
-- Difficulty  Medium
-- Subdomain   Aggregation
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-01, 10:57 a.m.
-- Technique   percentile-cont-window-function
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query utilizes the percentile_cont window function to calculate the median of the LAT_N column by interpolating between the two middle values if the dataset size is even.
-- Interview   Before: "How would you calculate the median in SQL without manual sorting?" After: "I would use the percentile_cont(0.5) window function, which handles both odd and even row counts efficiently in O(N log N) time, ensuring the result is rounded to four decimal places as required."
-- Pitfalls    (1) The percentile_cont function is not supported in all SQL dialects, such as older versions of MySQL.  (2) Failing to cast the result to a decimal type may result in default precision that does not meet the four decimal place requirement.
-- ──────────────────────────────────────────────────


SELECT top 1
    cast(percentile_cont(0.5) within group (order by lat_n)
    over() as decimal(16,4))
FROM
station

