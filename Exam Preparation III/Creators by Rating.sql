SELECT
	last_name,
	CEIL(AVG(board_games.rating)) average_rating,
	publishers.name
FROM creators_board_games
	JOIN creators ON creators_board_games.creator_id = creators.id
	JOIN board_games ON creators_board_games.board_game_id = board_games.id
	JOIN publishers ON board_games.publisher_id = publishers.id
GROUP BY last_name, publishers.name
HAVING publishers.name = 'Stonemaier Games'
ORDER BY average_rating DESC;
