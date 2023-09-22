CREATE VIEW view_continents_countries_currencies_details AS
SELECT 

	CONCAT_WS(': ', continents.continent_name, continents.continent_code) AS "Continent Details",
	CONCAT_WS(' - ', countries.country_name, countries.capital, countries.area_in_sq_km, 'km2') AS "Country Information",
	CONCAT(currencies.description, ' (', currencies.currency_code, ')') AS "Currencies"	

FROM countries, continents, currencies WHERE continents.continent_code = countries.continent_code AND countries.currency_code = currencies.currency_code ORDER BY "Country Information", "Currencies";
