use toys_and_models;
-- nombre produit le + commandé l'annee en cours
SELECT year(orderDate) as year, sum(quantityOrdered) as nb_produit_commandé, products.productName AS ProdName
From orders
LEFT JOIN orderdetails USING(orderNumber)
LEFT JOIN products USING(productCode)
WHERE year(orderDate) = year(now())
GROUP BY productCode, year, ProdName
Order by nb_produit_commandé desc limit 5;