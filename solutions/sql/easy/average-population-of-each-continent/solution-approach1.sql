-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
-- Problem     Average Population of Each Continent
-- Difficulty  Easy
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 10:34 p.m.
-- Technique   inner-join-group-by-floor
-- Time        O(N + M)
-- Space       O(N + M)
-- Insight     The query performs an inner join on matching country codes, aggregates city populations by continent, and applies the floor function to the resulting average.
-- Interview   Before: "How would you calculate the average population per continent?" After: "I join the tables on the country code, group by continent, and use FLOOR(AVG(population)) to meet the rounding requirement. This approach runs in O(N + M) time, where N and M are the sizes of the CITY and COUNTRY tables."
-- Pitfalls    (1) Using ROUND instead of FLOOR, which violates the requirement to round down to the nearest integer.  (2) Failing to join on the correct matching key columns, CITY.CountryCode and COUNTRY.Code.  (3) Omitting the GROUP BY clause, which prevents the calculation of averages per continent.
-- ──────────────────────────────────────────────────


SELECT
o.continent,
FLOOR(AVG(c.population))
from city c join country o on c.countrycode = o.code 
GROUP BY
o.continent;


/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

