-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true
-- Problem     Binary Tree Nodes
-- Difficulty  Medium
-- Subdomain   Advanced Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:56 p.m.
-- ──────────────────────────────────────────────────


SELECT
n,
case
    when p is null then 'Root'
    when n not in (
        select p from 
        bst where p is not null
    ) then 'Leaf'
    else 'Inner'
end
from bst
order by n;
        
