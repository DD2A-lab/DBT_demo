
    
    



with __dbt__cte__stg_dummy__fake_companies as (


WITH source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_companies`)
SELECT id,
name,
slogan,
purpose
FROM source
) select id
from __dbt__cte__stg_dummy__fake_companies
where id is null


