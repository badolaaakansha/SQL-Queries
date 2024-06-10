create database Sales;
use Sales;

-- Basic Questions
-- What is the total amount of sales?
select sum(amount) as Total_Amount from details;

-- How many orders were placed in total?
select distinct count(orderid) as TotalOrders from orders; 

-- What is the average profit per order?
select orderid,avg(profit) as AverageProfit from details group by orderid having AverageProfit > 1;

-- How many orders were placed in each category?
select category,count(orderid) as TotalOrder from details group by category;

-- What is the total quantity sold for each sub-category?
select SubCategory,count(Quantity) as Total_Quantity_Sold from details group by Subcategory order by Total_Quantity_Sold desc ;

-- What is the total profit generated from each category?
select Category,sum(profit)as Total_Profit from details group by category;

-- What is the total sales amount for each city?
select orders.City,sum(details.amount) as Total_Sales_Amount from orders inner join details on 
orders.orderid=details.orderid group by orders.city order by Total_Sales_Amount desc;
 
-- How many orders were placed in each state?
select City,Count(orderid) as Orders from orders group by city order by orders;



 -- Intermediate Questions
 --  What is the average order amount per customer?
select orders.customername as Customers,avg(details.amount) as Average_Order_amount from orders
inner join details on orders.orderid=details.orderid group by Customers order by Customers;

-- Which category generates the highest profit margin (profit divided by amount)?
select category,(profit/amount)as Profit_Margin from details where (profit/amount)=
(select max(profit/amount) from details);

select category,(profit/amount)as Profit_Margin from details order by (profit/amount) desc limit 1;

-- How many orders were placed per month?
SELECT EXTRACT(MONTH FROM orderdate) AS month, COUNT(*) AS order_count
FROM orders
GROUP BY EXTRACT(MONTH FROM orderdate);
 
-- Which city has the highest average order amount?
select orders.city as City,avg(details.amount) as Average_Order_Amount from orders
inner join details on orders.orderid=details.orderid group by city order by Average_Order_Amount
desc limit 1;

-- How many orders were placed by each customer?
select customername as Customers,count(orderid) as Orders from orders group by customers order by orders desc;


-- Advance Questions
-- Which combination of category and sub-category yields the highest profit?
select Category,SubCategory,Profit from details where profit=(select max(profit) from details);

-- Are there any outliers in terms of order amount or profit that need further investigation?
select min(amount),max(amount) from details limit 5;

-- Are there any geographical patterns in sales performance?
SELECT 
    orders.state,
    COUNT(*) AS total_orders,
    SUM(details.amount) AS total_sales_amount,
    AVG(details.amount) AS average_order_amount
FROM orders inner join details 
on orders.orderid=details.orderid
GROUP BY state
ORDER BY state asc;
