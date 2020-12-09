Exercice1.

SELECT CompanyName, ContactName, ContactTitle, Phone 
FROM customers 
WHERE Country="France";


Exercice2.

SELECT products.ProductName 
FROM products 
JOIN suppliers 
ON suppliers.SupplierID=products.SupplierID 
WHERE suppliers.CompanyName="Exotic Liquids";


Exercice3.

SELECT suppliers.CompanyName, COUNT(*) AS Nombre_produits 
FROM suppliers 
JOIN products 
ON products.SupplierID=suppliers.SupplierID 
WHERE suppliers.Country='France'
GROUP BY suppliers.CompanyName
ORDER BY Nombre DESC; 


Exercice4.

SELECT customers.CompanyName, COUNT(*) AS Nombre_commande
FROM customers 
JOIN orders 
ON customers.CustomerID=orders.CustomerID 
WHERE customers.Country="France"
GROUP BY customers.CompanyName  
HAVING Nombre_commande>10; 


Exercice5.

On peut faire 2 façon:

SELECT customers.CompanyName AS Client, SUM(`order details`.UnitPrice * `order details`.Quantity) AS CA, customers.Country AS Pays
FROM customers, orders, `order details` 
WHERE customers.CustomerID=orders.CustomerID
AND orders.OrderID=`order details`.OrderID 
GROUP BY customers.CompanyName, customers.Country
HAVING CA > 30000
ORDER BY CA DESC

soit
 
SELECT customers.CompanyName AS Client, SUM(`order details`.UnitPrice*Quantity) AS CA, customers.Country AS Pays
FROM customers 
JOIN orders 
ON customers.CustomerID=orders.CustomerID
JOIN `order details` 
ON orders.OrderID=`order details`.OrderID 
GROUP BY customers.CompanyName, customers.Country
HAVING CA > 30000
ORDER BY CA DESC 


Exercice6.

SELECT customers.Country AS Pays
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
JOIN `order details`
ON orders.OrderID=`order details`.OrderID
JOIN products
ON `order details`.ProductID=products.ProductID
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE suppliers.CompanyName="Exotic Liquids"
GROUP BY Pays
ORDER BY Pays ASC


Exercice7.

SELECT SUM(`order details`.UnitPrice*Quantity) AS Montant_Ventes_97
FROM `order details`, orders
WHERE orders.OrderID=`order details`.OrderID 
AND orders.ShippedDate BETWEEN '1997/01/01' AND '1997/12/31'


Exercice8.

SELECT MONTH(orders.ShippedDate) AS Mois,  SUM(`order details`.UnitPrice*Quantity) AS Montant_Ventes_97
FROM `order details`, orders
WHERE orders.OrderID=`order details`.OrderID 
AND orders.ShippedDate BETWEEN '1997/01/01' AND '1997/12/31' 
GROUP BY Mois
HAVING Mois BETWEEN '01' AND '12'
 

Exercice9.

SELECT orders.OrderDate AS Date_de_derniere_commande
FROM orders, customers
WHERE orders.CustomerID=customers.CustomerID 
AND customers.CompanyName="Du monde entier"
ORDER BY Date_de_derniere_commande DESC 
LIMIT 1


Exercice10.

SELECT ROUND(AVG(TO_DAYS(orders.ShippedDate)-TO_DAYS(orders.OrderDate))) AS `Délai moyen de livraison en jours` 
FROM orders






