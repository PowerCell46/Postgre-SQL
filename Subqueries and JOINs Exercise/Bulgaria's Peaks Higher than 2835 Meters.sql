SELECT 
	mountains_countries.country_code, 
	mountains.mountain_range, 
	peaks.peak_name,
	peaks.elevation
FROM mountains
	JOIN mountains_countries ON mountains_countries.mountain_id = mountains.id
	JOIN peaks ON peaks.mountain_id = mountains.id
WHERE elevation > 2835 AND country_code = 'BG'
ORDER BY elevation DESC; 
