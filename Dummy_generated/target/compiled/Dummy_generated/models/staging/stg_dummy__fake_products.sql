

with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_products`)
SELECT id,
category,
name,
price
FROM source