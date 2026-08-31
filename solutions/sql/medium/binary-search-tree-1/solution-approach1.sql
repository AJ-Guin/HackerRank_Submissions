-- ──────────────────────────────────────────────────
-- Link        https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true
-- Problem     Binary Tree Nodes
-- Difficulty  Medium
-- Subdomain   Advanced Select
-- Platform    HackerRank
-- Language    sql
-- Status      Accepted
-- Submitted   2026-08-31, 09:56 p.m.
-- Technique   case-when-subquery-classification
-- Time        O(N log N)
-- Space       O(N)
-- Insight     The query classifies nodes by checking if the parent is null for the root, or if the node value is absent from the set of all parent values for leaves.
-- Interview   Before: "How would you categorize nodes in a tree structure using SQL?" After: "I use a CASE statement to identify the root by a null parent and leaves by checking if the node exists in the parent column, resulting in O(N log N) time complexity due to the sorting requirement."
-- Pitfalls    (1) Failing to filter null values in the subquery can lead to incorrect leaf identification if the database engine handles null comparisons unexpectedly.  (2) Forgetting the ORDER BY clause violates the requirement to output node types ordered by the value of the node.
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
        
