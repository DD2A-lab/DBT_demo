{{
	config(materialized = 'incremental')
}}

with orders as (SELECT
date AS order_date,
employee_id,
product_id,
num_items
FROM {{ref('stg_dummy__enterprise_orders_base')}}
GROUP BY 1, 2, 3, 4),
companies as (
  SELECT id AS company_id,
  name AS company_name,
  purpose AS company_purpose
  FROM {{ref('stg_dummy__companies_base')}}
  GROUP BY 1, 2, 3
),
products as (
  SELECT
  id AS product_id,
  category AS product_category,
  name AS product_name,
  price AS product_price
  FROM {{ref('stg_dummy__products_base')}}
  GROUP BY 1, 2, 3, 4
),
employees as (
  SELECT employee_id,
  company_id
  FROM {{ref('int_dummy__customer_info')}}
  GROUP BY 1, 2
)
SELECT orders.order_date,
companies.company_id,
companies.company_name,
companies.company_purpose,
orders.product_id,
products.product_category,
products.product_name,
products.product_price,
orders.num_items
FROM orders
LEFT JOIN employees using(employee_id)
LEFT JOIN companies ON employees.company_id = companies.company_id
LEFT JOIN products ON orders.product_id = products.product_id

{% if is_incremental() %}

  WHERE order_date >= (SELECT MAX(order_date) FROM {{ this }})

{% endif %}