

WITH source AS (
	SELECT *
	FROM `macro-campaign-427608-v7`.`dbt_marta`.`companies_base`
)
SELECT id,
name,
slogan,
purpose,
date_added
FROM source