-- datetime formatting is necessary
--  YYYY-MM-DD HH:MI:SS

UPDATE rental
SET return_date = '2019-09-17 15:30:00'
WHERE rental_id = 9999;


-- string-to-date conversions
-- using TIMESTAMP WITH TIME ZONE
SELECT CAST('2019-09-17 15:30:00' AS timestamptz);
-- using TIMESTAMP WITHOUT TIME ZONE
SELECT CAST('2019-09-17 15:30:00' AS timestamp);

SELECT CAST('2019-09-17' AS date) date_field,
CAST('108:17:57' AS time) time_field;



-- generating dates
UPDATE rental
SET return_date = to_date('September 17, 2019', 'Month DD, YY')
WHERE rental_id = 99999;

SELECT current_date, current_time, current_timestamp;



-- manipulating temporal data
SELECT current_date + interval '5 day';

UPDATE rental
SET return_date = return_date + interval '3:27:11 HOUR_SECOND'
WHERE rental_id = 9999;


UPDATE employee
SET birth_date = birth_date + interval '9-11 YEAR_MONTH' 
WHERE emp_id = 4789;


-- temporal functions that return strings
SELECT to_char('2019-09-18'::date, 'day');

-- using EXTRACT()
SELECT EXTRACT(YEAR FROM '2019-09-18 22:19:05'::timestamp);

-- using differences in dates
SELECT '2019-09-03'::date - '2019-06-21'::date;

