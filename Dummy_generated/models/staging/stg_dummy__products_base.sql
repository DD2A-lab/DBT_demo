{{
	config(materialized='view',
	tags=['base-table'])
}}

with source as (SELECT *
FROM {{ source('dbt_marta', 'products_base')}})
SELECT id,
category,
name,
price,
date_added
FROM source