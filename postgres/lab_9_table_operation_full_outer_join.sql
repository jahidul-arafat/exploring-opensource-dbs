-- Lab_09: Table Operation/FULL OUTER JOIN
-- Environment Setup
	-- Create two new tables <employees> and <departments>

-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS departments;

-- CREATE TABLE IF NOT EXISTS departments(
-- 	dept_id SERIAL PRIMARY KEY,
-- 	dept_name VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS employees(
-- 	emp_id SERIAL PRIMARY KEY,
-- 	emp_name VARCHAR(255),
-- 	dept_id INTEGER
-- );

-- INSERT INTO departments(dept_name)
-- VALUES
-- 	('Sales'),
-- 	('Marketing'),
-- 	('HR'),
-- 	('IT'),
-- 	('Production');

-- INSERT INTO employees(emp_name, dept_id)
-- VALUES
-- 	('Bette Nicholson', 1),
-- 	('Christian Gable', 1),
-- 	('Joe Swank', 2),
-- 	('Fred Costner', 3),
-- 	('Sandra Kilmer', 4),
-- 	('Julia Mcqueen', NULL);

-- Query_01: FULL OUTER JOIN
-- employees having/not having departments
-- departments having/not having employees

SELECT
	emp_name,
	dept_name
FROM
	employees
FULL JOIN departments USING(dept_id);

-- Query_02: Find departments having no employees
-- Using FULL JOIN will be costly here
-- Try RIGHT JOIN

-- Costly Solution
SELECT
	dept_name,
	emp_name
FROM 
	employees
FULL JOIN departments USING(dept_id)
WHERE
	emp_name IS NULL;

-- Effective Solution/ RIGHT JOIN
SELECT 
	dept_name,
	emp_name
FROM
	employees
RIGHT JOIN departments USING(dept_id)
WHERE
	emp_name IS NULL;

-- Query_03: Find employees having no department
-- Using FULL JOIN will be costly here. 
-- Soluion is using <LEFT JOIN>

-- Costly Solution
SELECT
	emp_name,
	dept_name
FROM
	employees
FULL JOIN departments USING(dept_id)
WHERE
	dept_name IS NULL;
	
-- Effective Solution/ using LEFT JOIN
SELECT
	emp_name,
	dept_name
FROM
	employees
LEFT JOIN departments USING(dept_id)
WHERE
	dept_name IS NULL;



