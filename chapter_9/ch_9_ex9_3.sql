-- Exercise 9-3
-- Join the following query to a subquery against the film_actor table to show the level of each actor:

-- SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
-- UNION ALL
-- SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
-- UNION ALL
-- SELECT 'Newcomer' level, 1 min_roles, 19 max_roles

-- The subquery against the film_actor table should count the number of rows for each actor using group by actor_id , and the count should be compared to the min_roles/max_roles columns to determine which level each actor belongs to.


SELECT r.actor_id, lvl.level, r.role_count
FROM (
    SELECT count(*) role_count, fa.actor_id
    FROM film_actor fa
    GROUP BY fa.actor_id
) r
INNER JOIN (
    SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
    UNION ALL
    SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
    UNION ALL
    SELECT 'Newcomer' level, 1 min_roles, 19 max_roles
) lvl
ON r.role_count
BETWEEN lvl.min_roles AND lvl.max_roles
ORDER BY 3,1
