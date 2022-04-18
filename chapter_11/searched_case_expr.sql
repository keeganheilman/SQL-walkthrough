
-- Searched Case Expressions 

-- example of searched case expression
-- CASE
--     WHEN C1 THEN E1
--     WHEN C2 THEN E2
--     ...
--     WHEN CN THEN EN
--     [ELSE ED]
-- END

-- all the expressions returned by the various when clauses must evaluate to the same type

-- another example
CASE
    WHEN category.name IN (
        'Children', 'Family', 'Sports', 'Animation'
    )
    THEN 'All Ages'
    WHEN category.name = 'Horror'
    THEN 'Adult'
    WHEN category.name IN (
        'Music', 'Games'
    )
    THEN 'Teens'
    ELSE 'Other'
 END

-- another searched case expression
SELECT c.first_name, c.last_name,
CASE
    WHEN active = 0 THEN 0
    ELSE (
        SELECT count(*) FROM rental r
        WHERE r.customer_id = c.customer_id
    )
END num_rentals
FROM customer c;
