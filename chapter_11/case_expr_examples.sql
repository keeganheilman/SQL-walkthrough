-- case expression examples

-- result set transformations
SELECT date_part('month', rental_date) rental_month,
    count(*) num_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'
GROUP BY date_part('month', rental_date);


-- to create a single row table with the three columns...
SELECT
SUM(
    CASE
        WHEN date_part('month', rental_date) = 5 THEN 1
        ELSE 0
    END
) May_rentals,
SUM(
    CASE
        WHEN date_part('month', rental_date) = 6 THEN 1
        ELSE 0
    END
) June_rentals,
SUM(
    CASE
        WHEN date_part('month', rental_date) = 7 THEN 1
        ELSE 0
    END
) July_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01';


-- checking for existence
SELECT a.first_name, a.last_name,
CASE
    WHEN EXISTS (
        SELECT 1
        FROM film_actor fa
        INNER JOIN film f
        ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id AND f.rating = 'G'
        ) THEN 'Y'
    ELSE 'N'
END g_actor,
CASE
    WHEN EXISTS (
        SELECT 1
        FROM film_actor fa
        INNER JOIN film f
        ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id AND f.rating = 'PG'
    ) THEN 'Y'
    ELSE 'N'
END pg_actor,
CASE
    WHEN EXISTS (
        SELECT 1
        FROM film_actor fa
        INNER JOIN film f
        ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id AND f.rating = 'NC-17'
    ) THEN 'Y'
    ELSE 'N'
END nc17_actor
FROM actor a
WHERE a.last_name LIKE 'S%' OR a.first_name LIKE 'S%';


-- Division-by-zero errors
-- to safeguard your encountering errors, or even worse, from being mysteriously set to null
--  you should wrap all denominators in conditional logic

SELECT c.first_name, c.last_name,
SUM (p.amount) tot_payment_amt,
COUNT(p.amount) num_payments,
SUM(p.amount) / 
    CASE
        WHEN count(p.amount) = 0 THEN 1
        ELSE count(p.amount)
    END avg_payment
FROM customer c
LEFT OUTER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;



-- conditional updates

UPDATE customer
SET active =
CASE
    WHEN 90 <= (
        SELECT EXTRACT(DAY FROM (now() - max(rental_date)))
        FROM rental r
        WHERE r.customer_id = customer.customer_id
        ) THEN 0
    ELSE 1
END
WHERE active = 1;