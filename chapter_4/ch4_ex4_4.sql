-- Exercise 4-4
-- Construct a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.

SELECT last_name
FROM customer
WHERE last_name LIKE '_A%W';