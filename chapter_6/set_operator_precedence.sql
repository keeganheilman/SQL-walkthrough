SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

-- it does make a difference how the compound query is arranged when using different set operators.
-- compound queries are evaluated in order from top to bottom, but with the following caveats:
--  * The ANSI SQL specification calls for the `intersect` operator to have precedence over the other set operators
--  * You may dictate the order in which queries are combined by enclosing multiple queries in parentheses
--  * Some SQL databases allow parentheses in compound queries to override the default top-to-bottom processing of compoind queries

SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ( 
    SELECT a.first_name, a.last_name
    FROM actor a
    WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
    UNION ALL
    SELECT c.first_name, c.last_name
    FROM customer c
    WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
);