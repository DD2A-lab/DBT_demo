with source as (SELECT *
FROM {{ source('dbt_marta', 'fake_people')}})
SELECT id,
date_added,
company_id
FROM source