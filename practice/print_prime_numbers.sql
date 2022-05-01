

SET @num_1 = 1;
SET @num_2 = 1;

SELECT GROUP_CONCAT(POTENTIAL_PRIME SEPARATOR '&')
FROM (
    SELECT (@num_1 := @num_1 + 1) num_1
    FROM information_schema.tables t1, information_schema.tables t2
    LIMIT 1000
) list_of_potential_primes
WHERE NOT EXISTS (
    SELECT *
    FROM (
        SELECT @num_2 := @num_2 + 1 num_2
        FROM information_schema.tables t4, information_schema.tables t5
	    LIMIT 1000
    ) list_of_divisors
    WHERE MOD(num_1, num_2) = 0
    AND num_1 <> num_2
);
