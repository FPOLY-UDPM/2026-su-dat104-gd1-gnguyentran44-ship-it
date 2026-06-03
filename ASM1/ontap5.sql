SELECT
    p.product_id,
    p.product_name
FROM production.products p
WHERE p.product_id NOT IN (
    SELECT od.product_id
    FROM sales.order_items od
)

SELECT
    c.category_id,
    c.category_name,
    AVG(p.list_price) AS GiaTrungBinh
FROM production.products p
JOIN production.categories c ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY GiaTrungBinh DESC

SELECT
    p.product_id,
    p.product_name,
    p.list_price,
    quantity
FROM production.products p
JOIN production.stocks s ON p.product_id = s.product_id
WHERE s.quantity > (
    SELECT AVG(quantity)
    FROM production.stocks
)
ORDER BY s.quantity DESC

SELECT *
FROM production.products SP
WHERE SP.list_price > (
    SELECT AVG(list_price)
    FROM production.products
)

SELECT
    product_id,
    quantity
FROM production.stocks
WHERE quantity > (
    SELECT AVG(quantity)
    FROM production.stocks
)
ORDER BY quantity DESC

SELECT
    c.customer_id,
    c.first_name + ' ' + c.last_name AS HoTen,
    COUNT(o.order_id) AS SoLanMuaHang
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY SoLanMuaHang DESC

SELECT *
FROM sales.customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) >= 3
)

SELECT
    order_id,
    SUM(quantity * list_price * (1 - discount)) AS TongTien
FROM sales.order_items
GROUP BY order_id
HAVING SUM(quantity * list_price * (1 - discount)) > 1000
ORDER BY TongTien DESC

SELECT
    b.brand_id,
    b.brand_name,
    COUNT(p.product_id) AS SoSanPham
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
GROUP BY b.brand_id, b.brand_name
HAVING COUNT(p.product_id) >= 5
ORDER BY SoSanPham DESC