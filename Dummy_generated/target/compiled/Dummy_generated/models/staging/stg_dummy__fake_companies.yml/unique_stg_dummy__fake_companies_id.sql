
    
    

with  __dbt__cte__stg_dummy__fake_companies as (


WITH source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_companies`)
SELECT id,
name,
slogan,
purpose
FROM source
), dbt_test__target as (

  select id as unique_field
  from __dbt__cte__stg_dummy__fake_companies
  where id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


