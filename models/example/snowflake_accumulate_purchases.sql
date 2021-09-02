{{ config(materialized = 'table', alias = 'accumulated_purchases')}}


with 
totalprice as
  (
    select o_orderdate as date, sum(o_totalprice) as total
    from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
    group by o_orderdate
    order by o_orderdate asc
  )
select 
    t.date, 
    t.total,
    sum(t.total) over (order by t.date) as accummulate
from totalprice t