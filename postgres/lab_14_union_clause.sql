/*Lab_12: PostGreSQL HAVING*/
/*
- The HAVING cluase specifies a search condition for a group or an aggregate.
- The HAVING clause is often used with the GROUP BY clause to filter groups or aggregates based on a specific condition.
Syntax:
-------
SELECT
	col1,
	col2,
	...,
	aggregate_function(col3)
FROM
	table_name
GROUP BY
	col1,
	col2,
	...
HAVING
	condition
*/

/* Difference between WHERE and HAVING
- The WHERE clause allows you to filter rows based on a specified condition. 
- However, the HAVING clause allows you to filter groups of rows according to a specified condition.
- In other words, the WHERE clause is applied to rows while the HAVING clause is applied to groups of rows.

*/

/*
NOTES:
FROM
 |
 V
WHERE
 |
 V
GROUP BY
 |
 V
HAVING
 |
 V
SELECT
 |
 V
DISTINCT
 |
 V
ORDER BY
 |
 V
LIMIT

*/

/*Query_1a: List all customers (customer_id) aggegrated by total amount paid over 200 USD*/
SELECT
	customer_id,
	SUM(amount) total_amount_paid
FROM
	payment
GROUP BY
	customer_id
HAVING 
	SUM(amount) > 200;

/*Query_1b: List all customers (customer_name) aggegrated by total amount paid over 200 USD*/
SELECT
	first_name ||' '||last_name customer_name,
	SUM(amount) total_amount_paid
FROM
	payment
	INNER JOIN customer USING(customer_id)
GROUP BY
	customer_id
HAVING 
	SUM(amount) > 200;

/*Query_1c: List all (customers (customer_name) and staff (staff_name)) pair aggegrated by total amount paid over 200 USD*/
SELECT
	c.first_name ||' '||c.last_name customer_name,
	s.first_name ||' '||s.last_name staff_name,
	SUM(amount) total_amount_paid
FROM
	payment
	INNER JOIN customer c USING(customer_id)
	INNER JOIN staff s USING(staff_id)
GROUP BY
	customer_name,
	staff_name
HAVING 
	SUM(amount) > 100;
	
/*Query_2: Find number of customers per store*/
/*2a. Find how many distinct stores are there*/
SELECT
	DISTINCT store_id
FROM
	customer;


/*2b. Find number of customers per store*/
SELECT
	store_id,
	COUNT(customer_id)
FROM
	customer
GROUP BY
	store_id;

/*2c. Find stores having more than 300 customers*/
SELECT
	store_id,
	COUNT(customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING
	COUNT(customer_id) >300;



	
	
	