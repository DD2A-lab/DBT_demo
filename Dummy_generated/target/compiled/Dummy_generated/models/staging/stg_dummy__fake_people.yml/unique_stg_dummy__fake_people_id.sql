
    
    

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
), dbt_test__target as (

  select id as unique_field
  from __dbt__cte__stg_dummy__fake_people
  where id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


