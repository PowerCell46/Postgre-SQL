SELECT 
	countries.country_name,
	rivers.river_name
FROM countries_rivers
	FULL JOIN countries ON countries_rivers.country_code = countries.country_code
	FULL JOIN rivers ON countries_rivers.river_id = rivers.id
WHERE continent_code = 'AF'
ORDER BY country_name
LIMIT 5;
	
