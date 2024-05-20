CREATE OR REPLACE PROCEDURE sp_transfer_money(sender_id INT, receiver_id INT, amount numeric)
AS 
$$
	BEGIN 
		call sp_withdraw_money(sender_id, amount);
		
		call sp_deposit_money(receiver_id, amount);
	END;
$$
LANGUAGE PLPGSQL;
