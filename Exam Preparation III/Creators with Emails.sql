SELECT 
	CONCAT_WS(' ', creators.first_name, creators.last_name) AS full_name,
	creators.email,
	board_games.rating
FROM creators_board_games 
JOIN creators ON creators.id = creators_board_games.creator_id
JOIN board_games ON board_games.id = creators_board_games.board_game_id
WHERE creators.email LIKE '%.com' AND rating = 8.58 OR rating = 8.60
ORDER BY rating ASC, full_name ASC
LIMIT 3;
