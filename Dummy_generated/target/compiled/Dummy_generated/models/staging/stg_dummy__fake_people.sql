

with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_people`)
SELECT id,
first_name,
last_name,
gender,
email,
age,
username
FROM source