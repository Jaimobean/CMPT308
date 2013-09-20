--Jaime Engl
--Homework 1
--Due 9/16/13

--Question 1
--Selects all data for all customers

select *
from customers;

--Question 2
--Selects the name and city of agents named Smith

select name, city
from agents
where name = 'Smith';

--Question 3
--Selects pid, name, and quantity of products costing MORE than $1.00 (USD)

select pid, name, quantity
from products
where priceUSD  > 1.25;

--Question 4
--Selects the ordno and aid of all orders

select ordno, aid
from orders;

--Question 5
--Selects the names and cities of customers NOT in Dallas

select name, city
from customers
where city != 'Dallas';

--Question 6
--Selects the names of agents in New York OR Newark

select name
from agents
where city = 'New York'
OR city = 'Newark';

--Question 7
--Selecs all data for products NOT in New York OR Newark that cost $1.00 (USD) or less

select *
from products
where city != 'New York'
AND city != 'Newark'
AND priceUSD <= 1.00;

--Question 8
--Selects all data for orders in January OR March

select *
from orders
where mon = 'jan'
OR mon = 'mar';

--Question 9
--Selects all data for orders in Febuary less than $100 (USD)
--No Data is selected because nothing falls under these conditions

select *
from orders
where mon = 'feb'
AND dollars < 100.00;

--Question 10
--Selects all orders (and their data) from the customer whose cid is C005
--No Data is selected because nothing falls under these condtions

select *
from orders
where cid = 'c005';