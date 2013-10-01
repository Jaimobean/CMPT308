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



