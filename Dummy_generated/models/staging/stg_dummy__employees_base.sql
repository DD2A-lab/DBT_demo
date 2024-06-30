{{
	config(materialized='ephemeral',
	tags=['base-table'])
}}

with source AS (SELECT *
FROM {{ source('dbt_marta', 'employees_base')}})
SELECT id,
first_name,
last_name,
gender,
email,
age,
username,
date_added,
company_id
FROM source