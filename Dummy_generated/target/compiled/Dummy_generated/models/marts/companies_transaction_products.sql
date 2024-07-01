

with  __dbt__cte__stg_dummy__enterprise_orders_base as (


with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`enterprise_orders_base`)
SELECT date,
employee_id,
product_id,
num_items
FROM source
),  __dbt__cte__stg_dummy__companies_base as (


WITH source AS (
	SELECT *
	FROM `macro-campaign-427608-v7`.`dbt_marta`.`companies_base`
)
SELECT id,
name,
slogan,
purpose,
date_added
FROM source
),  __dbt__cte__stg_dummy__products_base as (


with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`products_base`)
SELECT id,
category,
name,
price,
date_added
FROM source
),  __dbt__cte__stg_dummy__employees_base as (


with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`employees_base`)
SELECT id,
first_name,
last_name,
gender,
email,
age,
username,
date_added,
company_id
FROM source
),  __dbt__cte__stg_dummy__fake_personal_info as (


with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_personal_info`)
SELECT id,
phone_number,
address,
birthdate,
blood_type,
favorite_color,
credit_score
FROM source
),  __dbt__cte__int_dummy__customer_info as (


SELECT dt1.id AS employee_id,
dt1.first_name,
dt1.last_name,
dt1.gender,
dt2.birthdate,
dt1.email,
dt2.phone_number,
dt2.address,
dt1.age,
dt1.username,
dt1.date_added AS Transaction_date,
dt1.company_id,
dt2.credit_score
FROM __dbt__cte__stg_dummy__employees_base dt1
LEFT JOIN __dbt__cte__stg_dummy__fake_personal_info dt2 using(id)
), orders as (SELECT
date AS order_date,
employee_id,
product_id,
sum(num_items) AS num_items
FROM __dbt__cte__stg_dummy__enterprise_orders_base
GROUP BY 1, 2, 3),
companies as (
  SELECT id AS company_id,
  name AS company_name,
  purpose AS company_purpose
  FROM __dbt__cte__stg_dummy__companies_base
  GROUP BY 1, 2, 3
),
products as (
  SELECT
  id AS product_id,
  category AS product_category,
  name AS product_name,
  price AS product_price
  FROM __dbt__cte__stg_dummy__products_base
  GROUP BY 1, 2, 3, 4
),
employees as (
  SELECT employee_id,
  company_id
  FROM __dbt__cte__int_dummy__customer_info
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
orders.num_items,
products.product_price * orders.num_items AS total_revenue
FROM orders
LEFT JOIN employees using(employee_id)
LEFT JOIN companies ON employees.company_id = companies.company_id
LEFT JOIN products ON orders.product_id = products.product_id

