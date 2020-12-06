SELECT sta_nom, hot_nom, hot_categorie, hot_ville FROM station JOIN hotel ON sta_id=hot_id;
SELECT hot_nom, hot_categorie, hot_ville, cha_numero FROM hotel JOIN chambre ON hot_id=cha_id;
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite FROM hotel JOIN chambre ON hot_id=cha_id;
SELECT cli_nom, hot_nom, res_date FROM client INNER JOIN hotel ON cli_id=hot_id JOIN reservation ON hot_id=res_id;
SELECT sta_nom, hot_nom, cha_numero, cha_capacite FROM station JOIN hotel ON sta_id=hot_id JOIN chambre ON hot_id=cha_id; 
SELECT cli_nom, hot_nom, DATEDIFF(res_date_fin, res_date_debut) AS "durée du séjour (jours)" FROM client JOIN hotel ON cli_id=hot_id JOIN reservation ON hot_id=res_id 


