
-- Check c_mktsegment 
-- select case when c_mktsegment not in ('BUILDING','AUTOMOBILE','MACHINERY','HOUSEHOLD','FURNITURE') then 1 else 0 end as check_mktsegment
-- from {{ref('playing_with_tests')}}
-- where check_mktsegment = 1
    
-- Check sum c_acctbal
select case when sum(c_acctbal) > 100000000 then 1 else 0 end as check_sum_acctbal
from {{ref('playing_with_tests')}}
having check_sum_acctbal = 0