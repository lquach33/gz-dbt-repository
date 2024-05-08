with sales_margin as (select product.products_id as products_id
    ,product.purchase_price as price
    ,sales.date_date as date_date
    ,sales.orders_id as orders_id
    ,sales.quantity as quantity
    ,sales.revenue as revenue
    ,ROUND(CAST(product.purchase_price as FLOAT64)*sales.quantity,2) as purchase_cost
    ,ROUND(sales.revenue - CAST(product.purchase_price as FLOAT64)*sales.quantity,2) as margin
from {{ref('stg_raw__product')}} as product
join 
    {{ref('stg_raw__sales')}} as sales
using (products_id))
select*,
{{ margin_percent('revenue','margin') }} as margin_pourcentage
from sales_margin
