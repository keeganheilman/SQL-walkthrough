-- Outer Joins

-- example of counting the number of available copies of each film through an inner join
SELECT f.film_id, f.title, count(*) num_copies
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title;

-- provide films that do not have any showing in the inventory table
SELECT f.film_id, f.title, count(i.inventory_id) num_copies
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title;
-- now we will see all 1000 films


-- another example INNER JOIN/OUTER JOIN
SELECT f.film_id, f.title, i.inventory_id
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;

-- 
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;


-- 
SELECT f.film_id, f.title, i.inventory_id
FROM inventory i
RIGHT OUTER JOIN film f
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;

-- three-way outer joins
SELECT f.film_id, f.title, i.inventory_id, r.rental_date
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
LEFT OUTER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE f.film_id BETWEEN 13 AND 15;

-- cross joins
-- Cartesian product of two tables
SELECT c.name category_name, l.name language_name
FROM category c
CROSS JOIN language l;


-- Natural Joins
SELECT c.first_name, c.last_name, r.rental_date::date
FROM customer c
NATURAL JOIN rental r;

SELECT cust.first_name, cust.last_name, r.rental::date
FROM (
    SELECT customer_id, first_name, last_name
    FROM customer
) cust
NATURAL JOIN rental r;