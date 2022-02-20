SELECT c.first_name, c.last_name, r.rental_date::time rental_time
FROM  customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date::date = '2005-06-14'
ORDER BY c.last_name, c.first_name;




SELECT c.first_name, c.last_name, r.rental_date::time rental_time
FROM  customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date::date = '2005-06-14'
ORDER BY rental_time DESC;
