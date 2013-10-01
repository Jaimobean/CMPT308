--Jaime Engl
--Homework 1
--Due 9/23

--Question 1
--Selects the cities of agents booking an order for customer c002

select city
from agents
where aid in (select aid 
	      from orders
              where cid = 'c002')


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
--a03

select cid, name
from customers
where cid not in(select cid
	         from orders
	         where aid = 'a03')

--Question 4
--Selects the cids and ames of customers who have ordered products p01
--and p07. 

select cid, name
from customers
where cid in
	(select cid
	from orders
	where pid in
		(select pid
		from products
		where pid = 'p01'))
and cid in
	(select cid
	from orders
	where pid in
		(select pid
		from products
		where pid = 'p07'))

order by cid;

--Question 5
--Selects the pids of products orderd by any customers who ever placed an
--order through agent a03

select distinct pid
from orders
where cid in(select cid
	     from orders
	     where aid = 'a03')
order by pid;

--Question 6
--Selects names and discounts of all customers who place orders through agents
--in Dallas or Duluth

select name, discount
from customers
where cid in(select cid
	     from orders
	     where aid in(select aid
	     		  from agents
	                  where city = 'Dallas'
		          OR city = 'Duluth'))

--Question 7
--Selects the customers who have the same discount as that of any customers
--in Dallas or Kyoto

select cid, name
from customers
where discount in(select discount
		  from customers
		  where cid in(select cid
			       from customers
		               where city = 'Dallas'
			       OR city = 'Kyoto'))
AND cid not in(select cid
	       from customers
	       where city = 'Dallas'
	       OR city = 'Kyoto')
order by cid;