## dbt Models

### Staging
| Model | Description |
|---|---|
| `stg_orders` | Cleaned orders with typed dates |
| `stg_order_details` | Line items per order |
| `stg_products` | Product catalog |
| `stg_customers` | Customer details |
| `stg_suppliers` | Supplier details |

### Marts
| Model | Description |
|---|---|
| `revenue_by_month` | Monthly revenue trends |
| `product_performance` | Revenue and units sold per product |
| `customer_ltv` | Lifetime value per customer |

## Tech Stack

- Python 3.11
- PostgreSQL 16
- dbt 1.8.0
- FastAPI
- Pandas
- Uvicorn

## Setup

1. Clone this repository
2. Create a virtual environment: `python -m venv venv`
3. Activate it: `source venv/bin/activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Start PostgreSQL and seed data: `dbt seed`
6. Run dbt models: `dbt run`
7. Start the API: `uvicorn main:app --reload`

## Dataset

Northwind — a classic sales dataset with 830 orders, 91 customers, and 77 products spanning 1996–1998.

## Deployment

API deployed on Render. Dashboard deployed on Vercel.