with trans as 
(
select
    date_format(transaction_date,'%Y-%m') as month,
    product_name,
    sum(quantity) as total_quantity
from transactions t
join products p
on t.product_id = p.product_id
and p.in_stock=1
group by 1,2
),
ranked as
(
select
  *,
  dense_rank() over (partition by month order by total_quantity desc) as rn
from trans
)
select
    month,
    product_name,
    total_quantity,
    rn as rnk
from ranked r
where rn <= 3
order by month, rnk
