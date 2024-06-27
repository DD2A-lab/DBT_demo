

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__employees_base`
  OPTIONS()
  as with source AS (SELECT *
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
FROM source;

