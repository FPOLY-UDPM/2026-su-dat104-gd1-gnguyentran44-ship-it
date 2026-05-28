USE BikeStores;
GO

-- ====================================================================
-- 1. NẠP DỮ LIỆU CHO SCHEMA: production
-- ====================================================================

-- 1.1 Bảng Danh mục (categories)
INSERT INTO production.categories (category_name) VALUES
('Children Bicycles'),
('Comfort Bicycles'),
('Cruisers Bicycles'),
('Cyclocross Bicycles'),
('Electric Bikes'),
('Mountain Bikes'),
('Road Bikes');

-- 1.2 Bảng Thương hiệu (brands)
INSERT INTO production.brands (brand_name) VALUES
('Electra'),
('Haro'),
('Heller'),
('Pure Cycles'),
('Ritchey'),
('Strider'),
('Sun Bicycles'),
('Surly'),
('Trek');

-- 1.3 Bảng Sản phẩm (products)
INSERT INTO production.products (product_name, brand_id, category_id, model_year, list_price) VALUES
('Trek 820 - 2016', 9, 6, 2016, 379.99),
('Ritchey Timberwolf Frameset - 2016', 5, 6, 2016, 749.99),
('Surly Wednesday Frameset - 2016', 8, 6, 2016, 999.99),
('Electra Townie Original 7D - 2016', 1, 3, 2016, 539.99),
('Electra Cruiser 1 (24-inch) - 2016', 1, 3, 2016, 269.99),
('Haro Flightline 20 - 2017', 2, 1, 2017, 249.99),
('Haro Flightline 24 - 2017', 2, 1, 2017, 269.99),
('Trek Conduit+ - 2016', 9, 5, 2016, 2999.99),
('Pure Cycles Coaster - 2016', 4, 2, 2016, 449.00),
('Sun Bicycles Drifter 7 - 2017', 7, 3, 2017, 470.99);


-- ====================================================================
-- 2. NẠP DỮ LIỆU CHO SCHEMA: sales
-- ====================================================================

-- 2.1 Bảng Khách hàng (customers)
INSERT INTO sales.customers (first_name, last_name, phone, email, street, city, state, zip_code) VALUES
('Debra', 'Burks', NULL, 'debra.burks@yahoo.com', '9273 Thorne Ave.', 'Orchard Park', 'NY', '14127'),
('Kasha', 'Todd', NULL, 'kasha.todd@yahoo.com', '910 Vine St.', 'Campbell', 'CA', '95008'),
('Tameka', 'Fisher', NULL, 'tameka.fisher@gmail.com', '769 West Road', 'Dearborn', 'MI', '48124'),
('Daryl', 'Spence', NULL, 'daryl.spence@aol.com', '988 Pearl St.', 'Uniondale', 'NY', '11553'),
('Charity', 'Long', '(716) 962-3307', 'charity.long@hotmail.com', '1610 Jamaica Ave.', 'Buffalo', 'NY', '14224');

-- 2.2 Bảng Cửa hàng (stores)
INSERT INTO sales.stores (store_name, phone, email, street, city, state, zip_code) VALUES
('Santa Cruz Bikes', '(831) 476-4321', 'santacruz@bikes.shop', '3700 Portola Drive', 'Santa Cruz', 'CA', '95060'),
('Baldwin Bikes', '(516) 379-8888', 'baldwin@bikes.shop', '4200 Old Country Road', 'Baldwin', 'NY', '11510'),
('Rowlett Bikes', '(972) 530-5555', 'rowlett@bikes.shop', '8000 Church Road', 'Rowlett', 'TX', '75088');

-- 2.3 Bảng Nhân viên (staffs)
-- (Lưu ý: Chèn Manager trước rồi mới chèn nhân viên cấp dưới sau)
INSERT INTO sales.staffs (first_name, last_name, email, phone, active, store_id, manager_id) VALUES
('Fabiola', 'Jackson', 'fabiola.jackson@bikes.shop', '(831) 476-4322', 1, 1, NULL), -- Manager gốc
('Mireya', 'Copeland', 'mireya.copeland@bikes.shop', '(831) 476-4323', 1, 1, 1),
('Genna', 'Serrano', 'genna.serrano@bikes.shop', '(516) 379-8889', 1, 2, 1),
('Marcelina', 'Boyer', 'marcelina.boyer@bikes.shop', '(516) 379-8890', 1, 2, 3);

-- 2.4 Bảng Đơn hàng (orders)
INSERT INTO sales.orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) VALUES
(1, 4, '2016-01-01', '2016-01-03', '2016-01-03', 1, 2),
(2, 4, '2016-01-01', '2016-01-04', '2016-01-03', 2, 3),
(3, 4, '2016-01-02', '2016-01-05', '2016-01-03', 2, 3),
(4, 4, '2016-01-03', '2016-01-06', '2016-01-04', 1, 2),
(5, 4, '2016-01-03', '2016-01-06', '2016-01-05', 3, 1);

-- 2.5 Bảng Chi tiết đơn hàng (order_items)
INSERT INTO sales.order_items (order_id, item_id, product_id, quantity, list_price, discount) VALUES
(1, 1, 1, 1, 379.99, 0.05),
(1, 2, 4, 2, 539.99, 0.00),
(2, 1, 6, 1, 249.99, 0.10),
(3, 1, 3, 1, 999.99, 0.07),
(4, 1, 2, 1, 749.99, 0.05),
(5, 1, 7, 2, 269.99, 0.00);


-- ====================================================================
-- 3. NẠP DỮ LIỆU CHO BẢNG TỒN KHO (TỔNG HỢP GIỮA PRODUCTION & SALES)
-- ====================================================================

-- 3.1 Bảng Tồn kho (stocks)
INSERT INTO production.stocks (store_id, product_id, quantity) VALUES
(1, 1, 27),
(1, 2, 5),
(1, 3, 6),
(2, 1, 10),
(2, 4, 12),
(3, 6, 15),
(3, 7, 23);
GO


