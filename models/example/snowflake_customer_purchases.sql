with customers as
(
    select *
    from {{source('sample_data_sf1','customer')}}
),
orders as
(
    select *
    from {{source('sample_data_sf1','orders')}}
)

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
-- from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
-- left join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o

from customers c
left join orders o

on c.c_custkey = o.o_custkey
{{group_by(3)}}
-- group by 
--     c.c_custkey,
--     c.c_name,
--     nation
