-- Exercise 6-3
-- Sort the results from Exercise 6-2 by the last_name column.

SELECT 'ACT' typ, a.first_name fname, a.last_name lname
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT 'CUST' typ, c.first_name fname, c.last_name lname
FROM customer c
WHERE c.last_name LIKE 'L%'
ORDER BY lname;
