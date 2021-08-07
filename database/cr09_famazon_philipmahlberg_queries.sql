/* QUERY 1 
how many products were bought from a specific company (excluding quantities)*/
/* OLD VERSION SELECT companies.name, COUNT(*) AS "numberOfPurchasedProducts"
FROM companies
JOIN comp_prod ON comp_prod.FK_companyID = companies.companyID
JOIN custom_prod ON custom_prod.FK_compProdID = comp_prod.compProdID
GROUP BY companies.companyID
; */

/* MORE ACCURATE VERSION takes quantiy into consideration */
SELECT companies.name, SUM(custom_prod.quantity) AS "productsPurchased"
FROM companies
JOIN comp_prod ON comp_prod.FK_companyID = companies.companyID
JOIN custom_prod ON custom_prod.FK_compProdID = comp_prod.compProdID
GROUP BY companies.companyID 
ORDER BY companies.companyID
;

/* QUERY 2 
how many products were bought from a specific company -> make sure to connect orders with custom_prod AKA product was purchased */
SELECT companies.companyID, companies.name, SUM(custom_prod.quantity) AS "productsPurchasedFromCompany"
FROM companies
JOIN comp_prod ON comp_prod.FK_companyID = companies.companyID
JOIN custom_prod ON custom_prod.FK_compProdID = comp_prod.compProdID
JOIN orders ON orders.orderID = custom_prod.FK_orderID
WHERE companies.companyID = 5
GROUP BY companies.companyID
;

/* QUERY 3 
what  products were sent between this and that date -> BETWEEN "2021-06-08" AND "2021-08-09" */
SELECT products.name, SUM(custom_prod.quantity) AS "quantityofProduct"
FROM products
JOIN comp_prod ON comp_prod.FK_productID = products.productID
JOIN custom_prod ON custom_prod.FK_compProdID = comp_prod.compProdID
JOIN orders ON orders.orderID = custom_prod.FK_orderID
JOIN ships_orders ON ships_orders.FK_orderID = orders.orderID
WHERE ships_orders.dateShipped BETWEEN "2021-06-08" AND "2021-08-09"
GROUP BY products.name
ORDER BY products.name
;

/* QUERY 4 
how many products were sent to a specific city -> Vienna
-
1st connect cities to customers
Then look for purchased products for each customer
Relate those to the correct orders
Connect them to the right shipment/delivery
SUM everything up in SELECT*/
SELECT SUM(custom_prod.FK_compProdID * custom_prod.quantity) AS "totalProductsShippedToVienna"
FROM customers
JOIN cities ON cities.cityID = customers.FK_cityID
JOIN custom_prod ON custom_prod.FK_customerID = customers.customerID
JOIN orders ON orders.orderID = custom_prod.FK_orderID
JOIN ships_orders ON ships_orders.FK_orderID = orders.orderID
WHERE cities.name = "Vienna"
;


/* QUERY 5 
Number of Products purchased in the year 2020 */
SELECT SUM(custom_prod.FK_compProdID * custom_prod.quantity) AS "totalProductsShippedToVienna"
FROM customers
JOIN cities ON cities.cityID = customers.FK_cityID
JOIN custom_prod ON custom_prod.FK_customerID = customers.customerID
JOIN orders ON orders.orderID = custom_prod.FK_orderID
WHERE YEAR(orders.date) = "2020"
;



/* QUERY 6 
Shows delivery services full data*/
SELECT delivery_services.name as "companyName", delivery_services.street, cities.name AS "city", cities.ZIP, countries.code AS "countryCode", cities.areaCode, delivery_services.phoneNumber, countries.name AS "country"
FROM cities
JOIN countries ON countries.countryID = cities.FK_countryID JOIN delivery_services ON delivery_services.FK_cityID = cities.cityID
ORDER BY cities.name
;

/* ***BONUS QUERIES*** */
/* QUERY 7
Show full data of every order connected with shipping, delivery + payment option after or at todays date (2021-08-07) */
SELECT orders.date AS "orderDate", payments.type AS "typeofPayment", delivery_services.name, ships_orders.dateShipped, ships_orders.dateArrived
FROM orders
JOIN payments ON payments.paymentID = orders.FK_paymentID
JOIN ships_orders ON ships_orders.FK_orderID = orders.orderID
JOIN delivery_services ON delivery_services.deliveryID = ships_orders.FK_deliveryID
WHERE ships_orders.dateShipped >= CURRENT_DATE
;

/* QUERY 8
How much money did each customer spend in total
(assume that any product owned by a customer in the table is payed already, therefore owned)
 */
SELECT customers.firstname, customers.lastname, SUM(products.price * custom_prod.quantity) AS "totalMoneySpent"
FROM customers
JOIN custom_prod ON custom_prod.FK_customerID = customers.customerID
JOIN comp_prod ON comp_prod.compProdID = custom_prod.FK_compProdID
JOIN products ON products.productID = comp_prod.FK_productID
GROUP BY customers.customerID
ORDER BY customers.firstname
;


/* ***ADDITIONAL EASIER? QUERIES*** */

/* QUERY 9 
Show Products owned by company ordered by company and price */
SELECT companies.name, products.name, products.price, comp_prod.quantity
FROM companies
JOIN comp_prod ON comp_prod.FK_companyID = companies.companyID
JOIN products ON products.productID = comp_prod.FK_productID
ORDER BY companies.name, products.price DESC
;


/* QUERY 10 
Get data about how many customers live in each city */
SELECT cities.name, COUNT(*) AS "numberOfCustomersInCity"
FROM cities
JOIN customers ON customers.FK_cityID = cities.cityID
GROUP BY cities.cityID
ORDER by "numberOfCustomersInCity"
;

/* QUERY 11
no idea why I did that, probably some mod. from Query 2 */
SELECT customers.firstname, customers.lastname, orders.date AS "purchaseDate"
FROM customers
JOIN custom_prod ON custom_prod.FK_customerID = customers.customerID
JOIN orders ON orders.orderID = custom_prod.FK_orderID
WHERE orders.date = "2021-08-08"
GROUP BY customers.firstname
;