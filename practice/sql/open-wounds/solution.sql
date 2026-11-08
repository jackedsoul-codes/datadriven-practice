with unresolved as 
(
select
  *
from alert_events
where resolved is NULL
),
rn as (
select
  svc_name,
  alert_id,
  severity,
  status,
  fired_at,
  row_number() over (partition by svc_name order by fired_at) as rn
from unresolved
)
select
  * except (rn)
from rn
where rn=1
