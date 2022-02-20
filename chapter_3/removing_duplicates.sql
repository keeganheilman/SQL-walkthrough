-- QUERY which may return duplicate rows
SELECT actor_id FROM film_actor ORDER BY actor_id;

-- In the previous query the duplication occurs because an actor_id may be found in multiple films.
--  To cut the duplicates, we only want to acknowledge/return each actor_id once. 
--  This may be performed using the DISTINCT keyword.
SELECT DISTINCT actor_id FROM film_actor ORDER BY actor_id;
