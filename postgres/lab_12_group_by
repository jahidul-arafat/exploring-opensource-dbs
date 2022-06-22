/*Lab_12: PostGreSQL Group By*/
/*
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
	...;
*/

/*
NOTES:
- PostgreSQL evaluate <GROUP BY> clause after FROM and WHERE clause and before the HAVING, SELECT, DISTINCT, ORDER BY and LIMIT Clause
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

/*Query_01: List the total amount paid by customers (customer_id) and list the top 10 customer ID*/

SELECT
	customer_id, 
	SUM(amount) "amount_paid"
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	amount_paid DESC
FETCH FIRST 10 ROWS ONLY;

/*Query_02: GROUP BY clause with JOIN clause
List the total amount paid by customers (customer_name=first_name+last_name) and list the top 10 customer names
*/

SELECT
	first_name||' '||last_name customer_name,
	SUM(amount) "total_amount"
FROM
	payment
	INNER JOIN customer USING(customer_id)
GROUP BY
	customer_id
ORDER BY
	total_amount DESC
FETCH FIRST 10 ROWS ONLY;

/*Query_03: How many payments processed by each staff(staff_id)*/
SELECT
	staff_id,
	count(payment_id) "payment_count"
FROM 
	payment
GROUP BY
	staff_id
ORDER BY
	payment_count DESC;

/*Query_04: How many payments processed by each staff(staff_name=first_name+last_name)*/
SELECT
	first_name||' '||last_name "staff_name",
	COUNT(payment_id) "payment_count"
FROM
	payment
	INNER JOIN staff USING(staff_id)
GROUP BY
	staff_id
ORDER BY
	payment_count DESC;

/*Query_05: Group By Clause with multiple columns
Group By (customer_id, staff_id)
List top 10 payments made which is grouped by (customer_id, staff_id)
*/

SELECT
	customer_id,
	staff_id,
	SUM(amount) "total_amount_paid"
FROM
	payment
GROUP BY
	customer_id,
	staff_id
ORDER BY
	total_amount_paid DESC
FETCH FIRST 10 ROWS ONLY;

/*Query_06- 3 WAY INNER JOIN
List top 10 payments made which is grouped by (customer name, staff name)
*/
SELECT
	c.first_name||' '||c.last_name "customer_name",
	s.first_name||' '||s.last_name "staff_name",
	SUM(amount) "total_amount_paid"
FROM
	payment
	INNER JOIN customer c USING(customer_id)
	INNER JOIN staff s USING(staff_id)
GROUP BY
	customer_name,
	staff_name
ORDER BY
	total_amount_paid DESC
FETCH FIRST 10 ROWS ONLY;

/*Query_7a: PostgreSQL GROUP BY Clause with date column
List total amount paid on each date
*/

SELECT
	DATE(payment_date) paid_date,
	SUM(amount) "total_amount_paid"
FROM
	payment
GROUP BY
	paid_date;

/*Query_7b: PostgreSQL GROUP BY Clause with date column
List op 10 total amount paid grouped by each date
*/

SELECT
	DATE(payment_date) paid_date,
	SUM(amount) "total_amount_paid"
FROM
	payment
GROUP BY
	paid_date
ORDER BY
	total_amount_paid DESC
FETCH FIRST 10 ROWS ONLY;
	
	
	
	
	
	
	
	
	
	