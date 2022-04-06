-- simple example of subquery
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id (
    SELECT MAX(cusomter_id)
    FROM customer
);


-- noncorrelated subquiry
SELECT city_id, city
FROM city
WHERE country_id <> (
    SELECT country_id
    FROM country
    WHERE country = 'India'
);

-- using IN operator 
SELECT country_id
FROM country
WHERE country IN ('Canada','Mexico');

-- building a subquiry using IN operator upon its results
SELECT city_id, city
FROM city
WHERE country_id IN (
    SELECT country_id
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);


-- using NOT IN operator
SELECT city_id, city
FROM city
WHERE country_id NOT IN (
    SELECT country_id
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);

-- using ALL operator to make comparison between a single value and every value in a set
SELECT first_name, last_name
FROM customer
WHERE customer_id <> ALL (
    SELECT customer_id
    FROM payment
    WHERE amount = 0
);


-- using ALL within HAVING clause
