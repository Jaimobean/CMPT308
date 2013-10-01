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
select c.name
from customers c full outer join orders o
on c.cid = o.cid
where o.cid is null