with source as (
    select * from {{ ref('suppliers') }}
)

select
    "supplierID"    as supplier_id,
    "companyName"   as company_name,
    "contactName"   as contact_name,
    "contactTitle"  as contact_title,
    address,
    city,
    region,
    "postalCode"    as postal_code
from source