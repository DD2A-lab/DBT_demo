WITH source AS (SELECT *
FROM {{source('dbt_marta', 'fake_companies')}})
SELECT id,
name,
slogan,
purpose
FROM source