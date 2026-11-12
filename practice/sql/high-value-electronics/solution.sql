select
    product_name,
    price
from products
where in_stock = 1
and category = 'Electronics'
order by price desc
limit 5
