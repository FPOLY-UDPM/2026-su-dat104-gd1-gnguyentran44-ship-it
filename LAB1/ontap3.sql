SELECT 
    oi.order_id AS [Mã Đơn Hàng],
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS [Tổng Tiền]
FROM sales.order_items oi
GROUP BY oi.order_id
ORDER BY [Tổng Tiền] DESC;

SELECT
    c.customer_id AS [Mã Khách Hàng],
    c.first_name + ' ' + c.last_name AS [Tên Khách Hàng],
    COUNT(DISTINCT o.order_id) AS [Số Đơn Đã Mua]
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY [Số Đơn Đã Mua] DESC;

SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS SoLuongBan
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY SoLuongBan DESC;

SELECT
    P.product_name,
    P.model_year,
    P.list_price,
    B.brand_name,
    C.category_name
FROM production.products AS P
JOIN production.categories AS C
    ON P.category_id = C.category_id
JOIN production.brands AS B
    ON P.brand_id = B.brand_id;
-- Liệt kê danh sách thông tin sản phẩm, bao gồm tồn kho của từng cửa hàng
SELECT
    s.store_id,
    s.store_name,
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS TonKho
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY s.store_id, s.store_name, p.product_id, p.product_name
ORDER BY s.store_name, p.product_name;

--Liệt kê danh sách thông tin sản phẩm, bao gồm tồn kho, thương hiệu của từng cửa hàng
SELECT 
    s.store_id,
    s.store_name,
    p.product_id,
    p.product_name,
    b.brand_name,
    SUM(oi.quantity) AS TonKho
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.brands b ON p.brand_id = b.brand_id
GROUP BY s.store_id, s.store_name, p.product_id, p.product_name, b.brand_name
ORDER BY s.store_name, p.product_name;
--Tìm cửa hàng có tồn kho dưới 10 sản phẩm cho từng mặt hàng
SELECT
    p.product_name AS [Tên Sản Phẩm],
    st.store_name AS [Tên Cửa Hàng],
    s.quantity AS [Tồn Kho]
FROM production.products p
JOIN production.stocks s ON p.product_id = s.product_id
JOIN sales.stores st ON s.store_id = st.store_id
WHERE s.quantity < 10
ORDER BY s.quantity ASC, p.product_name;

SELECT 
    ch.store_name AS TenCH,
    st.quantity AS SoLuong
FROM production.stocks st, sales.stores ch
WHERE st.store_id = ch.store_id
  AND st.quantity < 10;