with source as (
    select * from {{ ref('customers') }}
)

select
    "customerID"    as customer_id,
    "companyName"   as company_name,
    "contactName"   as contact_name,
    "contactTitle"  as contact_title,
    address,
    city,
    region,
    "postalCode"    as postal_code
from source