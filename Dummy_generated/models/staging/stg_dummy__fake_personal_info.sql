{{
	config(materialized='ephemeral')
}}

with source AS (SELECT *
FROM {{ source('dbt_marta', 'fake_personal_info')}})
SELECT id,
phone_number,
address,
birthdate,
blood_type,
favorite_color,
credit_score
FROM source