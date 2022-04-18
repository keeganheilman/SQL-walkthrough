-- What is Conditional Logic?


-- implementation includes the CASE expression
--  could be used in translations
SELECT first_name, last_name,
CASE
    WHEN active = 1 THEN 'ACTIVE'
    ELSE 'INACTIVE'
END activity_type
FROM customer;

-- Case expression is part of the SQL standard and has been implemented by a host of SQL variants
-- case expressions are also built into the SQL grammar and can be included in select, insert, update, and delete statements


