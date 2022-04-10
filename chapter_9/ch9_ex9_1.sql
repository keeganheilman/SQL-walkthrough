-- Exercise 9-1
-- Construct a query against the film table that uses a filter condition with a noncorrelated subquery against the category table to find all action films (category.name = 'Action').

SELECT f.film_id, f.title
FROM film f
WHERE f.film_id in (
    SELECT fc.film_id
    FROM film_category fc
    INNER JOIN category ca
    ON fc.category_id = ca.category_id
    WHERE ca.name = 'Action'
);