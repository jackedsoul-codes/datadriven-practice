with product as 
(
select
  product_id,
  date_format(transaction_date,'%Y-%m') as month,
  sum(total_amount) as monthly_total
from transactions
where product_id is not null
group by 1,2
)
select
  *,
  sum(monthly_total) over (partition by product_id order by month) as cumulative_total
from product
