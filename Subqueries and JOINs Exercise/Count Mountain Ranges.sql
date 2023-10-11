SELECT 
	mountains_countries.country_code, 
	COUNT(mountains.mountain_range) AS mountain_range_count
FROM mountains_countries JOIN mountains ON mountains.id = mountains_countries.mountain_id
WHERE country_code = 'US' OR country_code = 'RU' or country_code = 'BG'
GROUP BY country_code
ORDER BY mountain_range_count DESC;
