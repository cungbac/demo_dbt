with source_store_sales as
(
    select * from {{source('snowflake_sample','store_sales')}}
)

select count(*) as count from source_store_sales