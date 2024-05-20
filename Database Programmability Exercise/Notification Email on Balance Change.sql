CREATE TABLE notification_emails(
	id SERIAL PRIMARY KEY,
	recipient_id INT,
	subject VARCHAR(100),
	body TEXT
);


CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER AS
$$	DECLARE
		subject_content VARCHAR(100);
		body_content TEXT;
	BEGIN
		subject_content := 'Balance change for account: %', new.account_id;
		body_content := 'On % your balance was changed from % to %.', DATE(), new.old_sum, new.new_sum;
		
		INSERT INTO notification_email(recipient_id, subject, body)
		VALUES
			(old.id, subject_content, body_content);
			
		RETURN new;
	END;
$$
LANGUAGE PLPGSQL;


CREATE TRIGGER tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW 
WHEN (old.new_sum <> new.new_sum)
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();

