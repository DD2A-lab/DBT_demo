

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__fake_people`
  OPTIONS()
  as with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_people`)
SELECT id,
date_added,
company_id
FROM source;

