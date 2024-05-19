CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS BOOLEAN AS 
$$
	DECLARE	
		letters VARCHAR(50);
		final_word VARCHAR(50);
	BEGIN
		letters := LOWER(set_of_letters);
		final_word := LOWER(word);
		
		WHILE (LENGTH(letters) > 0 AND LENGTH(final_word) > 0) LOOP
			final_word := replace(final_word, SUBSTRING(letters, 1, 1), ''); -- removing the current chr from the word			
			
			IF 
				LENGTH(letters) = 1 THEN letters := ''; -- updating the value of the letters
			ELSE 
				letters := substring(letters, 2, (SELECT LENGTH(letters) - 1));
			END IF;
			
		END LOOP;
		
		RETURN LENGTH(final_word) = 0;
	END;
$$
LANGUAGE PLPGSQL;
