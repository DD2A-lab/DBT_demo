{{
	config(materialized='ephemeral',
	tags=['base-table'])
}}

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
FROM {{ref("stg_dummy__employees_base")}} dt1
LEFT JOIN {{ref('stg_dummy__fake_personal_info')}} dt2 using(id)