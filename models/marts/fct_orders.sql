-- models/marts/fct_orders.sql
select
  o.customer_id,
  c.first_name,
  c.last_name,
  o.order_date,
  o.status
from {{ ref('stg_orders') }} o
left join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id