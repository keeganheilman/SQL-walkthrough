-- Exercise 11-2
-- Rewrite the following query so that the result set contains a single row with five columns (one for each rating).
--  Name the five columns G, PG, PG_13, R, and NC_17.

-- SELECT rating, count(*)
--     -> FROM film
--     -> GROUP BY rating;
-- +--------+----------+
-- | rating | count(*) |
-- +--------+----------+
-- | PG     |      194 |
-- | G      |      178 |
-- | NC-17  |      210 |
-- | PG-13  |      223 |
-- | R      |      195 |
-- +--------+----------+
-- 5 rows in set (0.00 sec)


SELECT 
SUM(CASE
    WHEN f.rating = 'PG'
    THEN 1
    ELSE 0
END
) pg_count,
SUM(
    CASE
        WHEN f.rating = 'G'
        THEN 1
        ELSE 0
    END
) g_count,
SUM(
    CASE 
        WHEN f.rating = 'NC-17'
        THEN 1
        ELSE 0
    END
) nc17_count,
SUM(
    CASE
        WHEN f.rating = 'PG-13'
        THEN 1
        ELSE 0
    END
) pg13_count,
SUM(
    CASE 
        WHEN f.rating = 'R'
        THEN 1
        ELSE 0
    END
) r_count
FROM film f;
