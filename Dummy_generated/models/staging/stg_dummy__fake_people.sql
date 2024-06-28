{{
	config(materialized='ephemeral')
}}

with source as (SELECT *
FROM {{ source('dbt_marta', 'fake_people')}})
SELECT id,
first_name,
last_name,
gender,
email,
age,
username
FROM source