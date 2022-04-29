-- https://www.hackerrank.com/challenges/placements/problem


SELECT s.name
FROM students s
INNER JOIN (
    SELECT f.id, f.friend_id, p.salary, a.salary fr_salary
    FROM friends f
    INNER JOIN packages p
    ON f.id = p.id
    INNER JOIN packages a
    ON f.friend_id = a.id
) t
ON s.id = t.id
WHERE t.fr_salary > t.salary
ORDER BY t.fr_salary ASC
