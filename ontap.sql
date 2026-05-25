USE Lab3;
GO

SELECT 
    MaDon AS OrderID,
    COUNT(DISTINCT MaSanPham) AS SoLoaiSanPham,
    SUM(SoLuong) AS TongSanLuong
FROM dbo.ChiTietDonHang
GROUP BY MaDon
HAVING COUNT(DISTINCT MaSanPham) >= 3;



