SELECT first_name, last_name, state
FROM sales.customers
WHERE state = 'NY'
ORDER BY first_name ASC;

SELECT city, COUNT(*) AS total_customers
FROM sales.customers
WHERE state = 'NY'
GROUP BY city
ORDER BY city DESC;

SELECT YEAR(order_date) AS order_year, COUNT(*) AS total_orders
FROM sales.orders
GROUP BY YEAR(order_date)
ORDER BY order_year;

SELECT * 
FROM sales.customers
WHERE first_name LIKE 'W%' -- Bắt đầu bằng W
   OR first_name LIKE '%a'; -- Hoặc kết thúc bằng a

SELECT * FROM production.products
WHERE model_year = 2017 
  AND list_price > 100; -- Bạn có thể thử thay bằng 500 nếu > 100 ra quá nhiều

