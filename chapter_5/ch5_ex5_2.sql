-- Exercise 5-2
-- Write a query that returns the title of every film in which an actor with the first name JOHN appeared. 

SELECT f.title, a.first_name
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';
