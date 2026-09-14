# Write your MySQL query statement below
select id,
case
    when p_id is null then "Root"
    when id not in(
        select p_id
            from tree
            where p_id is not NULL
    ) then "Leaf"
    else "Inner"
END as type
from Tree;