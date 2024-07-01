select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from `macro-campaign-427608-v7`.`dbt_marta`.`companies_transaction_products`

where not(total_revenue >= product_price)


      
    ) dbt_internal_test