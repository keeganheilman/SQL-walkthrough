-- Examples of range conditions

SELECT customer_id, rental_date
FROM rental_date
WHERE rental_date < '2005-05-25';


SELECT customer_id, rental_date
FROM rental
WHERE rental_date <= '2005-06-16'
AND rental_date >= '2005-06-14';



-- BETWEEN clause : correctly order lower AND upper limit
SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';



-- string ranges using BETWEEN clause
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FRB';


-- membership conditions
SELECT title, rating
FROM film
WHERE rating = 'G' OR rating = 'PG';

-- using the IN operator instead
SELECT title, rating
FROM film
WHERE rating IN ('G','PG');

-- using subqueries to generate sets
SELECT title, rating
FROM film
WHERE rating IN (
    SELECT rating
    FROM film
    WHERE title LIKE '%PET%'
);

-- may also use NOT IN
SELECT title, rating
FROM film
WHERE rating NOT IN ('PG-13','R','NC-17');

