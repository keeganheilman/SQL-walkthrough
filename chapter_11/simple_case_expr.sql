
-- SIMPLE CASE EXPRESSIONS
CASE V0
    WHEN V1 THEN E1
    WHEN V2 THEN E2
    ...
    WHEN VN THEN EN
    [ELSE ED]
END

-- example of simple case expression
CASE category.name
    WHEN 'Children' THEN 'All Ages'
    WHEN 'Family' THEN 'All Ages'
    WHEN 'Sports' THEN 'All Ages'
    WHEN 'Animation' THEN 'All Ages'
    WHEN 'Horror' THEN 'Adult'
    WHEN 'Music' THEN 'Teens'
    WHEN 'Games' THEN 'Teens'
    ELSE 'Other'
END
-- limited because you can't pecify your conditions, whereas search case expressions may include range conditions, inequalities, and multipart conditions using and/or/not
