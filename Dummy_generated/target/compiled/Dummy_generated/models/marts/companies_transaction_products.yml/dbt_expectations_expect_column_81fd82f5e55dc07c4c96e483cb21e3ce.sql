with relation_columns as (

        
        select
            cast('ORDER_DATE' as STRING) as relation_column,
            cast('DATE' as STRING) as relation_column_type
        union all
        
        select
            cast('COMPANY_ID' as STRING) as relation_column,
            cast('INT64' as STRING) as relation_column_type
        union all
        
        select
            cast('COMPANY_NAME' as STRING) as relation_column,
            cast('STRING' as STRING) as relation_column_type
        union all
        
        select
            cast('COMPANY_PURPOSE' as STRING) as relation_column,
            cast('STRING' as STRING) as relation_column_type
        union all
        
        select
            cast('PRODUCT_ID' as STRING) as relation_column,
            cast('INT64' as STRING) as relation_column_type
        union all
        
        select
            cast('PRODUCT_CATEGORY' as STRING) as relation_column,
            cast('STRING' as STRING) as relation_column_type
        union all
        
        select
            cast('PRODUCT_NAME' as STRING) as relation_column,
            cast('STRING' as STRING) as relation_column_type
        union all
        
        select
            cast('PRODUCT_PRICE' as STRING) as relation_column,
            cast('FLOAT64' as STRING) as relation_column_type
        union all
        
        select
            cast('NUM_ITEMS' as STRING) as relation_column,
            cast('INT64' as STRING) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'COMPANY_ID'
            and
            relation_column_type not in ('NUMERIC')

    )
    select *
    from test_data