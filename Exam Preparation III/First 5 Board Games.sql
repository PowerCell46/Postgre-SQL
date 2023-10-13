SELECT
	board_games.name, 
	rating, 
	categories.name AS category_name
FROM board_games
	JOIN players_ranges ON  players_ranges.id = board_games.players_range_id
	JOIN categories ON board_games.category_id = categories.id
WHERE rating > 7.00 AND
	(LOWER(board_games.name) LIKE '%a%' OR
	(rating > 7.50 AND min_players BETWEEN 2 AND 5 AND max_players BETWEEN 2 AND 5))
ORDER BY board_games.name ASC, rating DESC
LIMIT 5;
