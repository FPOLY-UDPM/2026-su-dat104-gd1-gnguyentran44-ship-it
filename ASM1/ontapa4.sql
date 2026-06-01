  SELECT
    s.store_id,
    s.store_name,
    p.product_id,
    p.product_name,
    st.quantity AS StockQuantity
FROM sales.stores s
JOIN production.stocks st ON s.store_id = st.store_id
JOIN production.products p ON st.product_id = p.product_id
ORDER BY s.store_name, p.product_name;

SELECT 
    s.store_id,
    s.store_name,
    o.order_id,
    o.order_date,
    c.customer_id,
    c.first_name + ' ' + c.last_name AS CustomerName,
    p.product_id,
    p.product_name,
    oi.quantity,
    oi.list_price,
    (oi.quantity * oi.list_price) AS TotalAmount
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
ORDER BY s.store_name, o.order_date, p.product_name;
