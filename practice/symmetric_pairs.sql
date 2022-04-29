-- https://www.hackerrank.com/challenges/symmetric-pairs/problem?

SELECT
    (CASE
        WHEN f1.x <= f1.y
        THEN f1.x
        ELSE f2.x
     END) x,
     (CASE
        WHEN f1.y > f2.y
        THEN f1.y
        ELSE f2.y
     END) y
FROM functions f1
INNER JOIN functions f2
ON f1.x = f2.y AND f1.y = f2.x
GROUP BY x,y
HAVING count(*) > 1
ORDER BY x ASC;