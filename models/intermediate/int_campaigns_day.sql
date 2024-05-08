SELECT date_date,
round(sum(ads_cost),2) as ads_cost,
round(sum(impression),2) as ads_impression,
round(sum(click),2) as ads_click
FROM {{ref('int_campaigns')}}
GROUP BY 1
ORDER BY 1 DESC