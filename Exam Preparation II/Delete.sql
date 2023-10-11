DELETE FROM clients
WHERE id NOT IN (SELECT client_id FROM courses GROUP BY client_id ORDER BY client_id) AND 
LENGTH(full_name) > 3;
