CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE(total_cash NUMERIC) AS
$$
	BEGIN
		CREATE TEMPORARY TABLE cash(
			id SERIAL,
			cash NUMERIC
		);

		INSERT INTO CASH(cash)
		(SELECT cash FROM users_games
		JOIN games ON games.id = users_games.game_id
		WHERE games.name = game_name
		ORDER BY cash desc);
		
		RETURN QUERY (SELECT ROUND(SUM(CASH), 2) as total_cash
		FROM CASH 
		WHERE id % 2 != 0);
		
		DROP TABLE cash;
	END;
$$
LANGUAGE PLPGSQL;
