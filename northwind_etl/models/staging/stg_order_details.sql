with source as (
    select * from {{ ref('order_details') }}
)

select
    "orderID"       as order_id,
    "productID"     as product_id,
    "unitPrice"     as unit_price,
    quantity,
    discount
from source