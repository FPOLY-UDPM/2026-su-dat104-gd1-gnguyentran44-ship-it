SELECT [last_name] + ' ' + [first_name] as Ten_KH
     , [store_name] as Ten_CuaHang
FROM [BikeStores].[sales].[staffs]
JOIN [sales].[stores]
ON [sales].[staffs].[store_id] = [sales].[stores].[store_id]

USE [BikeStores];
GO

SELECT 
    -- Thông tin khách hàng
    c.[last_name] + ' ' + c.[first_name] AS Ten_KH,
    c.[email] AS Email,
    c.[phone] AS Dien_Thoai,
    c.[street] + ', ' + c.[city] + ', ' + c.[state] AS Dia_Chi,
    
    -- Thông tin đơn hàng
    o.[order_id] AS Ma_Don_Hang,
    o.[order_date] AS Ngay_Dat_Hang,
    o.[shipped_date] AS Ngay_Giao_Hang
FROM 
    [sales].[orders] o
INNER JOIN 
    [sales].[customers] c ON o.[customer_id] = c.[customer_id];

    USE [BikeStores];
GO

SELECT product_name AS TENSANPHAM,
       quantity AS TONKHO
FROM production.stocks
JOIN production.products
ON production.stocks.product_id = production.products.product_id;

SELECT p.product_name AS TENSANPHAM,
       s.quantity AS TONKHO
FROM production.stocks s
JOIN production.products p ON s.product_id = p.product_id
WHERE s.quantity > 20;

USE [BikeStores];
GO

SELECT 
    nv.[last_name] + ' ' + nv.[first_name] AS Ten_Nhan_Vien,
    COALESCE(sep.[last_name] + ' ' + sep.[first_name], N'Không có (Là Sếp Lớn)') AS Ten_Sep
FROM 
    [sales].[staffs] nv
LEFT JOIN 
    [sales].[staffs] sep ON nv.[manager_id] = sep.[staff_id]
ORDER BY 
    Ten_Sep DESC;

SELECT 
    s.store_name AS [Ten_Cua_Hang],
    COUNT(st.staff_id) AS [So_Luong_Nhan_Vien]
FROM [sales].[stores] s
LEFT JOIN [sales].[staffs] st ON s.store_id = st.store_id
GROUP BY s.store_name
ORDER BY [So_Luong_Nhan_Vien] DESC;

SELECT 
    order_date AS [Ngay_Dat_Hang],
    COUNT(DISTINCT customer_id) AS [So_Luong_Khach_Hang]
FROM [sales].[orders]
GROUP BY order_date
ORDER BY order_date DESC; -- Sắp xếp theo ngày mới nhất trở về trước

SELECT
    order_date AS [Ngay_Dat_Hang],
    product_id AS [Ma_San_Pham],
    SUM(quantity) AS [Tong_So_Luong_Ban_Ra]
FROM [sales].[orders] o, [sales].[order_items] oi
WHERE o.order_id = oi.order_id
GROUP BY order_date, product_id
ORDER BY order_date DESC;

SELECT
    p.product_name AS [Ten_San_Pham],
    AVG(oi.list_price) AS [Gia_Ban_Trung_Binh]
FROM [production].[products] p, [sales].[order_items] oi
WHERE p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY [Gia_Ban_Trung_Binh] DESC;