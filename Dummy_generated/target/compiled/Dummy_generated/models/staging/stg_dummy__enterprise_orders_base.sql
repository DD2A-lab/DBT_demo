

with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`enterprise_orders_base`)
SELECT date,
employee_id,
product_id,
num_items
FROM source