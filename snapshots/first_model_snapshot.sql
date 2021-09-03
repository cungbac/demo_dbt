{% snapshot first_model_snapshot %}
    {{
        config(
            target_database = 'demo_dbt',
            target_schema = 'snapshots',
            unique_key = 'id',

            strategy = 'timestamp',
            updated_at = 'updated_at'
        )
    }}

    select * from {{ref('my_first_dbt_model')}}

{% endsnapshot %}
