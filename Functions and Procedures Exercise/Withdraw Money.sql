CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INTEGER, money_amount NUMERIC)
AS 
$$
BEGIN 
    CASE 
        WHEN (SELECT balance FROM accounts WHERE id = account_id) < money_amount THEN 
            RAISE NOTICE 'Insufficient balance to withdraw %.2f', money_amount;
        ELSE 
            UPDATE accounts
            SET balance = balance - money_amount
            WHERE id = account_id;
    END CASE;
END;
$$
LANGUAGE plpgsql;

