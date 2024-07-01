{%- macro birthdate_day(date_column) -%}

	EXTRACT(DAY FROM DATE({{ date_column }}))

{%- endmacro -%}