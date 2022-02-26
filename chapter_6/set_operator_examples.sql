-- performing a set operation by placing a set operator between two select statements
-- compound query
SELECT 1 num, 'abc' str
UNION
SELECT 9 num, 'xyz' str;



-- using the `UNION ALL` operator to generate a set of first and last names from multiple tables
SELECT 'CUST' typ, c.first_name, c.last_name
FROM customer c
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;

