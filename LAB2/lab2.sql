select first_name, last_name, state from sales.customers 
where state = 'NY' order by first_name

select city, count(*) from sales.customers 
where state = 'NY' group by city having count(*) >=10 order by city desc

SELECT YEAR(order_date) AS order_year, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY YEAR(order_date)
ORDER BY order_year;
