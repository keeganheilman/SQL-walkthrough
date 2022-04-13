-- Exercise 10-3 (Extra Credit)
-- Devise a query that will generate the set {1, 2, 3,…, 99, 100}. 
-- (Hint: use a cross join with at least two from clause subqueries.)

SELECT ones.num + tens.num
FROM (
    SELECT 1 num UNION ALL
    SELECT 2 num UNION ALL
    SELECT 3 num UNION ALL
    SELECT 4 num UNION ALL
    SELECT 5 num UNION ALL
    SELECT 6 num UNION ALL
    SELECT 7 num UNION ALL
    SELECT 8 num UNION ALL
    SELECT 9 num UNION ALL
    SELECT 10 num
) ones
CROSS JOIN
(
    SELECT 0 num UNION ALL
    SELECT 10 num UNION ALL
    SELECT 20 num UNION ALL
    SELECT 30 num UNION ALL
    SELECT 40 num UNION ALL
    SELECT 50 num UNION ALL
    SELECT 60 num UNION ALL
    SELECT 70 num UNION ALL
    SELECT 80 num UNION ALL
    SELECT 90 num
) tens
ORDER BY 1;