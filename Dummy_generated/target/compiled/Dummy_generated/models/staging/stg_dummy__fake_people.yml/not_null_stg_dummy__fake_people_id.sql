
    
    



with __dbt__cte__stg_dummy__fake_people as (


with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_people`)
SELECT id,
first_name,
last_name,
gender,
email,
age,
username
FROM source
) select id
from __dbt__cte__stg_dummy__fake_people
where id is null


