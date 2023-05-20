create database MT1_KT2_55_NGUYEN_VAN_TU

go

use MT1_KT2_55_NGUYEN_VAN_TU
go

create table DuAn (
MaDA nchar(10) PRIMARY KEY,
TenDA nvarchar(50),
DiaChi nvarchar(50),
)
create table NhanVien(
MaNV nchar(10) PRIMARY KEY,
TenNV nvarchar(50),
NgaySinh date,
DiaChi nvarchar(50)
)


create table LamViec(
MaNV nchar(10),
MaDA nchar(10),
GioLam int,
 FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
 FOREIGN KEY (MaDA) REFERENCES DuAn(MaDA),
)

INSERT INTO NhanVien
VALUES 
('NV01',N'Ngyễn Văn A','1997-01-01',N'Cầu Giấy,Hà Nội'),
('NV02',N'Trần Thị B','1998-02-02',N'Thủy Nguyên,Hải Phòng'),
('NV03',N'Lê Văn C','1997-03-03',N'Hạ Long,Quảng Ninh'),
('NV04',N'Phùng Văn D','1999-04-04',N'Đống Đa,Hà Nội'),
('NV05',N'Quách Thị E','1997-05-05',N'Tiên Lữ,Hưng Yên')
INSERT INTO DuAn
VALUES
('DA01',N'Dự Án 01', N'Hà Nội'),
('DA02',N'Dự Án 02', N'Hải Phòng'),
('DA03',N'Dự Án 03', N'Quảng Ninh')

INSERT INTO LamViec
VALUES 
('NV01','DA01',50),
('NV01','DA02',40),
('NV01','DA03',60),
('NV02','DA01',30),
('NV02','DA02',15),
('NV03','DA01',60),
('NV05','DA02',80)


-- câu 1:
SELECT NhanVien.TenNV, DuAn.TenDA, LamViec.GioLam
FROM NhanVien
INNER JOIN LamViec ON NhanVien.MaNV = LamViec.MaNV
INNER JOIN DuAn ON LamViec.MaDA = DuAn.MaDA
ORDER BY DuAn.TenDA ASC

--câu 2:
SELECT DuAn.MaDA, DuAn.TenDA, DuAn.DiaChi
FROM NhanVien
INNER JOIN LamViec ON NhanVien.MaNV = LamViec.MaNV
INNER JOIN DuAn ON LamViec.MaDA = DuAn.MaDA
WHERE NhanVien.TenNV = N'Ngyễn Văn E'

-- câu 3:
-- ý a
SELECT * FROM NhanVien WHERE DiaChi LIKE '%Hà Nội%';

-- y b :
SELECT NhanVien.MaNV, TenNV, NgaySinh, DiaChi, GioLam 
FROM NhanVien 
JOIN LamViec ON NhanVien.MaNV = LamViec.MaNV 
WHERE LamViec.MaDA = 'DA01';



   INSERT INTO Luong
VALUES 
(N'LO1','2','5000000',N'Lương Bậc 2'),
(N'LO2','3','8000000',N'Lương Bậc 3')

INSERT INTO PhongBan
VALUES 
(N'KD',N'Kinh Doanh'),
(N'NKT',N'Marketing')

 INSERT INTO NhanVien
VALUES 
('NV01',N'KD',N'LO1',N'Nguyễn Văn A',N'Hải Phòng','2000-01-24','2022-10-10'),
('NV02',N'KD',N'LO2',N'Trần Thị B',N'Hưng Yên','1992-09-21','2000-08-08'),
('NV03',N'NKT',N'LO3',N'Quách Thị C',N'Hà Nội','1998-08-03','1999-04-01')

select * from Luong
select * from NhanVien
select * from PhongBan