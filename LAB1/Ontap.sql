SELECT 
    c.CategoryName AS TenNhomSanPham,
    p.ProductName AS TenSanPham
FROM 
    Categories c
JOIN 
    Products p ON c.CategoryID = p.CategoryID
ORDER BY 
    c.CategoryName, p.ProductName;

    SELECT c.CategoryName, p.ProductName
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID;

SELECT o.OrderID, o.OrderDate, o.ShipCity, o.ShipCountry,
       c.CustomerID, c.CompanyName, c.ContactName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID

SELECT
    o.OrderID AS [Mã Đơn Hàng],
    o.OrderDate AS [Ngày Đặt Hàng],
    o.RequiredDate AS [Ngày Yêu Cầu],
    o.ShippedDate AS [Ngày Giao Hàng],
    c.CompanyName AS [Tên Công Ty],
    c.City AS [Thành Phố],
    c.Country AS [Quốc Gia],
    o.Freight AS [Phí Vận Chuyển]
FROM dbo.Orders o
INNER JOIN dbo.Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

--LIỆT KÊ NHÂN VIÊN VÀ XỬ LÝ ĐƠN HÀNG
SELECT 
    o.OrderID AS [Mã Đơn Hàng],
    o.OrderDate AS [Ngày Đặt Hàng],
    o.ShippedDate AS [Ngày Giao Hàng],
    e.EmployeeID AS [Mã Nhân Viên],
    e.FirstName + ' ' + e.LastName AS [Tên Nhân Viên],
    e.Title AS [Chức Danh]
FROM dbo.Orders o
INNER JOIN dbo.Employees e ON o.EmployeeID = e.EmployeeID
ORDER BY o.OrderDate DESC;

--Thông tin nhân viên và người quản lý
SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS TenNhanVien,
    e.ReportsTo,
    m.FirstName + ' ' + m.LastName AS TenQuanLy
FROM Employees e
JOIN Employees m ON e.ReportsTo = m.EmployeeID;

-- Liệt kê nhóm sản phẩm và sản phẩm
SELECT c.CategoryName, p.ProductName
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID;
--2. Liệt kê thông tin đơn hàng, kèm theo tthông tin khách hàng
SELECT o.OrderID, o.OrderDate, c.CompanyName, c.City, c.Country
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
--Liệt kê tên nhân viên xử lý thông tin các đơn hàng
SELECT o.OrderID, o.OrderDate, e.FirstName + ' ' + e.LastName AS TenNhanVien
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID;
--Thông tin nhân viên và người quản lý
SELECT e.FirstName + ' ' + e.LastName AS TenNhanVien,
       m.FirstName + ' ' + m.LastName AS TenQuanLy
FROM Employees e
LEFT JOIN Employees m ON e.ReportsTo = m.EmployeeID;
--Thông tin nhân viên, và đi làm năm bao nhiêu tuổi
SELECT e.FirstName + ' ' + e.LastName AS TenNhanVien,
       YEAR(e.HireDate) - YEAR(e.BirthDate) AS TuoiKhiDiLam
FROM Employees e;
