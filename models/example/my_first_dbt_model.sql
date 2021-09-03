
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- Test ephemeral materialized
-- {{ config(materialized='ephemeral') }}

{{config(materialized='table', 
        alias ='first_model',
        tags = ['{{this}}','example']) }}
        -- post_hook='grant select on {{this}} to role analyst')}}

-- with source_data as (

--     select 1 as id
--     union all
--     select null as id
--     union all
--     select 4 as id

-- )


-- select *, {{ var('my_first_variable') }} as my_first_variable
-- from source_data
-- where id >= {{ var('my_second_variable') }}
/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null


-- Snapshots
with source_data as 
(
    select 1 as id, 'NY' as state, '2020-02-01 00:01:00.000'::timestamp as updated_at
    union all
    select null as id, 'CT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at
    union all
    select 3 as id, 'VT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at
)

select *
from source_data