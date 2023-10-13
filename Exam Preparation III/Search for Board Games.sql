CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);


CREATE OR REPLACE PROCEDURE usp_search_by_category(category_input VARCHAR(50))
AS 
$$
	BEGIN
		TRUNCATE TABLE search_results;
		INSERT INTO search_results(name, release_year, rating, category_name, publisher_name, min_players, max_players)
		SELECT 
			board_games.name,
			release_year, 
			rating, 
			categories.name as category_name,
			publishers.name,
			players_ranges.min_players::VARCHAR || ' people' as min_players,
			players_ranges.max_players::VARCHAR || ' people' as max_players
		FROM board_games
			JOIN categories ON categories.id = board_games.category_id
			JOIN publishers ON publishers.id = board_games.publisher_id
			JOIN players_ranges ON players_ranges.id = board_games.players_range_id
		WHERE category_id = (SELECT id FROM categories WHERE name = category_input)
		ORDER BY publishers."name" ASC, release_year DESC;
	END;
$$
LANGUAGE plpgsql;
