select 
    call_id,
    endpoint,
    charindex('s',endpoint) as s_position
from api_calls
WHERE LOWER(method) = 'post'
order by call_id, s_position
