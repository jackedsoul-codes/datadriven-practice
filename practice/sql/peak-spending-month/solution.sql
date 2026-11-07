with bill as 
(
select
  date_format(bill_date,'%Y-%m') as billing_month,
  sum(amount) as total_spend
from cloud_costs
group by 1
)
select
  billing_month,
  total_spend
from bill
order by 2 desc
limit 1
