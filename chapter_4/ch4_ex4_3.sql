-- Exercise 4-3
-- Construct a query that retrieves all rows from the Payment table where the amount is either 1.98, 7.98, or 9.98.

SELECT *
FROM payment
WHERE amount IN (1.98, 7.98, 9.98);