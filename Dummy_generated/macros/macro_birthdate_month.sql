{%- macro birthdate_month(date_column) -%}

	EXTRACT(MONTH FROM DATE({{ date_column }}))

{%- endmacro -%}