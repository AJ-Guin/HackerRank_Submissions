-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
-- Problem     African Cities
-- Difficulty  Easy
-- Subdomain   Basic Join
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-09-03, 10:34 p.m.
-- Technique   inner-join-filter
-- Time        O(N + M)
-- Space       O(N + M)
-- Insight     The query performs an inner join between the city and country tables on matching country codes to filter records by the continent attribute.
-- Interview   Before: "How would you retrieve city names based on a specific continent?" After: "I use an inner join on the shared country code column to link the tables, then apply a where clause to filter by continent, resulting in O(N + M) time complexity."
-- Pitfalls    (1) Failing to use the correct join condition between CITY.CountryCode and COUNTRY.Code will result in an incorrect Cartesian product.  (2) Omitting the table alias or prefix when selecting the name column can cause ambiguity errors if both tables contain a name column.
-- ──────────────────────────────────────────────────


select 
c.name
from city c join 
country o on c.countrycode = o.code 
where o.continent = 'Africa';
/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

