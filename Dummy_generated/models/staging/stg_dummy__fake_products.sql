{{
	config(materialized='ephemeral')
}}

with source AS (SELECT *
FROM {{source('dbt_marta', 'fake_products')}})
SELECT id,
category,
name,
price
FROM source