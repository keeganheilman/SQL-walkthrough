-- ORDER BY will give an error if using the column names of the second SELECT statement.
--  Therefore it is recommended to use matching aliases in both SELECT statements to properly use ORDER BY

SELECT a.first_name fname, a.last_name lname
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION
SELECT c.first_name fname, c.last_name lname
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
ORDER BY lname, fname;