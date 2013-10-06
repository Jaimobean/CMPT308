--Jaime Engl
--Homework 3
--Due 10/07

--Question 1
--Selects the cities of agents booking an order for customer c002 (subqueries)

select city
from agents
where aid in (select aid 
	      from orders
              where cid = 'c002')
			  
--Question 2
--Selects the cities of agents booking an order for customer c002 (joins)

select a.city
from agents a, 
     orders o,
     customers c
where o.aid = a.aid
  and o.cid = c.cid
  and c.cid = 'c002'


--Question 3
--Selects pids of products ordered though any agent who makes at least one 
--order for a customer in Kyoto (subqueries)

select distinct pid
from orders
where aid in(select aid
	     from orders
	     where cid = (select cid
			  from customers
			  where city = 'Kyoto'))
order by pid;

--Question 4
--Selects pids of products ordered though any agent who makes at least one 
--order for a customer in Kyoto (joins)

select distinct o1.pid
from orders o1,
     orders o2,
     customers c
where o1.aid = o2.aid
  and o2.cid = c.cid
  and c.city = 'Kyoto'

order by o1.pid;
  
--Question 5
--Selects the names of customers who have never placed an order (subqueries)
select name
from customers
where cid not in (select cid
		          from orders)

--Question 6				  
--Selects the names of customers who have never placed an order (joins)
select c.name
from customers c full outer join orders o
on c.cid = o.cid
where o.cid is null

--Question 7
--Selects the name of customers who have placed at least one order through 
--an agent in their city along with those agent names
select distinct c.name,
		a.name
from customers c,
     orders o,
     agents a
where c.cid = o.cid
  and o.aid = a.aid
  and c.city = a.city

--Question 8
--Selects the names of customers and agents in the same city, along with the
--name of the city, regardless of whether or not the customer has ever placed
--an order with that agent

select c.name, a.name, a.city
from customers c,
	 agents a
where c.city = a.city
order by c.cid

--Question 9
--Selects the name and city of customers who live in THE city where the LEAST
--number of products are made


--Question 12
--Selects the products whose priceUSD is above the average priceUSD

select name,
       avg(priceUSD)
from products
group by name
having avg(priceUSD) > (select avg(priceUSD)
						from products)

--Question 13
--Selects the customer name, pid ordered, and the dollars for all customer
--orders, sorted by dollars from high to low

select c.name,
       o.pid,
       o.dollars
from orders o,
     customers c
where c.cid = o.cid
order by dollars desc
  
--Question 14
--Selects the customer names (in order) and their total order, and nothing more.

--Question 15
--Selects the names of all customers who bought products from agents based in
--New York along with the names of the products they ordered, and the names
--of the agents who sold it to them

select c.name,
       a.name,
       p.name
from customers c,
     orders o,
     agents a,
     products p
where c.cid = o.cid
  and o.aid = a.aid
  and o.pid = p.pid
  and a.city = 'New York'
  
  


