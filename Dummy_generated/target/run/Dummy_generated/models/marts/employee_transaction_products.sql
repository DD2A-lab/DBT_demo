

  create or replace view `macro-campaign-427608-v7`.`dbt_marta`.`employee_transaction_products`
  OPTIONS()
  as SELECT
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
FROM `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__enterprise_orders_base` dt1
LEFT JOIN `macro-campaign-427608-v7`.`dbt_marta`.`int_dummy__customer_info` dt2 using (employee_id)
LEFT JOIN `macro-campaign-427608-v7`.`dbt_marta`.`stg_dummy__products_base` dt3 ON dt1.product_id = dt3.id
WHERE date >= date_sub(current_date(), INTERVAL 31 day);

