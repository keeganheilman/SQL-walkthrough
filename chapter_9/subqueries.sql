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

-- correlated subqueries
-- NOTE: the subquery is ran for each row returned by the containing query
-- here, subquery is ran 599 times, once for each c.customer_id provided by the containing query
SELECT c.first_name, c.last_name
FROM customer c
WHERE 20 = (
    SELECT count(*)
    FROM rental r
    WHERE r.customer_id = c.customer_id
);


-- combine correlated subqueries and range condition
SELECT c.first_name, c.last_name
FROM customer c
WHERE (
    SELECT sum(p.amount) FROM payment p
    WHERE p.customer_id = c.customer_id
) BETWEEN 180 AND 240;

-- exists Operator
-- exist operator used when want to identify that a relationship exists without regard for the quantity.
-- convention is to specify either SELECT 1 or SELECT * when using exists
SELECT c.first_name, c.last_name
FROM customer c
WHERE EXISTS (
    SELECT 1 FROM rental r
    WHERE r.customer_id = c.customer_id
    AND r.rental_date::date < '2005-05-25'
);

-- using not exists
SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (
    SELECT 1
    FROM film_actor fa
    INNER JOIN film f ON f.film_id = fa.film_id
    WHERE fa.actor_id = a.actor_id
    AND f.rating = 'R'
);

UPDATE customer AS c
SET last_update = (
    SELECT max(r.rental_date) 
    FROM rental r
    WHERE r.customer_id = c.customer_id
);



-- when to use subqueries

-- subqueries as data sources
SELECT c.first_name, c.last_name, pymnt.num_rentals, pymnt.tot_payments
FROM customer c
    INNER JOIN (
        SELECT customer_id,
        count(*) num_rentals, sum(amount) tot_payments
        FROM payment
        GROUP BY customer_id
    ) pymnt
    ON c.customer_id = pymnt.customer_id;


-- data generate, to then use as a subquery
SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
UNION ALL
SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
UNION ALL
SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit;

SELECT pymnt_grps.name, count(*) num_customers
FROM (
    SELECT customer_id,
    count(*) num_rentals, sum(amount) tot_payments
    FROM payment
    GROUP BY customer_id
) pymnt
INNER JOIN (
    SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
    UNION ALL
    SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
    UNION ALL
    SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit
) pymnt_grps
ON pymnt.tot_payments
BETWEEN pymnt_grps.low_limit AND pymnt_grps.high_limit
GROUP BY pymnt_grps.name;

--task-oriented subqueries
-- such as seperating out the grouping mechanism
SELECT customer_id, count(*) tot_rentals, sum(amount) tot_payments
FROM payment
GROUP BY customer_id;


SELECT c.first_name, c.last_name, ct.city, pymnt.tot_payments, pymnt.tot_rentals
FROM (
    SELECT customer_id, count(*) tot_rentals, sum(amount) tot_payments
FROM payment
GROUP BY customer_id
) pymnt
INNER JOIN customer c
ON pymnt.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;

