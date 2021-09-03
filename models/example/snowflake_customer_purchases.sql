select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
-- from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
-- left join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o

from {{source('sample_data','customer')}} c
left join {{source('sample_data','orders')}} o

on c.c_custkey = o.o_custkey
group by 
    c.c_custkey,
    c.c_name,
    nation