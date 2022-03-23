-- grouping concepts
-- group the data using the `GROUP BY` clause
-- the following provides one row for each distinct value in `customer_id` column
SELECT customer_id
FROM rental
GROUP BY customer_id;

-- you can then aggregate  using and `aggregate function` in the select clause to count the number of rows in each group
-- count() counts the number of rows in each group, and the asterisk tells the server to count evertthing in the group
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id;

-- further
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC; -- orders the resulting data by the second column in descending order


-- Changes here