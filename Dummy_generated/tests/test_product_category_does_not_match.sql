{{config(severity = "warn")}}

SELECT order_date,
product_id,
product_category,
product_name
FROM {{ref('companies_transaction_products')}}
WHERE product_category <> "Computers" AND product_name LIKE "%Computer%"