with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

joined as (
    select
        date_trunc('month', o.order_date)::date     as month,
        sum(od.unit_price * od.quantity * (1 - od.discount)) as revenue
    from orders o
    join order_details od on o.order_id = od.order_id
    group by 1
)

select
    month,
    round(revenue::numeric, 2) as revenue
from joined
order by month