

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`src_dummy__employee_base`
  OPTIONS()
  as WITH source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`employees_base`)
SELECT id,
date_added,
company_id
FROM source;

