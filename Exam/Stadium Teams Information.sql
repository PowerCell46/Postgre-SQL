CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS TABLE( team_name VARCHAR(50) ) AS 
$$
	BEGIN
	
		RETURN QUERY (
			SELECT
				name 
			FROM teams
			WHERE stadium_id = (SELECT id FROM stadiums WHERE name = stadium_name)
			ORDER BY teams.name ASC
			);
	
	END;

$$
LANGUAGE plpgsql;
