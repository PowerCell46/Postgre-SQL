CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC)
AS
$$
	BEGIN
		IF account_id NOT IN (SELECT id FROM accounts) THEN RETURN;
		END IF;
		
		UPDATE accounts
		SET balance = balance + money_amount
		WHERE id = account_id;
		
	END;
$$
LANGUAGE PLPGSQL;
