
    
    

with all_values as (

    select
        gender as value_field,
        count(*) as n_records

    from `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products`
    group by gender

)

select *
from all_values
where value_field not in (
    'female','male','other'
)


