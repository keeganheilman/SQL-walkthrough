-- EXAMPLES of Equality Conditions
-- title = 'RIVER OUTLAW'
-- fed_id = '111-11-1111'
-- amount = 375.25
-- film_id = (SELECT film_id FROM film WHERE title = 'RIVER OUTLAW')

SELECT c.email
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date::date = '2005-06-14';