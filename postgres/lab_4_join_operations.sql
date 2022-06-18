-- Lab-04: PostgreSQL Joins
-- inner join
-- left join
-- right join
-- full outer join
-- cross join
-- natural join
-- self-join

-- Section_01: Setting up sample tables
-- Suppose you have two tables called <basket_a> and <basket_b> that store fruits
-- CREATE TABLE basket_a(
-- 	a INT PRIMARY KEY,
-- 	fruit_a VARCHAR(100) NOT NULL
-- );

-- CREATE TABLE basket_b(
-- 	b INT PRIMARY KEY,
-- 	fruit_b VARCHAR(100) NOT NULL
-- );

-- INSERT INTO basket_a(a, fruit_a)
-- VALUES
-- 	(1,'Apple'),
-- 	(2,'Orange'),
-- 	(3,'Banana'),
-- 	(4,'Cucumber');

-- INSERT INTO basket_b(b,fruit_b)
-- VALUES
-- 	(1,'Orange'),
-- 	(2,'Apple'),
-- 	(3,'Watermelon'),
-- 	(4,'Peer');

--  these two table has some common fruits <apple> and <orange>

-- Section_02: Inner Join
-- Joins the first table <basket_a> and second table <basket_b> by matching the values in fruit_a and fruit_b columns
-- It compares the values of fruit_a column with the value of fruit_b column for each row in basket_b
-- Means, here total 4X6=16 Comparisons will be performed
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
INNER JOIN basket_b
	ON fruit_a = fruit_b;
	
-- Section_03: LEFT JOIN / LEFT OUTER JOIN
-- Left table: 	basket_a
-- Right lable:	basket_b

-- Left join starts selecting data from the left table.
-- It compares values in the <fruit_a> of <basket_a> with the values in the <fruit_b> of <basket_b>
-- If these values are equal, the left join create a new row containing columns of both tables and adds this new row to the result set
-- Else, the left join still creates a new row containing columns of both tables. However, it fills the columns of second table with [null]

SELECT 
	a,
	fruit_a,
	b,
	fruit_b
FROM basket_a 				-- left table
LEFT JOIN basket_b			-- right table
	ON fruit_a = fruit_b;

-- LEFT OUTER JOIN
-- Returns rows of left table <basket_a> who doesnt have matching rows from right table <basket_b>
-- Returns only rows from the left table <basket_a>
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM basket_a
LEFT JOIN basket_b
	ON fruit_a = fruit_b
WHERE
	b is NULL;
	
-- Section_04: RIGHT JOIN / RIGHT OUTER JOIN
-- RIGHT JOIN is a reversed version of the LEFT JOIN
-- It compares the values in fruit_b from <basket_b>, compare it fruit_a from <basket_a> for each rows.
	-- if Match, returns the rows
	-- ELSE, returns the rows, but with <basket_a> NULL values in the columns

SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM basket_a
RIGHT JOIN basket_b
	ON fruit_a = fruit_b;

-- Retuns only the rows from the RIGHT TABLE who doesnt have a matchin row in LEFT TABLE
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM basket_a
RIGHT JOIN basket_b
	ON fruit_a = fruit_b
WHERE
	a is NULL;

-- Section_05: FULL JOIN/ FULL OUTER JOIN
-- Return rows of both table in the case matching or not matching
	-- if not matching, fill the respective columns with NULL
-- Total 6 rows returned (2 Common + 2 distinct at basket_a + 2 distinct at basket_b)

SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM 
	basket_a
FULL OUTER JOIN basket_b
	ON fruit_a = fruit_b;

-- Return rows in a table that do not have matching row in the other
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
FULL JOIN basket_b
	ON fruit_a = fruit_b
WHERE 
	a IS NULL OR 
	b IS NULL;
		