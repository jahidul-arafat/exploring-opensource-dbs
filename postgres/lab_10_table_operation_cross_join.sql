-- Lab_10: Table Operation/ CROSS JOIN
-- A CROSS JOIN clause allows you to produce a Cartesian Product of rows in two or more tables.
-- Different from other join clauses such as LEFT JOIN  or INNER JOIN, the CROSS JOIN clause does not have a join predicate.

-- Suppose you have to perform a CROSS JOIN of two tables T1 and T2.
-- If T1 has n rows and T2 has m rows, the result set will have nxm rows. 
-- For example, the T1 has 1,000 rows and T2 has 1,000 rows, the result set will have 1,000 x 1,000 = 1,000,000 rows.

-- Syntax_01: CROSS JOIN
-- SELECT select_list
-- FROM T1
-- CROSS JOIN T2;

-- Syntax_02: CROSS JOIN (alternative)
-- SELECT select_list
-- FROM T1,T2;

-- Syntax_03: CROSS JOIN (using INNER JOIN..ON..true)
-- SELECT select_list
-- FROM T1
-- INNER JOIN T2 ON TRUE;

-- Environment Setup
-- Create two table named <T1> and <T2>
/*
DROP TABLE IF EXISTS T1;
CREATE TABLE IF NOT EXISTS T1(
	label CHAR(1) PRIMARY KEY
);

DROP TABLE IF EXISTS T2;
CREATE TABLE IF NOT EXISTS T2(
	score INT PRIMARY KEY
);

INSERT INTO T1(label)
VALUES 
	('A'),
	('B');

INSERT INTO T2(score)
VALUES
	(1),
	(2),
	(3);
*/

-- Query_01: Cartisian Cross
SELECT *
FROM T1
CROSS JOIN T2
ORDER BY T1;
