-- Examples of NULL uses

-- NULL is never equal to NULL, must use IS operator
SELECT rental_id, customer_id
FROM rental
WHERE return_date IS NULL;


-- checking value is assigned to a column using NOT NULL operator
SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NOT NULL
limit 20;


-- Aware to include NULL values when identifying values NOT included under conditional
SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NULL
OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';