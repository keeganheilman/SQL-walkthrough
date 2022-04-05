-- Exercise 8-3
-- Modify your query from Exercise 8-2 to include only those customers having made at least five payments.

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
GROUP BY customer_id                                 
HAVING count(payment_id) >= 5;