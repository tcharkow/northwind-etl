with source as (
    select * from {{ ref('orders') }}
)

select
    "orderID"                       as order_id,
    "customerID"                    as customer_id,
    "employeeID"                    as employee_id,
    "orderDate"::date               as order_date,
    "requiredDate"::date            as required_date,
    "shippedDate"::date             as shipped_date,
    "shipVia"                       as shipper_id,
    freight
from source