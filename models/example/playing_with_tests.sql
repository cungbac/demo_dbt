{{ config(materialized = 'table')}}

-- select * 
-- -- from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF001"."CUSTOMER"
-- from {{source('sample_data_sf001','customer')}}

with sample_customer as 
(
    select * from {{source('sample_data_sf001','customer')}}
)

select
    c_custkey,
    c_mktsegment,
    {{rename_segments('c_mktsegment')}} mkt_segment_adjusted
from sample_customer c