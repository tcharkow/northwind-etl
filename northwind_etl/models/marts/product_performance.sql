with order_details as (
    select * from {{ ref('stg_order_details') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

joined as (
    select
        p.product_id,
        p.product_name,
        sum(od.unit_price * od.quantity * (1 - od.discount)) as revenue,
        sum(od.quantity)                                       as units_sold
    from order_details od
    join products p on od.product_id = p.product_id
    group by 1, 2
)

select
    product_id,
    product_name,
    round(revenue::numeric, 2) as revenue,
    units_sold
from joined
order by revenue desc