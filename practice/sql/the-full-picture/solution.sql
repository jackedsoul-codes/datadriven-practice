with payroll as
(
select
    department,
    sum(salary) as total_payroll
from employees
group by department
),
q1_metric as 
(
select
    department,
    coalesce(sum(case when fiscal_quarter='Q1' then metric_value end),0) as q1_metric_total
from employee_metrics
group by department
)
select
  p.department,
  total_payroll,
  q1_metric_total
from payroll p
join q1_metric q
on p.department=q.department
