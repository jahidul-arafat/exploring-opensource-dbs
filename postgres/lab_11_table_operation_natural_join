/*Lab_11: Table Operation / NATURAL JOIN
- A NATURAL JOIN can be an INNER JOIN, LEFT JOIN or RIGHT JOIN
- If you do not specify a join explicitely, PostgreSQL will use INNER JOIN by default
- at NATIURAL JOIN you cant specify the predicate
- Try to avoid NATURAL JOIN if possible, because this may return inconsistent result if both tables having multiple common columns
- NATURAL JOIN is suggested when two tables having a single common column 
*/

/*
DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories(
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(255) NOT NULL,
	category_id INT NOT NULL
	-- FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_name)
VALUES
	('Smart Phone'),
	('Laptop'),
	('Tablet'),
	('Sports');

INSERT INTO products(product_name,category_id)
VALUES
	('iPhone',1),
	('Samsung Galaxy', 1),
	('HP Elite', 2),
	('Lenovo Thinkpad', 2),
	('iPad', 3),
	('Kindle Fire', 3),
	('Burger',5)
*/

-- Query_01: List all products belongs to a category or category having atleat one product
SELECT 
	product_name,
	category_name
FROM products
NATURAL JOIN categories; -- Acts like INNER JOIN

-- Query_02: List all produts belongs to no categories
SELECT 
	product_name,
	category_name
FROM products
NATURAL LEFT JOIN categories
WHERE category_name IS NULL;

-- Query_03: List all categories having no product
SELECT 
	category_name,
	product_name
FROM products
NATURAL RIGHT JOIN categories
WHERE product_name IS NULL;


-- Query_04: where NATURAL JOIN would fail
/*
Table<city>		: city_id, city, country_id,last_update
Table<country>	: country_id, country, last_update

Dillema: Two having having more than one column in common: <country_id>, <last_update>
- Find all city-country association
*/

-- This query returns nothing, which was not expected.
SELECT
	city,
	country
FROM city
NATURAL JOIN country; -- acts as INNER JOIN

-- Solution: Avoid NATURAL JOIN
SELECT
	count(city) city_count,
	country
FROM city
INNER JOIN country USING(country_id)
GROUP BY country
ORDER BY city_count DESC
FETCH first 10 rows only;




	