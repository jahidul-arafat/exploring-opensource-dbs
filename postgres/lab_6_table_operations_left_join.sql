-- Lab_06: Table Operations: LEFT JOIN
-- Suppose you have two Tables: <A> and <B>
-- Each row in table <A> may have zero or many corrosponding rows in table <B>, while each row in table <B> has one and only row in table <A>.
-- To select data from table <A> that may or may not have corrosponding rows in table <B>, use LEFT JOIN clause

-- Query_01: List all films which belongs to No or More inventories
-- Scenario:
	-- Each film belongs to zero or more inventory. i.e. 
	-- film <abc> --> inventory<classic>
	-- film <abc> --> inventory<drama>
	-- film <xyz> --> inventory<action>
	-- film <ijk> --> NULL
	
	-- Each row in the film table may have zero or many rows in the inventory table.
	-- Each row in the inventory table has one and only one row in the film table
	
	-- <film_id :: fk_at_inventory :: pk_at_film> column establish the link between the <film> and <inventory>

	-- @Table<film>			: 		film_id, title
	-- @Table<inventory>	:		inventory_id, film_id<fk_film>

SELECT
	f.film_id,
	title,
	inventory_id
FROM 
	film as f
LEFT JOIN inventory as i
	ON i.film_id = f.film_id
ORDER BY
	title;
	
	
-- Query_02: List all films which doesnt belong to any inventory. Means, inventory is NULL
SELECT
	f.film_id,
	title,
	inventory_id
FROM 
	film as f
LEFT JOIN inventory as i
	ON i.film_id = f.film_id
WHERE 
	inventory_id IS NULL
ORDER BY
	title;
	
-- Hence both table having the same column name <film_id>, then instead of using alias <as>
-- try LEFT OUTER JOIN .. USING instead of LEFT JOIN .. ON
SELECT
	film_id,
	title,
	inventory_id
FROM
	film
LEFT OUTER JOIN inventory
	USING (film_id)
WHERE 
	inventory_id IS NULL
ORDER BY
	title;
	
	