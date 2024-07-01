





with validation_errors as (

    select
        order_date, company_id, product_id
    from `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products`
    group by order_date, company_id, product_id
    having count(*) > 1

)

select *
from validation_errors


