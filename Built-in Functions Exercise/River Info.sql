CREATE VIEW view_river_info AS
SELECt CONCAT('The river ', river_name, ' flows into the ', outflow, ' and is ', length, ' kilometers long.') AS "River information" FROM rivers ORDER BY "River information";
