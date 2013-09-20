--Jaime Engl
--Homework 1
--Due 9/23

--Question 1
--Selects the cities of agents booking an order for customer c002 ('Basics')
select city
from agents
where aid in (select aid 
			  from orders
			  where cid = (select cid
						   from customers
						   where name = 'Basics'))
