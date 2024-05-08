{% macro margin_percent(revenue,margin) %}
round(safe_divide(margin,revenue),2)
{% endmacro %}