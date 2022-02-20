-- Operator `::` is short hand notation for casting a value
-- REF: https://stackoverflow.com/questions/22835874/postgresql-convert-timestamp-to-time-or-retrieve-only-time-from-timestamp-col

SELECT customer.first_name, customer.last_name, rental.rental_date::time rental_time
FROM customer 
INNER JOIN rental
ON customer.customer_id = rental.customer_id
WHERE rental.rental_date::date = '2005-06-14';

-- explore joining multiple tables further in Chapter 5 and 10. 


