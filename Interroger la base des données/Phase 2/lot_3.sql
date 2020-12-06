SELECT hot_sta_id AS station, COUNT(*) AS nombre_hotel FROM hotel GROUP BY hot_sta_id;

SELECT station.sta_id, sum(chambre.cha_type) AS nombre_chambre FROM station JOIN hotel ON station.sta_id=hotel.hot_sta_id 
JOIN chambre ON chambre.cha_hot_id=hotel.hot_id GROUP BY station.sta_id, chambre.cha_type;

SELECT station.sta_id, chambre.cha_capacite, COUNT(*) AS nombre_chambre FROM station JOIN hotel ON station.sta_id=hotel.hot_sta_id 
JOIN chambre ON chambre.cha_hot_id=hotel.hot_id GROUP BY station.sta_id, chambre.cha_capacite HAVING chambre.cha_capacite>1;

SELECT client.cli_nom, hotel.hot_nom FROM client JOIN reservation ON client.cli_id=reservation.res_cli_id 
JOIN chambre ON reservation.res_cha_id=chambre.cha_id JOIN hotel ON chambre.cha_hot_id=hotel.hot_id WHERE client.cli_nom="Squire";  

SELECT station.sta_id, AVG(DATEDIFF(reservation.res_date_fin, reservation.res_date_debut)) AS durée_moyenne FROM reservation 
JOIN chambre ON reservation.res_cha_id=chambre.cha_id JOIN hotel ON chambre.cha_hot_id=hotel.hot_id 
JOIN station ON hotel.hot_sta_id=station.sta_id 
GROUP BY station.sta_id; 


