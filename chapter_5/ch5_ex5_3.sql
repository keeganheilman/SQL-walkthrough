-- Exercise 5-3
-- Construct a query that finds returns all addresses which are in the same city. You will need to join the address table to itself, and each row should include 2 different addresses. 


SELECT  a.address, a2.address address2, ct.city
FROM address a
INNER JOIN address a2
ON a.city_id = a2.city_id
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.address != a2.address;