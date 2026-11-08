with bronze as 
(
select
  amount,
  dense_rank() over (order by amount desc) as rn
from cloud_costs
)
select distinct
  amount
  from bronze
  where rn<=3
