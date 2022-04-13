-- Exercise 10-2
-- Reformulate your query from Exercise 10-1 to use the other outer join type
--  (e.g., if you used a left outer join in Exercise 10-1, use a right outer join this time) 
--  such that the results are identical to Exercise 10-1

SELECT c.name, sum(a.balance) tot_bal
FROM account a
RIGHT OUTER JOIN customer c
ON c.customer_id = a.customer_id;