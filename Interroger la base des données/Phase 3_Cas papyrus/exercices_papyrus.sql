SELECT entcom.numcom as commande_fournisseur_9120 
FROM fournis 
JOIN entcom 
ON entcom.numfou=fournis.numfou 
WHERE fournis.numfou=9120;


SELECT fournis.numfou 
FROM fournis 
JOIN entcom 
ON entcom.numfou=fournis.numfou;


SELECT DISTINCT numfou, COUNT(*) AS nombre_commande 
FROM entcom 
GROUP BY numfou;


SELECT codart, libart, stkale, stkphy, qteann 
FROM produit 
GROUP BY codart 
HAVING stkphy<=stkale AND qteann<1000;


SELECT posfou, nomfou 
FROM fournis 
WHERE posfou IN (75014, 78250, 92200, 85100) 
ORDER BY posfou DESC;


SELECT posfou, nomfou 
FROM fournis 
WHERE posfou IN (75014, 78250, 92200, 85100) 
ORDER BY nomfou ASC;


SELECT numcom, derliv 
FROM ligcom 
WHERE derliv BETWEEN '2007/03/01' AND '2007/03/31';


SELECT numcom, datcom 
FROM entcom 
WHERE obscom IN ("Commande urgente", "Commande cadencée");


SELECT numcom, SUM(qtecde) as total_commande 
FROM ligcom 
GROUP BY numcom;


SELECT numcom, SUM(qtecde) as total_commande 
FROM ligcom 
GROUP BY numcom 
HAVING sum(qtecde)>10000;


SELECT nomfou, numcom, datcom 
FROM fournis 
JOIN entcom 
ON fournis.numfou=entcom.numfou 
GROUP BY nomfou, numcom;


SELECT DISTINCT fournis.numfou, entcom.numcom, entcom.obscom, produit.libart, ligcom.qtecde*ligcom.priuni AS sous_total 
FROM fournis 
JOIN entcom 
ON entcom.numfou=fournis.numfou 
JOIN ligcom 
ON ligcom.numcom=entcom.numcom 
JOIN produit 
ON produit.codart=ligcom.codart 
GROUP BY fournis.numfou, entcom.numcom, produit.libart, ligcom.qtecde, ligcom.priuni 
HAVING entcom.obscom="Commande urgente";


SELECT numcom, datcom, numfou 
FROM entcom 
WHERE numcom=70210;


SELECT libart, prix1 
FROM produit 
JOIN vente 
ON vente.codart=produit.codart 
WHERE prix1<120;


SELECT fournis.numfou, vente.codart, produit.stkphy, produit.stkale 
FROM fournis 
JOIN vente 
ON vente.numfou=fournis.numfou 
JOIN produit 
ON produit.codart=vente.codart 
WHERE produit.stkphy<=produit.stkale*1.5 
ORDER BY vente.codart ASC, fournis.numfou ASC;


SELECT fournis.numfou, vente.codart, vente.delliv, produit.stkphy, produit.stkale 
FROM fournis 
JOIN vente 
ON vente.numfou=fournis.numfou 
JOIN produit 
ON produit.codart=vente.codart 
WHERE produit.stkphy<=produit.stkale*1.5 AND vente.delliv>30 
ORDER BY fournis.numfou ASC, vente.codart ASC;


SELECT vente.numfou, SUM(produit.stkphy) AS total_stock 
FROM vente 
JOIN produit 
ON produit.codart=vente.codart 
GROUP BY vente.numfou 
ORDER BY SUM(produit.stkphy) DESC;   


SELECT produit.codart, produit.qteann, ligcom.qtecde FROM produit JOIN ligcom ON ligcom.codart=produit.codart WHERE ligcom.qtecde>produit.qteann*0.9;

SELECT DISTINCT numfou, qte1*prix1*1.2+qte2*prix2*1.2+qte3*prix3*1.2  as total_CA FROM vente GROUP BY numfou, qte1*prix1*1.2+qte2*prix2*1.2+qte3*prix3*1.2;

UPDATE vente SET prix1=prix1*0.04, prix2=prix2*0.012 WHERE numfou=9180;

UPDATE vente SET prix2=350 WHERE prix2=0;

UPDATE entcom SET obscom='*****' WHERE numfou=8700 AND numfou=9180;

UPDATE entcom, fournis SET obscom='*****' WHERE fournis.satisf<5;

DELETE FROM vente WHERE codart='I110';





      


 



