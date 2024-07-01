{{
	config(materialized = 'incremental',
	partition_by={
			"field": "order_date",
			"data_type": "date",
			"granularity": "day"
		},
	tags=['final_product']
	)
}}

with orders as (SELECT
date AS order_date,
employee_id,
product_id,
sum(num_items) AS num_items
FROM {{ref('stg_dummy__enterprise_orders_base')}}
GROUP BY 1, 2, 3),
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
), joined_together as
(SELECT orders.order_date,
companies.company_id,
companies.company_name,
companies.company_purpose,
orders.product_id,
products.product_category,
products.product_name,
products.product_price,
orders.num_items,
products.product_price * orders.num_items AS total_revenue
FROM orders
LEFT JOIN employees using(employee_id)
LEFT JOIN companies ON employees.company_id = companies.company_id
LEFT JOIN products ON orders.product_id = products.product_id)
SELECT order_date,
company_id,
company_name,
company_purpose,
product_id,
product_category,
product_name,
{%- for cat in dbt_utils.get_column_values(table = ref('stg_dummy__products_base'), column = 'category') %}
SUM(IF(product_category = '{{ cat }}', total_revenue, 0)) AS total_sold_{{cat.lower()}}{% if not loop.last %},{% endif -%}
{% endfor %}
FROM joined_together
GROUP BY order_date,
company_id,
company_name,
company_purpose,
product_id,
product_category,
product_name

{% if is_incremental() %}

  WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})

{% endif %}