SELECT 
	towns.town_id,
	towns.name,
	addresses.address_text 
FROM towns JOIN addresses on addresses.town_id = towns.town_id
WHERE towns.name = 'San Francisco' OR towns.name = 'Sofia' OR towns.name = 'Carnation'
ORDER BY addresses.town_id, addresses.address_id;
