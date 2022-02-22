-- Examples of inequality conditions

SELECT c.email
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date::date <> '2005-06-14';


DELETE FROM rental
WHERE date_part('year', rental_date::date) = 2004;


DELETE FROM rental
WHERE date_part('year', rental_date) <> 2005
AND date_part('year', rental_date) <> 2006