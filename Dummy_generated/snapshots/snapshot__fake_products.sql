{% {% snapshot snapshot__fake_products %}

{{
   config(
	   target_schema='dbt_snapshots',
	   unique_key='id',

	   strategy='check',
	   check_cols = ['category', 'name', 'price'],
   )
}}

SELECT id,
	category,
	name,
	price
	FROM {{ source('dbt_marta', 'fake_products')}}

{% endsnapshot %}%}