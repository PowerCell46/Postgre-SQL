UPDATE coaches
SET salary = salary * coach_level
WHERE LOWER(coaches.first_name) LIKE 'c%'
AND coaches.id IN (SELECT coach_id FROM players_coaches GROUP BY coach_id);
