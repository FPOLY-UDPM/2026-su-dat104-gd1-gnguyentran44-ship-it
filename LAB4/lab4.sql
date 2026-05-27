SELECT category_id,
       MAX(list_price) AS max_price,
       MIN(list_price) AS min_price
FROM production.products
GROUP BY category_id
HAVING MAX(list_price) > 4000
   AND MIN(list_price) < 500;

USE [BikeStores];
GO

SELECT category_id,
       AVG(list_price) AS avg_price
FROM production.products
GROUP BY category_id
HAVING AVG(list_price) BETWEEN 500 AND 1000;

USE [BikeStores];
GO

SELECT 
    order_id, 
    SUM(quantity * list_price * (1 - discount)) AS net_value
FROM 
    sales.order_items
GROUP BY 
    order_id
HAVING 
    SUM(quantity * list_price * (1 - discount)) BETWEEN 19000 AND 25000;