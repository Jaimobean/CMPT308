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
						   

--Question 2
--Selects pids of products ordered though any agent who makes at least one 
--order for a customer in Kyoto

select distinct pid
from orders
where aid in(select aid
	     from orders
	     where cid = (select cid
			  from customers
			  where city = 'Kyoto'))
order by pid;

--Question 3
--Selects the cids and names of customers who never placed an order through 
--a03 ('Brown')

select cid, name
from customers
where cid not in(select cid
	         from orders
	         where aid = (select aid
			      from agents
			      where name = 'Brown'))
				 
--Question 4
--Selects the cids and ames of customers who have ordered products p01 ('comb')
--or p07 ('case')

select cid, name
from customers
where cid in(select cid
	         from orders
	         where pid in(select pid
			      from products
			      where name = 'comb'
			      OR name = 'case'))
order by cid;
				  
--Question 5
--Selects the pids of products orderd by any customers who ever placed an
--order through agent a03 ('Brown')

select distinct pid
from orders
where cid in(select cid
			 from orders
	         where aid =(select aid
						 from agents
						 where name = 'Brown'))
order by pid;
								  
