{{
	config(materialized='ephemeral',
	tags=['base-table'])
}}

WITH source AS (
	SELECT *
	FROM {{ source('dbt_marta', 'companies_base') }}
)
SELECT id,
name,
slogan,
purpose,
date_added
FROM source