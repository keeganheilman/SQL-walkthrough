
-- Exercise 5-1
-- Fill in the blanks (denoted by <#>) for the following query to obtain the results that follow:

-- mysql> SELECT c.first_name, c.last_name, a.address, ct.city
--     -> FROM customer c
--     ->   INNER JOIN address <1>
--     ->   ON c.address_id = a.address_id
--     ->   INNER JOIN city ct
--     ->   ON a.city_id = <2>
--     -> WHERE a.district = 'California';
-- +------------+-----------+------------------------+----------------+
-- | first_name | last_name | address                | city           |
-- +------------+-----------+------------------------+----------------+
-- | PATRICIA   | JOHNSON   | 1121 Loja Avenue       | San Bernardino |
-- | BETTY      | WHITE     | 770 Bydgoszcz Avenue   | Citrus Heights |
-- | ALICE      | STEWART   | 1135 Izumisano Parkway | Fontana        |
-- | ROSA       | REYNOLDS  | 793 Cam Ranh Avenue    | Lancaster      |
-- | RENEE      | LANE      | 533 al-Ayn Boulevard   | Compton        |
-- | KRISTIN    | JOHNSTON  | 226 Brest Manor        | Sunnyvale      |
-- | CASSANDRA  | WALTERS   | 920 Kumbakonam Loop    | Salinas        |
-- | JACOB      | LANCE     | 1866 al-Qatif Avenue   | El Monte       |
-- | RENE       | MCALISTER | 1895 Zhezqazghan Drive | Garden Grove   |
-- +------------+-----------+------------------------+----------------+

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_ct = ct.city_id
WHERE a.district = 'California';

