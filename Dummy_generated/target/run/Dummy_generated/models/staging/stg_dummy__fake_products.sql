

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__fake_products`
  OPTIONS()
  as with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_products`)
SELECT id,
category,
name,
price
FROM source;

