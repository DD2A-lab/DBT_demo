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

with orders as (SELECT date,
employee_id,
product_id,
sum(num_items) AS num_items
FROM {{ref('stg_dummy__enterprise_orders_base')}}
GROUP BY date, employee_id, product_id),
employee as (
	SELECT employee_id,
	first_name,
	last_name,
	gender,
	{{ birthdate_day('birthdate') }} AS day_of_birth,
	{{ birthdate_month('birthdate') }} AS month_of_birth,
	age,
	email,
	phone_number,
	address,
	username,
	credit_score
	FROM {{ref('int_dummy__customer_info')}}
	GROUP BY  employee_id,
	first_name,
	last_name,
	gender,
	birthdate,
	age,
	email,
	phone_number,
	address,
	username,
	credit_score
),
products as (
	SELECT id,
	category,
	name,
	price
	FROM {{ref('stg_dummy__products_base')}}
	GROUP BY id,
	category,
	name,
	price
)
SELECT
dt1.date AS order_date,
dt1.employee_id,
dt2.first_name,
dt2.last_name,
dt2.gender,
day_of_birth,
month_of_birth,
dt2.age,
dt2.email,
dt2.phone_number,
dt2.address,
dt2.username,
dt2.credit_score,
dt1.product_id,
dt3.category,
dt3.name,
dt3.price,
dt1.num_items
FROM orders dt1
LEFT JOIN employee dt2 using (employee_id)
LEFT JOIN products dt3 ON dt1.product_id = dt3.id

{% if is_incremental() %}

  WHERE date > (SELECT MAX(date) FROM {{ this }})

{% endif %}

