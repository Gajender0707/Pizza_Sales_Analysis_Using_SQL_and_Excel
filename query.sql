## KPI requirments


use pizza_sales_database;


select * from pizza_sales;

#kpi-1: total Revenue
select round(sum(total_price),2) total_revenue
from pizza_sales;


##kpi-2: average order value
select round(sum(total_price)/count(distinct order_id),2) average_order_value
 from pizza_sales;
 
 ##kpi-3: total pizza sold
 select sum(quantity) total_pizza_sold
 from pizza_sales;
 
 
 
 #kpi-4: total order placed
 
 select 
 count(distinct order_id) total_order_placed
 from pizza_sales;
 
 
 ## kpi-5: average pizza sold
  
 select 
round(sum(quantity)/ count(distinct order_id),2) average_pizza_sold
 from pizza_sales;
 
 
 
 ### Now term for the chart requiremnts
 
 #chart -1 : daily trends for total_orders
 select 
order_date,
sum(quantity) total_order_per_day
 from pizza_sales
 group by order_date;
 
  select 
DATENAME(WEEKDAY,order_date),
sum(quantity) total_order_per_day
 from pizza_sales
 group by DATENAME(WEEKDAY,order_date);
 
 
 
 #chart-2: hourly trend for total orders
 
 select 
hour(order_time) order_hour,
order_date,
sum(quantity) total_order_per_hour
 from pizza_sales
 group by 1,2;
 
 #or
  select 
hour(order_time) order_hour,
sum(quantity) total_order_per_hour
 from pizza_sales
 group by 1;
 
 
 #chart 3 : percentage of sales by pizza category
 
 select 
pizza_category,
round(sum(total_price),2),
round(round(sum(total_price),2)/(select sum(total_price) from pizza_sales) ,2)*100 as percentage_by_category
 from pizza_sales
 group  by 1;
 
 
 #chart 4: percentage of sales by pizza size
  select 
pizza_size,
round(sum(total_price),2),
round(round(sum(total_price),2)/(select sum(total_price) from pizza_sales) ,2)*100 as percentage_by_category
 from pizza_sales
 group  by 1
 order by percentage_by_category desc;
 
 
 
 
 #chart 5: total pizza sold by pizza category
 
  select 
pizza_category,
sum(quantity) total_pizza_sold_by_category
 from pizza_sales
 group  by 1;
 
 
 
 #chart 6: top 5 best sellers by total pizza sold
 select 
pizza_name,
sum(quantity) pizza_sold
 from pizza_sales
 group by 1
 order by pizza_sold desc limit 5;
 
 
 
  #chart 7: top 5 wrost sellers by total pizza sold
 select 
pizza_name,
sum(quantity) pizza_sold
 from pizza_sales
 group by 1
 order by pizza_sold  limit 5;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 