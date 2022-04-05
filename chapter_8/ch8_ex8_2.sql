-- Exercise 8-2
-- Modify your query from Exercise 8-1 to count the number of payments made by each customer.
--  Show the customer ID and the total amount paid for each customer.


-- sakila=# SELECT column_name
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE table_name = 'payment';
--  column_name  
-- --------------
--  payment_id
--  customer_id
--  staff_id
--  rental_id
--  amount
--  payment_date
-- (6 rows)

SELECT customer_id, sum(amount) amount_paid
FROM payment
GROUP BY customer_id;


