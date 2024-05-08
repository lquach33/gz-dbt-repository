WITH find_month AS(
SELECT date_date,
DATE_TRUNC(date_date, MONTH) as datemonth
FROM  {{ref('finance_campaigns_day')}}
)

SELECT find_month.datemonth,
ROUND(SUM(fc.ads_margin),2) as ads_margin,
ROUND(SUM(fc.average_basket),2) as average_basket,
ROUND(SUM(fc.operational_margin),2) as operational_margin
FROM find_month
JOIN
{{ref('finance_campaigns_day')}} as fc
USING(date_date)
GROUP BY 1