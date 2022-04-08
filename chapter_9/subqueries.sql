-- simple example of subquery
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id (
    SELECT MAX(cusomter_id)
    FROM customer
);


-- noncorrelated subquery
SELECT city_id, city
FROM city
WHERE country_id <> (
    SELECT country_id
    FROM country
    WHERE country = 'India'
);

-- using IN operator 
SELECT country_id
FROM country
WHERE country IN ('Canada','Mexico');

-- building a subquery using IN operator upon its results
SELECT city_id, city
FROM city
WHERE country_id IN (
    SELECT country_id
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);


-- using NOT IN operator
SELECT city_id, city
FROM city
WHERE country_id NOT IN (
    SELECT country_id
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);

-- using ALL operator to make comparison between a single value and every value in a set
SELECT first_name, last_name
FROM customer
WHERE customer_id <> ALL (
    SELECT customer_id
    FROM payment
    WHERE amount = 0
);


-- using ALL within HAVING clause
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
HAVING count(*) > ALL (
    SELECT count(*)
    FROM rental r
    INNER JOIN customer c
    ON r.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN ('United States', 'Mexico', 'Canada')
    GROUP BY r. customer_id
);


-- using ANY operator
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) > ANY (
    SELECT sum(p.amount)
    FROM payment p
    INNER JOIN customer c
    ON p.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN ('Bolivia', 'Paraguay', 'Chile')
    GROUP BY co.country
);


-- multiple, single-column subqueries
SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE fa.actor_id IN (
    SELECT actor_id FROM actor WHERE last_name = 'MONROE'
    )
AND fa.film_id IN (
    SELECT film_id FROM film WHERE rating = 'PG'
);

--multicolumn subqueries
SELECT actor_id, film_id
FROM film_actor
WHERE (actor.id, film_id) IN (
    SELECT a.actor_id, f.film_id
    FROM actor a
    CROSS JOIN film f
    WHERE a.last_name = 'MONROE'
    AND f.rating = 'PG'
);