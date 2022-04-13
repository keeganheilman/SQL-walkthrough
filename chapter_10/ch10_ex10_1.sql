-- Exercise 10-1
-- Using the table definitions and data below, write a query that returns each customer name along with their total balance across all accounts.
-- Customer:
-- Customer_id  	Name
-- -----------  	---------------
-- 1		John Smith
-- 2		Kathy Jones
-- 3		Greg Oliver

-- 			Account:
-- Account_id	Customer_id	Account_Name	Balance
-- ----------	-----------	------------	--------
-- 101		        1		Checking	    1044
-- 102		        3		Savings		    522
-- 103		        1		Line of Credit  9995

-- Include all customers, even if no accounts exist for that customer.

SELECT c.name, sum(a.balance) tot_bal
FROM customer c
LEFT OUTER JOIN account a
ON c.customer_id = a.customer_id;