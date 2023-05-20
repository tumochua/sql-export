create database tes_demo

go

use tes_demo

go 



create table PhongBan(
MaPhong nchar(10) PRIMARY KEY,
TenPhong nvarchar(50),
)

create table Luong(
MaLuong char(10) PRIMARY KEY,
BacLuong nvarchar(50),
MucLuong nvarchar(50),
MoTa nvarchar(50),
);

create table NhanVien (
MaNV nchar(10) PRIMARY KEY,
MaPhong nchar(10),
MaLuong char(10),
TenNV nvarchar(50),
DiaChi nvarchar(50),
NgaySinh date,
NgayLam date,
FOREIGN KEY (MaPhong) REFERENCES PhongBan(MaPhong),
FOREIGN KEY (MaLuong) REFERENCES Luong(MaLuong)
 );

 INSERT INTO PhongBan
VALUES 
(N'KD',N'Kinh Doanh'),
(N'NKT',N'Marketing')

 INSERT INTO Luong
VALUES 
('LO1','2','5000000',N'Lương Bậc 2'),
('LO2','3','8000000',N'Lương Bậc 3')



 INSERT INTO NhanVien
VALUES 
('NV01',N'KD','LO1',N'Nguyễn Văn A',N'Hải Phòng','2000-01-24','2022-10-10'),
('NV02',N'KD','LO1',N'Trần Thị B',N'Hưng Yên','1992-09-21','2000-08-08'),
('NV03',N'NKT','LO1',N'Quách Thị C',N'Hà Nội','1998-08-03','1999-04-01')


SELECT *
FROM NhanVien
WHERE MaPhong = 'KD';

SELECT *
FROM NhanVien
WHERE TenNV LIKE N'Nguyễn%';

SELECT *
FROM NhanVien
WHERE YEAR(NgayLam) = 2000;



CREATE PROCEDURE TimKiemNhanVienTheoDiaChi
    @DiaChi NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM NhanVien
    WHERE DiaChi LIKE N'%' + @DiaChi + '%';
END;

CREATE PROCEDURE LietKeNhanVienTheoTenPhongBan
    @TenPhong NVARCHAR(50)
AS
BEGIN
    SELECT NhanVien.*
    FROM NhanVien
    INNER JOIN PhongBan ON NhanVien.MaPhong = PhongBan.MaPhong
    WHERE PhongBan.TenPhong = @TenPhong;
END;
