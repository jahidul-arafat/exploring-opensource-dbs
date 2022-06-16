-- Section_01: PostgreSQL Basic Select

-- Query01: Select first name, last name and email from table <customer>
-- SELECT 
-- 	first_name,
-- 	last_name,
-- 	email
-- FROM customer;

-- -- Query02: Select all from customer
-- SELECT *
-- FROM customer;

-- -- Query03: using PostgreSQL SELECT statement to return full names and emails of all customers
-- SELECT
-- 	first_name || ' ' || last_name as fullname,
-- 	email
-- FROM customer

-- Query04: PostgreSQL SELECT statement with expression example
-- SELECT 5 * 3;

-- Section_02: PostgreSQL Column Aliases
-- SELECT 
-- 	first_name,
-- 	last_name as surname
-- FROM customer;

-- SELECT 
-- 	first_name,
-- 	last_name surname
-- FROM customer;

-- SELECT 
-- 	first_name ||' '|| last_name as fullname
-- FROM customer;

-- SELECT 
-- 	first_name ||' ' || last_name "full name"
-- FROM customer;

-- Section_02: PostgreSQL ORDER BY
-- ASC is the default option for ORDER BY clause
-- SELECT 
-- 	first_name,
-- 	last_name
-- FROM customer
-- ORDER BY first_name;

-- SELECT 
-- 	first_name,
-- 	last_name
-- FROM customer
-- ORDER BY first_name ASC;

-- SELECT 
-- 	first_name,
-- 	last_name
-- FROM customer
-- ORDER BY last_name DESC;

-- sort rows by multiple columns
-- -- select the first name and last name from the customer table and sorts the rows by first name in ascending order and last name in descending order
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM
-- 	customer
-- ORDER BY
-- 	first_name ASC,
-- 	last_name DESC;

-- -- ORDER BY clause to sort rows by expression
-- SELECT
-- 	first_name,
-- 	LENGTH(first_name) len
-- FROM customer
-- ORDER BY
-- 	len DESC;

-- -- experimenting NULL in table data
-- -- create a new table
-- -- CREATE TABLE null_sort_demo(
-- -- 	num INT
-- -- );

-- -- -- insert some data
-- -- INSERT  INTO null_sort_demo(num)
-- -- VALUES
-- -- 	(1),
-- -- 	(2),
-- -- 	(3),
-- -- 	(null);

-- -- null values by default put at last
-- SELECT num
-- FROM null_sort_demo
-- ORDER BY num;

-- SELECT num
-- FROM null_sort_demo
-- ORDER BY num NULLS LAST;

-- SELECT num
-- FROM null_sort_demo
-- ORDER BY num NULLS FIRST;

-- SELECT num
-- FROM null_sort_demo
-- ORDER BY num DESC;

-- SELECT num
-- FROM null_sort_demo
-- ORDER BY num DESC NULLS LAST;

-- -- Section_03_PostgreSQL SELECT DISTINCT
-- -- CREATE TABLE distinct_demo (
-- --  	id serial NOT NULL PRIMARY KEY,
-- --  	bcolor VARCHAR,
-- -- 	fcolor VARCHAR
-- -- );

-- INSERT INTO distinct_demo (bcolor, fcolor)
-- VALUES
-- 	('red', 'red'),
-- 	('red', 'red'),
-- 	('red', NULL),
-- 	(NULL, 'red'),
-- 	('red', 'green'),
-- 	('red', 'blue'),
-- 	('green', 'red'),
-- 	('green', 'blue'),
-- 	('green', 'green'),
-- 	('blue', 'red'),
-- 	('blue', 'green'),
-- 	('blue', 'blue');
	
-- SELECT * FROM DISTINCT_DEMO;
-- SELECT 
-- 	DISTINCT bcolor
-- FROM 
-- 	distinct_demo
-- ORDER BY bcolor NULLS LAST;

-- -- the query combines the <bcolor> and <fcolor> from <table_distinct_demo> to evaluate the 
-- -- uniqueness of the rows
-- SELECT 
-- 	DISTINCT bcolor,
-- 	fcolor
-- FROM
-- 	distinct_demo
-- ORDER BY
-- 	bcolor,
-- 	fcolor;

-- -- postgreSQL DISTINCT ON example
-- -- The following statement sorts the result set by the <bcolor> and <fcolor> and then for each group of
-- -- duplicate, it keeps the first row in the returned result set.
-- -- It is a good practice to always use the ORDER BY clause with the DISTINCT ON(expression) to make the result set predictable.

-- -- bad practice, unpredictable output
-- -- SELECT 
-- -- 	DISTINCT ON (bcolor) bcolor,
-- -- 	fcolor
-- -- FROM 
-- -- 	distinct_demo;
	
-- -- good practice, predictable output
-- SELECT 
-- 	DISTINCT ON (bcolor) bcolor,
-- 	fcolor
-- FROM 
-- 	distinct_demo
-- ORDER BY
-- 	bcolor,
-- 	fcolor;
	
-- -- Section_04: postgreSQL WHERE
-- -- SELECT select_list
-- -- FROM table_name
-- -- WHERE condition
-- -- ORDER BY sort_expression

-- -- WHERE clause equal(=) operator
-- SELECT
-- 	last_name,
-- 	first_name
-- FROM
-- 	customer
-- WHERE
-- 	first_name = 'Jamie'
-- ORDER BY last_name DESC;

