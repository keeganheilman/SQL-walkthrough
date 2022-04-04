-- grouping concepts
-- group the data using the `GROUP BY` clause
-- the following provides one row for each distinct value in `customer_id` column
SELECT customer_id
FROM rental
GROUP BY customer_id;

-- you can then aggregate  using and `aggregate function` in the select clause to count the number of rows in each group
-- count() counts the number of rows in each group, and the asterisk tells the server to count evertthing in the group
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id;

-- further
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC; -- orders the resulting data by the second column in descending order


-- using the having clause

SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
HAVING count(*) >= 40;


-- using aggregate functions
SELECT MAX(amount) max_amt,
MIN(amount) min_amt,
AVG(amount) avg_amt,
SUM(amount) tot_amt,
COUNT(*) num_payments
FROM payment;


-- using explicit grouping to specify which rows to apply the aggregate functions
SELECT customer_id,
MAX(amount) max_amt,
MIN(amount) min_amt,
AVG(amount) avg_amt,
SUM(amount) tot_amt,
COUNT(*) num_payments
FROM payment
GROUP BY customer_id;


-- using distinct within the aggregate function
SELECT COUNT(customer_id) num_rows,
COUNT(DISTINCT customer_id) num_customers
FROM payment;


-- using multiple expressions in aggregate functions
SELECT MAX(AGE(return_date::timestamp,rental_date::timestamp))
FROM rental;


-- How are NULL values handled by numeric calculations
CREATE TABLE number_tbl
(val SMALLINT);

INSERT INTO number_tbl VALUES (1);
INSERT INTO number_tbl VALUES (3);
INSERT INTO number_tbl VALUES (5);

SELECT COUNT(*) num_rows,
COUNT(val) num_vals,
SUM(val) total,
MAX(val) max_val,
AVG(val) avg_val
FROM number_tbl;

-- now add NULL value to see effect in calc
INSERT INTO number_tbl VALUES (NULL);

SELECT COUNT(*) num_rows,
COUNT(val) num_vals,
SUM(val) total,
MAX(val) max_val,
AVG(val) avg_val
FROM number_tbl;
-- Sum, MAX, and AVG all appear to ignore NULL values



-- single-column grouping
SELECT actor_id, count(*)
FROM film_actor
GROUP BY actor_id;


--multicolumn grouping
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating
ORDER BY 1,2;

-- grouping via expressions
SELECT extract(YEAR FROM rental_date) as year,
    COUNT(*) how_many
FROM rental
GROUP BY extract(YEAR FROM rental_date);


-- with rollup
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY ROLLUP(fa.actor_id, f.rating)
ORDER BY 1,2;


-- with cube
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY CUBE(fa.actor_id, f.rating)
ORDER BY 1,2;

-- group filter conditions, HAVING clause to be used to filter the data after grouping
--     cannot include an aggregate function in a query's where clause, which are evaluated before the grouping occurs
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE f.rating IN ('G', 'PG')
GROUP BY fa.actor_id, f.rating
HAVING count(*) >9;