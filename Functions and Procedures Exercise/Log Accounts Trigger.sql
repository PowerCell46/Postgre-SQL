CREATE TABLE logs(
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	account_id INTEGER,
	old_sum NUMERIC(20, 4),
	new_sum NUMERIC(20, 4)
);


CREATE OR REPLACE FUNCTION trigger_fn_insert_new_entry_into_logs()
RETURNS TRIGGER AS
$$
	BEGIN
		INSERT INTO logs(account_id, old_sum, new_sum)
		VALUES (OLD.id, OLD.balance, NEW.balance);
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER tr_account_balance_change
AFTER UPDATE OF balance ON accounts
FOR EACH ROW 
WHEN 
	(NEW.balance <> OLD.balance)
EXECUTE FUNCTION trigger_fn_insert_new_entry_into_logs();
