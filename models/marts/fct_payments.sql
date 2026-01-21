-- models/marts/fct_payments.sql
select
  p.customer_id,
  c.first_name,
  c.last_name,
  p.payment_method,
  sum(p.amount) as total_paid
from {{ ref('stg_payments') }} p
left join {{ ref('dim_customers') }} c
  on p.customer_id = c.customer_id
group by p.customer_id, c.first_name, c.last_name, p.payment_method
