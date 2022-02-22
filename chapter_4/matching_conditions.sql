-- Examples of matching conditions



-- using substrings to match
SELECT last_name, first_name
FROM customer
WHERE left(last_name, 1) = 'Q';


-- using wildcards
SELECT last_name, first_name
FROM customer
WHERE last_name LIKE '_A_T%S';


SELECT last_name, first_name
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';

-- using regular expressions
SELECT last_name, first_name
FROM customer
WHERE last_name ~ '^[QY]';