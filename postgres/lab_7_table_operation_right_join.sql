-- Lab_07: Table Operation / RIGHT JOIN

-- Setting up samplem tables
-- Create 2x table named <films> and <film_reviews>
-- LEFT TABLE	: <films>
-- RIGHT TABLE	: <film_reviews>

-- DROP TABLE IF EXISTS films;
-- DROP TABLE IF EXISTS film_reviews;

-- CREATE TABLE IF NOT EXISTS films(
-- 	film_id SERIAL PRIMARY KEY,
-- 	title VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS film_reviews(
-- 	review_id SERIAL PRIMARY KEY,
-- 	film_id INT,
-- 	review VARCHAR(255) NOT NULL
-- );

-- INSERT INTO films(title)
-- VALUES
-- 	('Joker'),
-- 	('Avengers: Endgame'),
-- 	('Parasite');

-- INSERT INTO film_reviews(film_id, review)
-- VALUES
-- 	(1,'Excellent'),
-- 	(1, 'Awesome'),
-- 	(2, 'Cool'),
-- 	(NULL, 'Beautiful');
	

-- Query_01: For each review in <film_review> table, check whether we have any associated film.
-- Means, find reviews having not film yet
-- LEFT TABLE <films>				: film_id, title
-- RIGHT TABLE <film_reviews>		: review_id, film_id:: fk_films, review

SELECT
	review,
	title
FROM
	films
RIGHT JOIN film_reviews 
	USING(film_id)
WHERE
	title IS NULL;

	
-- Query_02: Find films having no review yet
SELECT
	title,
	review
FROM
	films
LEFT JOIN film_reviews
	USING(film_id)
WHERE 
	review IS NULL;

