SELECT 
	players.id, 
	CONCAT_WS(' ', first_name, last_name) AS full_name,
	age,
	position,
	salary,
	pace,
	shooting
FROM players
	JOIN skills_data 
	ON skills_data.id = players.skills_data_id
WHERE position = 'A'
	AND team_id IS NULL
	AND (skills_data.pace + skills_data.shooting) > 130;
