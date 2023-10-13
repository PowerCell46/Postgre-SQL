SELECT 
	board_games.id,
	board_games.name,
	board_games.release_year,
	categories."name"
FROM board_games
JOIN categories ON categories.id = board_games.category_id
WHERE categories."name" = 'Strategy Games' OR categories.name = 'Wargames'
ORDER BY release_year DESC;
