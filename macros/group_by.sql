{% macro group_by(n) %}
    group by
        {% for i in range(1,n+1) %}
            {{i}}
            {% if not loop.last %} , {% endif %}
        {% endfor %}
{% endmacro %}            

-- example
-- group_by(5) = GROUP BY 1, 2, 3, 4, 5