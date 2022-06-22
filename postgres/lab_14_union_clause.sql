/*Lab_14: UNION Clause
Ref: https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-union/
*/
/*
SYNTAX:
-------
SELECT select_list_1
FROM table_expresssion_1
UNION
SELECT select_list_2
FROM table_expression_2
*/

/*Environment Setup
- Create a Table named <top_rated_films>			:: Attr <title, release_year>
- Create a Table named <most_popular_films>			:: Attr <title, release_year>
*/

/*
DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);
*/

/*
INSERT INTO
	top_rated_films(title,release_year)
VALUES
	('The Shawshank Redemption',1994),
   	('The Godfather',1972),
   	('12 Angry Men',1957);

INSERT INTO 
   most_popular_films(title,release_year)
VALUES
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);
*/

/*Query-1: PostgreSQL UNION*/
SELECT title,release_year
FROM top_rated_films
UNION
SELECT title,release_year
FROM most_popular_films;

/*Query-2: PostgreSQL UNION ALL - havingn duplicate rows*/
SELECT title,release_year
FROM top_rated_films
UNION ALL
SELECT title,release_year
FROM most_popular_films
ORDER BY
	release_year DESC;
   