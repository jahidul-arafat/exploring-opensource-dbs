-- Section_01: PostgreSQL Basic Select

-- Query01: Select first name, last name and email from table <customer>
-- SELECT 
-- 	first_name,
-- 	last_name,
-- 	email
-- FROM customer;

-- Query02: Select all from customer
-- SELECT *
-- FROM customer;

-- Query03: using PostgreSQL SELECT statement to return full names and emails of all customers
-- SELECT
-- 	first_name || ' ' || last_name as fullname,
-- 	email
-- FROM customer

-- Query04: PostgreSQL SELECT statement with expression example
-- SELECT 5 * 3;

-- Section_02: PostgreSQL Column Aliases
SELECT 
	first_name,
	last_name as surname
FROM customer;

SELECT 
	first_name,
	last_name surname
FROM customer;

SELECT 
	first_name ||' '|| last_name as fullname
FROM customer;

SELECT 
	first_name ||' ' || last_name "full name"
FROM customer;

-- Section_02: PostgreSQL ORDER BY
-- ASC is the default option for ORDER BY clause
SELECT 
	first_name,
	last_name
FROM customer
ORDER BY first_name;

SELECT 
	first_name,
	last_name
FROM customer
ORDER BY first_name ASC;

SELECT 
	first_name,
	last_name
FROM customer
ORDER BY last_name DESC;

-- sort rows by multiple columns
-- select the first name and last name from the customer table and sorts the rows by first name in ascending order and last name in descending order
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

-- ORDER BY clause to sort rows by expression
SELECT
	first_name,
	LENGTH(first_name) len
FROM customer
ORDER BY
	len DESC;

-- experimenting NULL in table data
-- create a new table
-- CREATE TABLE null_sort_demo(
-- 	num INT
-- );

-- -- insert some data
-- INSERT  INTO null_sort_demo(num)
-- VALUES
-- 	(1),
-- 	(2),
-- 	(3),
-- 	(null);

-- null values by default put at last
SELECT num
FROM null_sort_demo
ORDER BY num;

SELECT num
FROM null_sort_demo
ORDER BY num NULLS LAST;

SELECT num
FROM null_sort_demo
ORDER BY num NULLS FIRST;

SELECT num
FROM null_sort_demo
ORDER BY num DESC;

SELECT num
FROM null_sort_demo
ORDER BY num DESC NULLS LAST;




