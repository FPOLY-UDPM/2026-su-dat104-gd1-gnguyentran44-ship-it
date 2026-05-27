USE [BikeStores];
GO

-- =========================================================
-- 1. XÓA CÁC BẢNG ĐƠN HÀNG CŨ ĐỂ KHỞI TẠO LẠI CẤU TRÚC CHUẨN
-- =========================================================
IF OBJECT_ID(N'[sales].[order_items]', N'U') IS NOT NULL DROP TABLE [sales].[order_items];
IF OBJECT_ID(N'[sales].[orders]', N'U') IS NOT NULL DROP TABLE [sales].[orders];
GO

-- =========================================================
-- 2. TẠO LẠI BẢNG ĐƠN HÀNG VỚI ĐẦY ĐỦ CÁC CỘT DỮ LIỆU
-- =========================================================
CREATE TABLE [sales].[orders] (
    [order_id] INT IDENTITY (1, 1) PRIMARY KEY,
    [customer_id] INT NULL,
    [order_status] TINYINT NOT NULL,
    [order_date] DATE NOT NULL,
    [required_date] DATE NOT NULL,
    [shipped_date] DATE NULL,
    [store_id] INT NOT NULL,
    [staff_id] INT NOT NULL,
    FOREIGN KEY ([store_id]) REFERENCES [sales].[stores] ([store_id]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([staff_id]) REFERENCES [sales].[staffs] ([staff_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE [sales].[order_items] (
    [order_id] INT NOT NULL,
    [item_id] INT NOT NULL,
    [product_id] INT NOT NULL,
    [quantity] INT NOT NULL,
    [list_price] DECIMAL (10, 2) NOT NULL,
    [discount] DECIMAL (4, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY ([order_id], [item_id]),
    FOREIGN KEY ([order_id]) REFERENCES [sales].[orders] ([order_id]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([product_id]) REFERENCES [production].[products] ([product_id]) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- =========================================================
-- 3. NẠP DỮ LIỆU MẪU ĐẦY ĐỦ CHO BÀI LAB 4
-- =========================================================

-- Chèn dữ liệu vào bảng Đơn hàng (sales.orders)
SET IDENTITY_INSERT [sales].[orders] ON;
INSERT INTO [sales].[orders] ([order_id], [order_status], [order_date], [required_date], [store_id], [staff_id])
VALUES 
(1, 4, '2026-01-01', '2026-01-03', 1, 1),
(2, 4, '2026-01-02', '2026-01-05', 1, 1),
(3, 4, '2026-01-03', '2026-01-06', 2, 5),
(4, 4, '2026-01-04', '2026-01-07', 2, 5),
(5, 4, '2026-01-05', '2026-01-08', 3, 8);
SET IDENTITY_INSERT [sales].[orders] OFF;
GO

-- Chèn dữ liệu vào bảng Chi tiết đơn hàng (sales.order_items)
INSERT INTO [sales].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount])
VALUES
-- Đơn hàng 1: Giá trị nhỏ (420 * 2 = 840)
(1, 1, 1, 2, 420.00, 0.00),

-- Đơn hàng 2: Giá trị cực lớn (6999 * 5 * 0.9 = 31495)
(2, 1, 5, 5, 6999.00, 0.10),

-- Đơn hàng 3: THỎA MÃN BÀI 3 (Tính toán ròng: 5499 * 4 * 0.95 = 20896.20 -> Nằm trong khoảng 19000 - 25000)
(3, 1, 3, 4, 5499.00, 0.05),

-- Đơn hàng 4: THỎA MÃN BÀI 3 (Tính toán ròng: (5499 * 3) + (6999 * 1 * 0.8) = 16497 + 5599.20 = 22096.20)
(4, 1, 3, 3, 5499.00, 0.00),
(4, 2, 5, 1, 6999.00, 0.20),

-- Đơn hàng 5: Giá trị trung bình thấp (1200 * 3 = 3600)
(5, 1, 2, 3, 1200.00, 0.00);
GO









