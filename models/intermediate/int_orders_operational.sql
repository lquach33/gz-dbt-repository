SELECT
  orders_margin.orders_id
  ,orders_margin.date_date
  ,ROUND(orders_margin.margin + ship.shipping_fee - ship.logcost + CAST(ship.ship_cost as FLOAT64),2) AS operational_margin 
  ,orders_margin.quantity
  ,orders_margin.revenue
  ,orders_margin.purchase_cost
  ,orders_margin.margin
  ,ship.shipping_fee
  ,ship.logcost
  ,ship.ship_cost
FROM {{ref('int_orders_margin')}} orders_margin
join {{ref('stg_raw__ship')}} ship
  using(orders_id)
ORDER BY orders_id desc