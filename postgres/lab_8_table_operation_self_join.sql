-- Lab_08: Table Operation/ SELF-JOIN
-- Why SELF-JOIN?
	-- to query hierarchical data or to compare rows within the same table
-- A PostgreSQL self-join is a regular join that joins a table to itself using the <INNER JOIN> or <LEFT JOIN>.

-- Query_01: Find who (employees) report to whom (manager)
-- We will have a single table <employee>
-- There should not be another table <manager>

-- Create table <employee>
-- DROP TABLE IF EXISTS employee;

-- CREATE TABLE IF NOT EXISTS employee(
-- 	emp_id INT PRIMARY KEY,
-- 	f_name VARCHAR(255) NOT NULL,
-- 	l_name VARCHAR(255) NOT NULL,
-- 	manager_id INT,
-- 	FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
-- 	ON DELETE CASCADE
-- );

-- Scenario: 
-- In this employee table, the manager_id column references the empl_id column. 
-- The value in the manager_id column shows the manager that the employee directly reports to. 
-- When the value in the manager_id column is null, that employee does not report to anyone. 
-- In other words, he or she is the top manager.

-- INSERT INTO employee(emp_id, f_name,l_name,manager_id)
-- VALUES
-- 	(1, 'Windy', 'Hays', NULL),
-- 	(2, 'Ava', 'Christensen', 1),
-- 	(3, 'Hassan', 'Conner', 1),
-- 	(4, 'Anna', 'Reeves', 2),
-- 	(5, 'Sau', 'Norman', 2),
-- 	(6, 'Kelsie', 'Hays', 3),
-- 	(7, 'Tory', 'Goff', 3),
-- 	(8, 'Salley', 'Lester', 3);

SELECT
	e.f_name ||' '|| e.l_name employee,
	m.f_name ||' '|| m.l_name manager
FROM
	employee e
INNER JOIN employee m
	ON m.emp_id = e.manager_id
ORDER BY
	manager;

-- Problem: See, Top manager does not appear in the output
-- Solution: use LEFT JOIN
SELECT
	e.f_name ||' '|| e.l_name employee,
	m.f_name ||' '|| m.l_name manager
FROM
	employee e
LEFT JOIN employee m
	ON m.emp_id = e.manager_id
ORDER BY
	manager;

-- Query_02: Find all films having the same length(title)
-- Means, title could be different, but their length(title) is same

SELECT
	f1.title "Movie 1 Title",
	f2.title "Movie 2 title",
	f1.length
FROM 
	film f1
INNER JOIN film f2
	ON 	f1.film_id <> f2.film_id AND
		f1.length = f2.length;