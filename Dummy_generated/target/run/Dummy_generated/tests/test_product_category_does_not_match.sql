select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

SELECT order_date,
product_id,
product_category,
product_name
FROM `macro-campaign-427608-v7`.`dbt_marta`.`companies_transaction_products`
WHERE product_category <> "Computers" AND product_name LIKE "%Computer%"
      
    ) dbt_internal_test