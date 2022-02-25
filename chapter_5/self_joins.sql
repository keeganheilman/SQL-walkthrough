-- Using a self-join when the table makes a self-referencing foreign key to the table's primary key
SELECT f.title, f_prnt.title prequel
FROM film f
INNER JOIN film f_prnt
ON f_prnt.film_id = f.prequel_film_id
WHERE f.prequel_film_id IS NOT NULL;