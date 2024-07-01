select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with  __dbt__cte__stg_dummy__fake_products as (


with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_products`)
SELECT id,
category,
name,
price
FROM source
), child as (
    select product_id as from_field
    from `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products`
    where product_id is not null
),

parent as (
    select id as to_field
    from __dbt__cte__stg_dummy__fake_products
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test