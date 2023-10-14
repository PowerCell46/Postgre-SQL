
CREATE OR REPLACE PROCEDURE sp_players_team_name(player_name VARCHAR(50), OUT team_name VARCHAR(45))
AS
$$
	DECLARE
		current_team VARCHAR(50);

	BEGIN
		SELECT 
			teams.name INTO current_team
		FROM players 
		JOIN teams ON teams.id = players.team_id
		WHERE CONCAT(first_name, ' ', last_name) = player_name;	
		
		IF current_team IS NOT NULL THEN team_name :=current_team;
		ELSE team_name := 'The player currently has no team';
		END IF;
	END;
$$
LANGUAGE plpgsql;


-- CALL sp_players_team_name('Isaak Duncombe', '')	
