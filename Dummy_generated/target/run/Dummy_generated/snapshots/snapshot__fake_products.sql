
      
  
    

    create or replace table `macro-campaign-427608-v7`.`dbt_snapshots`.`snapshot__fake_products`
      
    
    

    OPTIONS()
    as (
      

    select *,
        to_hex(md5(concat(coalesce(cast(id as string), ''), '|',coalesce(cast(
    current_timestamp()
 as string), '')))) as dbt_scd_id,
        
    current_timestamp()
 as dbt_updated_at,
        
    current_timestamp()
 as dbt_valid_from,
        nullif(
    current_timestamp()
, 
    current_timestamp()
) as dbt_valid_to
    from (
        



SELECT id,
	category,
	name,
	price
	FROM `macro-campaign-427608-v7`.`dbt_marta`.`fake_products`

    ) sbq



    );
  
  