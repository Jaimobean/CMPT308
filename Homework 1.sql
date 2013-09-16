--Jaime Engl
--Homework 1

--Question 1

select *
from customers;

--Question 2

select name, city
from agents
where name = 'Smith';

--Question 3

select pid, name, quantity
from products
where priceUSD  > 1.25;

--Question 4

select ordno, aid
from orders;

--Question 5

select name, city
from customers
where city != 'Dallas';

--Question 6

select name
from agents
where city = 'New York'
OR city = 'Newark';
