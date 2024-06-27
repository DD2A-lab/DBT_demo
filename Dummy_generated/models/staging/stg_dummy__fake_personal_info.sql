with source AS (SELECT *
FROM {{ source('dbt_marta', 'fake_personal_info')}})
SELECT id,
phone_numbers,
address,
birthdate,
blood_type,
favorite_color,
credit_score
FROM source