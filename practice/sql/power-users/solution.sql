with session as 
(
select
    user_id,
    count(distinct session_id) as sessions
from user_sessions
group by user_id
having sessions >= 3
)
select
  username,
  sessions
from session s
join users u
on s.user_id = u.user_id
order by sessions desc
