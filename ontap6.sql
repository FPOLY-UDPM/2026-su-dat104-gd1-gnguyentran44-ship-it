-- nhân viên ko có xử lý đơn hàng
SELECT e.EmployeeID, e.LastName, e.FirstName, e.Title
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID IS NULL;
--sản phẩm ko có trong đơn hàng
SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock
FROM Products p
LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;
-- Tìm những sản phẩm có bán nhưng ko có trong danh mục 
-- lay nhung san pham ban lui
SELECT o.ProductID
FROM [Order Details] AS o
WHERE o.ProductID NOT IN (
    SELECT ProductID 
    FROM Products
    WHERE ProductID IS NOT NULL
);