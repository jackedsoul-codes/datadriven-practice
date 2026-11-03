with trans
as
(
select
  t.*,
  category
from transactions t
join products p
on t.product_id = p.product_id
),
self as
(
select
    t1.category,
    t1.user_id as user1,
    t2.user_id as user2,
    count(*) as shared_categories
from trans t1
join trans t2
on t1.category = t2.category
and t1.user_id < t2.user_id
group by 1,2,3
)
select * from self
