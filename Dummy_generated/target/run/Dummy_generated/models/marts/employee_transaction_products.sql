-- back compat for old kwarg name
  
  
        
    

    

    merge into `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products` as DBT_INTERNAL_DEST
        using (

with __dbt__cte__stg_dummy__enterprise_orders_base as (


with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`enterprise_orders_base`)
SELECT date,
employee_id,
product_id,
num_items
FROM source
),  __dbt__cte__stg_dummy__employees_base as (


with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`employees_base`)
SELECT id,
first_name,
last_name,
gender,
email,
age,
username,
date_added,
company_id
FROM source
),  __dbt__cte__stg_dummy__fake_personal_info as (


with source AS (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_personal_info`)
SELECT id,
phone_number,
address,
birthdate,
blood_type,
favorite_color,
credit_score
FROM source
),  __dbt__cte__int_dummy__customer_info as (


SELECT dt1.id AS employee_id,
dt1.first_name,
dt1.last_name,
dt1.gender,
dt2.birthdate,
dt1.email,
dt2.phone_number,
dt2.address,
dt1.age,
dt1.username,
dt1.date_added AS Transaction_date,
dt1.company_id,
dt2.credit_score
FROM __dbt__cte__stg_dummy__employees_base dt1
LEFT JOIN __dbt__cte__stg_dummy__fake_personal_info dt2 using(id)
),  __dbt__cte__stg_dummy__products_base as (


with source as (SELECT *
FROM `macro-campaign-427608-v7`.`dbt_marta`.`products_base`)
SELECT id,
category,
name,
price,
date_added
FROM source
) SELECT
dt1.date AS order_date,
dt1.employee_id,
dt2.first_name,
dt2.last_name,
dt2.gender,
extract(day from dt2.birthdate) AS day_of_birth,
extract(month from birthdate) AS month_of_date,
dt2.age,
dt2.email,
dt2.phone_number,
dt2.address,
dt2.username,
dt2.credit_score,
dt1.product_id,
dt3.category,
dt3.name,
dt3.price,
dt1.num_items
FROM __dbt__cte__stg_dummy__enterprise_orders_base dt1
LEFT JOIN __dbt__cte__int_dummy__customer_info dt2 using (employee_id)
LEFT JOIN __dbt__cte__stg_dummy__products_base dt3 ON dt1.product_id = dt3.id



  WHERE date >= (SELECT MAX(date) FROM `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products`)


        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`order_date`, `employee_id`, `first_name`, `last_name`, `gender`, `day_of_birth`, `month_of_date`, `age`, `email`, `phone_number`, `address`, `username`, `credit_score`, `product_id`, `category`, `name`, `price`, `num_items`)
    values
        (`order_date`, `employee_id`, `first_name`, `last_name`, `gender`, `day_of_birth`, `month_of_date`, `age`, `email`, `phone_number`, `address`, `username`, `credit_score`, `product_id`, `category`, `name`, `price`, `num_items`)


    