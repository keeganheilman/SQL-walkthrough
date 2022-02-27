-- Exercise 7-3
-- Write a query to return just the month portion of the current date.

SELECT extract(MONTH FROM current_date)

-- or, if wanting the name of the month
SELECT to_char(current_date, 'month');