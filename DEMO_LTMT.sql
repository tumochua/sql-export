-- Tạo CSDL --

CREATE DATABASE DEMO_LTMT
GO 
USE DEMO_LTMT
GO

--- Tạo Bảng ---
CREATE TABLE Khoa
(
	maKhoa CHAR(10) PRIMARY KEY,
	tenKhoa NVARCHAR(30),
	dienThoai CHAR(10)
)

CREATE TABLE GiangVien
(
	maGV int PRIMARY KEY,
	hoTenGV NVARCHAR(30),
	gioiTinh NVARCHAR(5),
	namSinh int,
	diaChi NVARCHAR(30),
	maKhoa CHAR(10) FOREIGN KEY REFERENCES Khoa
)

CREATE TABLE SinhVien
(
	maSV int PRIMARY KEY,
	hoTenSV NVARCHAR(40),
	gioiTinh NVARCHAR(5),
	namSinh int,
	queQuan NVARCHAR(30),
	maKhoa CHAR(10) FOREIGN KEY REFERENCES Khoa,
)


CREATE TABLE DeTai
(
	maDT CHAR(10) PRIMARY KEY,
	tenDT NVARCHAR(30),
	noiThucTap NVARCHAR(30)
)

CREATE TABLE HuongDan
(
	maSV int PRIMARY KEY,
	maDT CHAR(10) FOREIGN KEY REFERENCES DeTai,
	maGV int FOREIGN KEY REFERENCES GiangVien,
	ketQua DECIMAL(5,2)
)


--- Thêm Dữ Liệu Vào Bảng ---
INSERT INTO Khoa VALUES
('CNTT',N'Công nghệ thông tin',02438541616),
('XD',N'Xây Dựng',02438542529),
('NT',N'Nội Thất',02438541616)

INSERT INTO GiangVien VALUES
(18,N'Nguyễn Mạnh Hùng', N'Nam',1988, N'Hà Nội', 'CNTT'),
(19,N'Nguyễn Thị Nguyệt', N'Nữ',1992, N'Hà Nội', 'CNTT'),
(20,N'Nguyễn Hải Phong', N'Nam',1987, N'Hà Nội', 'CNTT'),
(21,N'Phạm Thanh Mừng', N'Nữ',1993, N'Hà Nam', 'NT'),
(22,N'Lê Trúc Hà', N'Nữ',1992, N'Hưng Yên', 'NT'),
(23,N'Trần Trọng Tuấn', N'Nam',1987, N'Hải Dương', 'XD'),
(24,N'Trần Thị Vân Anh', N'Nữ',1992, N'Hải Phòng', 'XD')


INSERT INTO SinhVien VALUES
(11, N'Cao Tú Anh', N'Nữ',2001, N'Hà Nội', 'CNTT'),
(12, N'Kiều Tuấn Anh', 'Nam',2000, N'Hải Phòng', 'CNTT'),
(13, N'Lê Mai Anh', N'Nữ',2001, N'Hải Phòng', 'CNTT'),
(14, N'Hoàng Văn Tuấn', 'Nam',2001, N'Nam Định', 'NT'),
(15, N'Hoàng Thu Hồng', N'Nữ',2001, N'Hà Nội', 'NT'),
(16, N'Nguyễn Thị Nhung', N'Nữ',2001, N'Thái Bình', 'XD'),
(17, N'Phạm Thanh Tùng', N'Nam',2001, N'Quảng Ninh', 'XD'),
(18, N'Hoàng Thị Uyên', N'Nữ',2001, N'Hà Giang', 'XD'),
(19, N'Trần Quang Vũ', 'Nam',2001, N'Hưng Yên', 'XD'),
(20, N'Nguyễn Đức Toàn', N'Nữ',2001, N'Thái Bình', 'XD')


INSERT INTO DeTai VALUES
('DT01', N'Đề Tài 01','FPT Software'),
('DT02', N'Đề Tài 02','FPT Software'),
('DT03', N'Đề Tài 03','Answer Group'),
('DT04', N'Đề Tài 04', N'Hòa Bình Group'),
('DT05', N'Đề Tài 05', N'Hòa Bình Group')

INSERT INTO HuongDan VALUES
(11, 'DT01', 19,8),
(12, 'DT02', 18,9),
(13, 'DT02', 20,7),
(14, 'DT03', 22,8),
(15, 'DT03', 21,6),
(17, 'DT05', 23,5),
(20, 'DT05', 24,9)



SELECT * FROM Khoa