-- -- WHERE clause equal(=), AND
-- SELECT
-- 	last_name,
-- 	first_name
-- FROM
-- 	customer
-- WHERE
-- 	first_name = 'Jamie' AND
-- 	last_name = 'Rice';

-- -- WHERE clause equal(=), OR
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM 
-- 	customer
-- WHERE
-- 	last_name = 'Rodriguez' OR
-- 	first_name = 'Adam'
-- ORDER BY 
-- 	first_name;

-- -- WHERE clause IN operator
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM
-- 	customer
-- WHERE
-- 	first_name IN ('Ann','Anne','Annie');

-- -- WHERE clause LIKE operator, kinda regular expression
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM
-- 	customer
-- WHERE
-- 	first_name LIKE 'Ann%'
-- ORDER BY 
-- 	first_name;

-- -- WHERE clause BETWEEN operator
-- SELECT
-- 	first_name,
-- 	LENGTH(first_name) name_length
-- FROM
-- 	customer
-- WHERE
-- 	first_name LIKE 'A%' AND
-- 	LENGTH(first_name) BETWEEN 3 AND 5
-- ORDER BY
-- 	name_length;

-- -- WHERE clause not equal (<>) operator
-- SELECT
-- 	first_name,
-- 	last_name
-- FROM
-- 	customer
-- WHERE
-- 	first_name LIKE 'Bra%' AND
-- 	last_name <> 'Mccurdy';
	

-- Section_05: PostgreSQL LIMIT
-- syntax
-- SELECT select_list
-- FROM table_name
-- ORDER BY sort_expression
-- LIMIT row_count;

-- If row_count is zero, the query returns an empty set. 
-- In case row_count is NULL, the query returns the same result set as it does not have the LIMIT clause.

-- to skip a number of rows before returning the row_count
-- If row_to_skip is zero, the statement will work like it doesn’t have the OFFSET clause.
-- SELECT select_list
-- FROM table_name
-- LIMIT row_count OFFSET row_to_skip;

SELECT
	film_id,
	title,
	release_year
FROM 
	film
ORDER BY
	film_id
LIMIT 5;

SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 4 OFFSET 3;

-- get the 10 most expensive films in terms of rental
SELECT
	film_id,
	title,
	rental_rate
FROM 
	film
ORDER BY
	rental_rate DESC
LIMIT 10;


-- Section_06: Fetch clause
-- The FETCH clause is functionally equivalent to the LIMIT clause. If you plan to make your application compatible with other database systems, you should use the FETCH clause because it follows the standard SQL.

SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
FETCH FIRST ROW ONLY; -- FETCH FIRST 1 ROW ONLY;

SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
FETCH FIRST 5 ROW ONLY;

SELECT
	film_id,
	title
FROM
	film
ORDER BY
	title
OFFSET 5 ROWS
FETCH FIRST 5 ROWS ONLY;

-- Section_07: PostgreSQL IN
-- Suppose you want to know the rental information of customer id 1 and 2
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id IN (1,2)
ORDER BY
	return_date DESC;

-- Find all rentals with customer id not 1 or 2;
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id NOT IN (1,2)
ORDER BY
	return_date DESC;

-- Returns a list of customer ids from the <rental> table with the return date is <2005-05-27>
SELECT 
	customer_id
FROM
	rental
WHERE CAST(return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

-- List all cusotmer_id, their first_name and last_name who has returned the rental DVDs on <2005-05-27>
SELECT
	customer_id,
	first_name ||' ' || last_name customer_name
FROM 
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST(return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;

-- Section_08: BETWEEN Clause
-- value >=low and value <=high

-- List all customer_id, payment_id and amount whose paid amount was in between 8 to 9 USD
SELECT
	customer_id,
	payment_id,
	amount
FROM 
	payment
WHERE
	amount BETWEEN 8 AND 9;
	
SELECT
	COUNT(payment_id) "Total Payments Made",
	COUNT(DISTINCT customer_id) "Total Customers Associated",
	ROUND (AVG (amount),3) "Average Amount"
FROM 
	payment
WHERE
	amount BETWEEN 8 and 9;

-- List all customer_id, payment_id and amount whose paid amount is not in between 8 to 9 USD
SELECT
	customer_id,
	payment_id,
	amount
FROM 
	payment
WHERE
	amount NOT BETWEEN 8 and 9;

-- List all customer_id, payment_id and amount whose has paid in between 02/07/2007 to 02/15/2007
-- DATE in ISO 8601 format: YYYY-MM-DD
SELECT
	customer_id,
	payment_id,
	amount,
	payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';
	
-- Section_09: LIKE clause
-- SELECT
-- 	'foo' LIKE 'foo', -- true
-- 	'foo' LIKE 'f%', -- true
-- 	'foo' LIKE '_o_', -- true
-- 	'bar' LIKE 'b_'; -- false

-- List all customers whose first name contains 'er' string i.e. Jenifer, Kimberly etc
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '%er%'
ORDER BY
	first_name;

-- List all customers who has 'her' from 2nd position
-- use _her%
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY
	first_name;

-- Find customers whose first name doesn't begin with 'Jen'
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name NOT LIKE 'Jen%'
ORDER BY
	first_name;
	
-- LIKE is case sensitive
-- use ILIKE for case-insentivity
-- List all customers whose name starts with BAR
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name ILIKE 'bar%'
ORDER BY
	first_name;


	




