WITH source AS (
	SELECT *
	FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_personal_info`
)
SELECT id,
phone_number,
address,
birthdate,
blood_type,
favorite_color,
credit_score
FROM source