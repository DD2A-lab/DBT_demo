WITH source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_companies`)
SELECT id,
name,
slogan,
purpose
FROM source