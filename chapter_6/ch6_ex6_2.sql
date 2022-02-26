-- Exercise 6-2
-- Write a compound query that finds the first and last names of all Actors and Customers whose last name starts with L.

SELECT a.first_name, a.last_name
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.last_name LIKE 'L%';
