USE [master]
GO
/****** Object:  Database [Intern]    Script Date: 4/15/2023 8:39:47 AM ******/
CREATE DATABASE [Intern]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Intern', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Intern.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Intern_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Intern_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Intern] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Intern].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Intern] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Intern] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Intern] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Intern] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Intern] SET ARITHABORT OFF 
GO
ALTER DATABASE [Intern] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Intern] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Intern] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Intern] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Intern] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Intern] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Intern] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Intern] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Intern] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Intern] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Intern] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Intern] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Intern] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Intern] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Intern] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Intern] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Intern] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Intern] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Intern] SET  MULTI_USER 
GO
ALTER DATABASE [Intern] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Intern] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Intern] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Intern] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Intern] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Intern] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Intern] SET QUERY_STORE = ON
GO
ALTER DATABASE [Intern] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Intern]
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 4/15/2023 8:39:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTai](
	[maDT] [char](10) NOT NULL,
	[tenDT] [nvarchar](30) NULL,
	[noiThucTap] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 4/15/2023 8:39:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[maGV] [int] NOT NULL,
	[hoTenGV] [nvarchar](30) NULL,
	[gioiTinh] [nvarchar](5) NULL,
	[namSinh] [int] NULL,
	[diaChi] [nvarchar](30) NULL,
	[maKhoa] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HuongDan]    Script Date: 4/15/2023 8:39:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HuongDan](
	[maSV] [int] NOT NULL,
	[maDT] [char](10) NULL,
	[maGV] [int] NULL,
	[ketQua] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 4/15/2023 8:39:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[maKhoa] [char](10) NOT NULL,
	[tenKhoa] [nvarchar](30) NULL,
	[dienThoai] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 4/15/2023 8:39:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[maSV] [int] NOT NULL,
	[hoTenSV] [nvarchar](40) NULL,
	[gioiTinh] [nvarchar](5) NULL,
	[namSinh] [int] NULL,
	[queQuan] [nvarchar](30) NULL,
	[maKhoa] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DeTai] ([maDT], [tenDT], [noiThucTap]) VALUES (N'DT01      ', N'Đề Tài 01', N'FPT Software')
INSERT [dbo].[DeTai] ([maDT], [tenDT], [noiThucTap]) VALUES (N'DT02      ', N'Đề Tài 02', N'FPT Software')
INSERT [dbo].[DeTai] ([maDT], [tenDT], [noiThucTap]) VALUES (N'DT03      ', N'Đề Tài 03', N'Answer Group')
INSERT [dbo].[DeTai] ([maDT], [tenDT], [noiThucTap]) VALUES (N'DT04      ', N'Đề Tài 04', N'Hòa Bình Group')
INSERT [dbo].[DeTai] ([maDT], [tenDT], [noiThucTap]) VALUES (N'DT05      ', N'Đề Tài 05', N'Hòa Bình Group')
GO
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (18, N'Nguyễn Mạnh Hùng', N'Nam', 1988, N'Hà Nội', N'CNTT      ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (19, N'Nguyễn Thị Nguyệt', N'Nữ', 1992, N'Hà Nội', N'CNTT      ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (20, N'Nguyễn Hải Phong', N'Nam', 1987, N'Hà Nội', N'CNTT      ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (21, N'Phạm Thanh Mừng', N'Nữ', 1993, N'Hà Nam', N'NT        ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (22, N'Lê Trúc Hà', N'Nữ', 1992, N'Hưng Yên', N'NT        ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (23, N'Trần Trọng Tuấn', N'Nam', 1987, N'Hải Dương', N'XD        ')
INSERT [dbo].[GiangVien] ([maGV], [hoTenGV], [gioiTinh], [namSinh], [diaChi], [maKhoa]) VALUES (24, N'Trần Thị Vân Anh', N'Nữ', 1992, N'Hải Phòng', N'XD        ')
GO
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (11, N'DT01      ', 19, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (12, N'DT02      ', 18, CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (13, N'DT02      ', 20, CAST(7.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (14, N'DT03      ', 22, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (15, N'DT03      ', 21, CAST(6.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (17, N'DT05      ', 23, CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[HuongDan] ([maSV], [maDT], [maGV], [ketQua]) VALUES (20, N'DT05      ', 24, CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa], [dienThoai]) VALUES (N'CNTT      ', N'Công nghệ thông tin', N'2438541616')
INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa], [dienThoai]) VALUES (N'NT        ', N'Nội Thất', N'2438541616')
INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa], [dienThoai]) VALUES (N'XD        ', N'Xây Dựng', N'2438542529')
GO
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (11, N'Cao Tú Anh', N'Nữ', 2001, N'Hà Nội', N'CNTT      ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (12, N'Kiều Tuấn Anh', N'Nam', 2000, N'Hải Phòng', N'CNTT      ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (13, N'Lê Mai Anh', N'Nữ', 2001, N'Hải Phòng', N'CNTT      ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (14, N'Hoàng Văn Tuấn', N'Nam', 2001, N'Nam Định', N'NT        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (15, N'Hoàng Thu Hồng', N'Nữ', 2001, N'Hà Nội', N'NT        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (16, N'Nguyễn Thị Nhung', N'Nữ', 2001, N'Thái Bình', N'XD        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (17, N'Phạm Thanh Tùng', N'Nam', 2001, N'Quảng Ninh', N'XD        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (18, N'Hoàng Thị Uyên', N'Nữ', 2001, N'Hà Giang', N'XD        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (19, N'Trần Quang Vũ', N'Nam', 2001, N'Hưng Yên', N'XD        ')
INSERT [dbo].[SinhVien] ([maSV], [hoTenSV], [gioiTinh], [namSinh], [queQuan], [maKhoa]) VALUES (20, N'Nguyễn Đức Toàn', N'Nữ', 2001, N'Thái Bình', N'XD        ')
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[HuongDan]  WITH CHECK ADD FOREIGN KEY([maDT])
REFERENCES [dbo].[DeTai] ([maDT])
GO
ALTER TABLE [dbo].[HuongDan]  WITH CHECK ADD FOREIGN KEY([maGV])
REFERENCES [dbo].[GiangVien] ([maGV])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
USE [master]
GO
ALTER DATABASE [Intern] SET  READ_WRITE 
GO
