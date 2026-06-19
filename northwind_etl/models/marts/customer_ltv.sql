with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

joined as (
    select
        c.customer_id,
        c.company_name,
        c.city,
        c.region,
        count(distinct o.order_id)                                as total_orders,
        sum(od.unit_price * od.quantity * (1 - od.discount))      as lifetime_revenue
    from customers c
    join orders o on c.customer_id = o.customer_id
    join order_details od on o.order_id = od.order_id
    group by 1, 2, 3, 4
)

select
    customer_id,
    company_name,
    city,
    region,
    total_orders,
    round(lifetime_revenue::numeric, 2) as lifetime_revenue
from joined
order by lifetime_revenue desc