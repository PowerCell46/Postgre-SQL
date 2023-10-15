CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS BOOLEAN AS
$$
	BEGIN
		CASE TRANSLATE(LOWER(word), LOWER(set_of_letters), '')
			WHEN '' THEN RETURN true;
			ELSE RETURN false;
		END CASE;
	END
$$
LANGUAGE plpgsql;
