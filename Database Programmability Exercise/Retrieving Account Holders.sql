CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
AS 
$$
	DECLARE
		r RECORD;
	BEGIN 
		FOR r in (SELECT 
				CONCAT_WS(' ', first_name, last_name) as full_name,
				SUM(balance) as balance
			FROM account_holders
			JOIN accounts ON
				accounts.account_holder_id = account_holders.id
			GROUP BY account_holders.id
			HAVING sum(balance) > searched_balance
			ORDER BY full_name)
		LOOP
			RAISE NOTICE '% - %', r.full_name, r.balance;
		END LOOP;
	END;
$$
LANGUAGE PLPGSQL;
