SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE first_name LIKE 'W%'
   OR first_name LIKE '%a';

SELECT product_id, product_name, model_year, list_price
FROM production.products
WHERE model_year = 2018
  AND list_price > 1000;

SELECT TOP 1 YEAR(order_date) AS Year,
             MONTH(order_date) AS Month,
             COUNT(*) AS OrderCount
FROM sales.orders
WHERE order_date BETWEEN '2016-02-01' AND '2017-02-28'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY OrderCount DESC;

