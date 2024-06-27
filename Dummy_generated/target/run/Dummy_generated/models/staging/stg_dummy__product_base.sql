

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__product_base`
  OPTIONS()
  as with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`products_base`)
SELECT id,
category,
name,
price,
added
FROM source;

