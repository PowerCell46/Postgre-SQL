SELECT
	teams.id AS team_id,
	teams.name AS team_name,
	COUNT(players.id) AS player_count,
	teams.fan_base
FROM players
	RIGHT JOIN teams ON players.team_id = teams.id
WHERE teams.fan_base > 30000
GROUP BY(teams.id)
ORDER BY player_count DESC, teams.fan_base DESC;
