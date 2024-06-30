
    
    

with  __dbt__cte__stg_dummy__fake_people as (


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
), all_values as (

    select
        gender as value_field,
        count(*) as n_records

    from __dbt__cte__stg_dummy__fake_people
    group by gender

)

select *
from all_values
where value_field not in (
    'female','male','other'
)


