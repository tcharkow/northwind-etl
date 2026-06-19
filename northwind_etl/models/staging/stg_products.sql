with source as (
    select * from {{ ref('products') }}
)

select
    "productID"         as product_id,
    "productName"       as product_name,
    "supplierID"        as supplier_id,
    "categoryID"        as category_id,
    "quantityPerUnit"   as quantity_per_unit,
    "unitPrice"         as unit_price,
    "unitsInStock"      as units_in_stock,
    "unitsOnOrder"      as units_on_order
from source