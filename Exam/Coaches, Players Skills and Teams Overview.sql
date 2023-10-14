SELECT 
	CONCAT_WS(' ', coaches.first_name, coaches.last_name) AS coach_full_name,
	CONCAT_WS(' ', players.first_name, players.last_name) AS player_full_name,
	teams.name AS team_name,
	skills_data.passing,
	skills_data.shooting,
	skills_data.speed
FROM players_coaches
	JOIN players ON players_coaches.player_id = players.id
	JOIN coaches ON players_coaches.coach_id = coaches.id
	JOIN teams ON players.team_id = teams.id
	JOIN skills_data ON players.skills_data_id = skills_data.id
ORDER BY coach_full_name ASC, player_full_name DESC;
