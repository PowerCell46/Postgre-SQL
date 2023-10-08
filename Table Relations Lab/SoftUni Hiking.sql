SELECT 
	routes.start_point,
	routes.end_point,
	routes.leader_id,
	CONCAT_WS(' ', campers.first_name, campers.last_name)
FROM routes
JOIN campers ON
routes.leader_id = campers.id;
