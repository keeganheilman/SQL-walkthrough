-- Exercise 9-2
-- Rework the query from Exercise 9-1 using a correlated subquery against the category and film_category tables to achieve the same results.

SELECT f.film_id, f.title
FROM film f
WHERE EXISTS (
    SELECT 1
    FROM category c
    INNER JOIN
        film_category fc
        ON fc.category_id = c.category_id
    WHERE fc.film_id = f.film_id AND c.name = 'Action'
);
