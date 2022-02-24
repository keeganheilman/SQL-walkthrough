-- cartesian product
--  produces EVERY permutation of the two tables


SELECT c.first_name, c.last_name, a.address
FROM customer c JOIN address a;


-- inner join
--  link the tables ON a particular column of shared values.
SELECT c.first_name, c.last_name, a.address
FROM customer c JOIN address a
ON c.address_id = a.address_id;


-- make the INNER JOIN explicit, 
-- Though the server will do an inner join by default, it is best practice to specify the exact type for documentation and maintenance
SELECT c.first_name, c.last_name, a.address
FROM customer c INNER JOIN address a
ON c.address_id = a.address_id;

-- USING subclause
SELECT c.first_name, c.last_name, a.address
FROM customer c INNER JOIN address a 
USING (address_id);



-- ANSI Join Syntax (SQL92 JOIN syntax)
--  * Join conditions and filter conditions are separated into two different clauses, making a query easier to understand
--  * The join conditions for each pair of tables are contained in their own on clause, making it less likely that part of a join will be mistakenly omitted.
--  * Queries that use the SQL92 join syntax are portable across database servers, whereas the older syntax is slightly different across the different servers.

SELECT c.first_name, c.last_name, a.address
FROM customer c INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.postal_code = '52137';

-- JOIN three (3) tables requires two (2) ON subclauses
SELECT c.first_name, c.last_name, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;


-- using Subqueries As Tables
SELECT c.first_name, c.last_name, addr.address, addr.city
FROM customer c
INNER JOIN (
    SELECT a.address_id, a.address, ct.city
    FROM address a
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    WHERE a.district = 'California'
) addr
ON c.address_id = addr.address_id;


-- JOIN the same table twice
SELECT f.title
FROM film f
INNER JOIN film_actor fa1
ON f.film_id = fa1.film_id
INNER JOIN actor a1
ON fa1.actor_id = a1.actor_id
INNER JOIN film_actor fa2
ON f.film_id = fa2.film_id
INNER JOIN actor a2
ON fa2.actor_id = a2.actor_id
WHERE (( a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN')
AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH'));


-- NEXT --> SELF-JOINs