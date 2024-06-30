

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__enterprise_orders_base`
  OPTIONS(
      description="""This is faked generated dataset for the testing purposes only. Register of transactions taking place."""
    )
  as 

with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`enterprise_orders_base`)
SELECT date,
employee_id,
product_id,
num_items
FROM source;

