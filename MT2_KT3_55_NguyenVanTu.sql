create database MT2_KT3_55_NguyenVanTu;
go
use MT2_KT3_55_NguyenVanTu;
go

create table PhongBan (
	MaPhong nchar(10) not null primary key,
	TenPhong nvarchar(50)
)

create table Luong (
	MaLuong nchar(10) not null primary key,
	BacLuong int,
	MucLuong int,
	MoTa nvarchar(50)
)
create table NhanVien (
	MaNV nchar(10) not null primary key,
	MaPhong nchar(10) not null,
	MaLuong nchar(10) not null,
	TenNV nvarchar(50),
	DiaChi nvarchar(50),
	NgaySinh date,
	NgayLam date,
	FOREIGN KEY (MaPhong) REFERENCES PhongBan(MaPhong),
	FOREIGN KEY (MaLuong) REFERENCES Luong(MaLuong)
)

insert into PhongBan values 
('KD',N'Kinh Doanh'),
('MKT',N'Marketing'),
('IT',N'Lập Trình')

insert into Luong values 
('L01',2,5000000,N'Lương Bậc 2'),
('L02',3,8000000,N'Lương Bậc 3'),
('L03',4,1000000,N'Lương Bậc 4')


insert into NhanVien values
('NV01','KD','L01',N'Nguyễn Văn A',N'Hải Phòng','2000-01-24','2022-10-10'),
('NV02','KD','L02',N'Trần Thị B','Hưng Yên','1992-09-21','2000-08-08'),
('NV03','MKT','L02',N'Quách Thị C',N'Hà Nội','1998-08-03','1999-04-01'),
('NV04','IT','L03',N'Đinh Thị E',N'Nam Định','1990-06-07','1997-02-09');


--3.1 Hiển thị thông tin Nhân viên họ "Trần"
SELECT *
FROM NhanVien
WHERE TenNV LIKE N'Trần%';

--3.2 Hiển thị thông tin Nhân viên có lương thấp nhất
SELECT * FROM NhanVien 
INNER JOIN Luong  ON NhanVien.MaLuong = Luong.MaLuong
WHERE MucLuong = (
    SELECT MIN(MucLuong)
    FROM Luong
)

--3.2 Hiển thị thông tin Nhân viieen vào làm năm 2000
SELECT *
FROM NhanVien
WHERE YEAR(NgayLam) = 2000;


--4.1 Viết PROCEDURE liệt kê thông tin Nhân Viên theo biến truyền vào là Tên Phòng Ban
CREATE PROCEDURE LietKeNhanVienTheoTenPhongBan
    @TenPhong NVARCHAR(50)
AS
BEGIN
    SELECT NhanVien.*
    FROM NhanVien
    INNER JOIN PhongBan ON NhanVien.MaPhong = PhongBan.MaPhong
    WHERE PhongBan.TenPhong = @TenPhong;
END;

--4.2 Viết PROCEDURE tìm kiếm thông tin Nhân Viên theo biến truyền vào là Mã Phòng

CREATE PROCEDURE TimKiemNhanMaPhong
    @MaPhong nchar(10)
AS
BEGIN
    SELECT *
    FROM PhongBan
    WHERE MaPhong LIKE N'%' + @MaPhong + '%';
END;



EXEC LietKeNhanVienTheoTenPhongBan N'Marketing';

EXEC TimKiemNhanMaPhong N'IT';
