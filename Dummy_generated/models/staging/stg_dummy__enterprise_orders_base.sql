with source as (SELECT *
FROM {{ source('dbt_marta', 'enterprise_orders_base') }})
SELECT date,
employee_id,
product_id,
num_items
FROM source