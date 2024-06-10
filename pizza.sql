use pizzahut;
-- Basic
-- Identify the highest priced pizza
select pizza_types.name,pizzas.price from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id where price =(select max(price) from pizzas);

select pizza_types.name,pizzas.price from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id order by price desc limit 1;

select pizza_type_id,price from pizzas where price=(select max(price) from pizzas);

-- Identify the most common pizza size ordered
select count(order_details.order_details_id) as PizzaOrdered,pizzas.size from order_details inner join pizzas on order_details.pizza_id=pizzas.pizza_id group by pizzas.size order by PizzaOrdered desc; 

-- List the top 5 most ordered pizza types along with their quantites
select pizza_types.name,count(order_details.quantity) from(pizzas inner join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id ) inner join order_details
on pizzas.pizza_id=order_details.pizza_id group by pizza_types.name order by count(order_details.quantity) desc limit 5;

select pizzas.pizza_id,order_details.quantity from pizzas inner join order_details
on pizzas.pizza_id=order_details.pizza_id order by order_details.quantity desc limit 5;

-- Retrive the total no. of orders placed
select count(order_id) from orders;

-- Calculate the toral revenue generates from pizza sales
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            4) AS Total_Revenue
FROM
    order_details
        INNER JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

 
-- Intermediate
-- Group the orders by date and calculate avg no. of pizzas orders per day
select orders.date,avg(order_details.quantity) from orders inner join order_details
on orders.order_id=order_details.order_id group by date ;

-- Join relevant tables to find category-wise distribution of pizzas
select distinct pizza_type_id,category from pizza_types group by category;