SELECT
	creators.id, 
	CONCAT_WS(' ', creators.first_name, creators.last_name) AS creator_name,
	creators.email
FROM creators_board_games
RIGHT JOIN creators ON creators_board_games.creator_id = creators.id
WHERE creator_id IS NULL;
