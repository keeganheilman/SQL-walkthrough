-- Numeric data generation is quite straightforward

SELECT (37 * 59) / (78 - (8 * 6));


-- arithmetic functions
SELECT MOD(10, 4);
SELECT 10 % 4 modulus;

SELECT POW(2,8);
SELECT POW(2,10) kilobyte, POW(2,20) megabyte, POW(2,30) gigabyte, POW(2,40) terabyte;


-- controlling number precision
-- CEIL() used to round up to the closest integer
-- FLOOR() used to round down to the closest integer
SELECT CEIL(72.445), FLOOR(72.445);
SELECT ROUND(72.945,1) one, ROUND(72.945,2) two, ROUND(72.9451,3) three;

SELECT TRUNC(72.0909,1), TRUNC(72.0909, 2), TRUNC(72.0909,3);

SELECT ROUND(17,-1), TRUNC(17,-1);


-- handling signed data
SELECT payment_id, SIGN(amount), ABS(amount)
FROM payment;

