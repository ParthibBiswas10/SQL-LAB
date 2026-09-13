# Write your MySQL query statement below

WITH first_login as (
    select player_id, MIN(event_date) as fd
    from Activity
    group by player_id
)

select round(

(select count(*)
from activity a
join first_login f
on 
    a.player_id=f.player_id
    AND a.event_date=DATE_ADD(f.fd, INTERVAL 1 day)
)/ (select count(*) from first_login)
,2) as fraction;