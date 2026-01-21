with customers as (
  select *
  from {{ ref('stg_customers') }}
),

orders as (
  select
    customer_id,
    count(*) as total_orders,
    max(order_date) as last_order_date
  from {{ ref('stg_orders') }}
  group by customer_id
),

payments as (
  select
    customer_id,
    sum(amount) as lifetime_value
  from {{ ref('stg_payments') }}
  group by customer_id
)

select
  c.customer_id,
  c.first_name,
  c.last_name,
  coalesce(o.total_orders, 0)      as total_orders,
  o.last_order_date,
  coalesce(p.lifetime_value, 0)    as lifetime_value
from customers c
left join orders o
  on c.customer_id = o.customer_id
left join payments p
  on c.customer_id = p.customer_id
