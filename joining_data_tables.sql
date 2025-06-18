use pizza_sales_database;


select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;

#now joining all the deatils;

select count(*) 
from order_details od
right join orders o 
on od.order_id=o.order_id
left join pizzas p
on od.pizza_id=p.pizza_id
left join pizza_types pt 
on p.pizza_type_id=pt.pizza_type_id;


select count(*) from pizza_sales;