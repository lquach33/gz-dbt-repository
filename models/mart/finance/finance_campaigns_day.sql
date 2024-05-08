{{config(materialized='table')}}

SELECT 
    f.date_date,
    ROUND(SUM(f.operational_margin - c.ads_cost), 2) AS ads_margin,
    f.average_basket,
    f.operational_margin
FROM 
    {{ref('finance_days')}} AS f
JOIN 
    {{ref('int_campaigns_day')}} AS c 
ON f.date_date = c.date_date 
GROUP BY 
    f.date_date, c.ads_cost, f.operational_margin, f.average_basket
ORDER BY f.date_date DESC