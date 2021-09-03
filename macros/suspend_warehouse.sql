{% macro suspend(warehouse_name) %}

    {% set sql %}
        -- alter warehouse {{warehouse}} suspend
        alter warehouse {{warehouse}} resume
    {% endset %}

    {% set table = run_query(sql)%} -- execute query
    {% do table.print_table() %} -- print result

{% endmacro %}