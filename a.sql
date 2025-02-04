

USE [master]
GO
/****** Object:  Database QLSANBONG    Script Date: 7/8/2024 11:23:58 PM ******/
CREATE DATABASE QLSANBONG
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSANBONG', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLSANBONG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSANBONG_log', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLSANBONG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE QLSANBONG SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC QLSANBONG.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE QLSANBONG SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE QLSANBONG SET ANSI_NULLS OFF 
GO
ALTER DATABASE QLSANBONG SET ANSI_PADDING OFF 
GO
ALTER DATABASE QLSANBONG SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE QLSANBONG SET ARITHABORT OFF 
GO
ALTER DATABASE QLSANBONG SET AUTO_CLOSE OFF 
GO
ALTER DATABASE QLSANBONG SET AUTO_SHRINK OFF 
GO
ALTER DATABASE QLSANBONG SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE QLSANBONG SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE QLSANBONG SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE QLSANBONG SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE QLSANBONG SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE QLSANBONG SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE QLSANBONG SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE QLSANBONG SET ENABLE_BROKER 
GO
ALTER DATABASE QLSANBONG SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE QLSANBONG SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE QLSANBONG SET TRUSTWORTHY OFF 
GO
ALTER DATABASE QLSANBONG SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE QLSANBONG SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE QLSANBONG SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE QLSANBONG SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE QLSANBONG SET RECOVERY FULL 
GO
ALTER DATABASE QLSANBONG SET MULTI_USER 
GO
ALTER DATABASE QLSANBONG SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE QLSANBONG SET DB_CHAINING OFF 
GO
ALTER DATABASE QLSANBONG SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE QLSANBONG SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE QLSANBONG SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE QLSANBONG SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSANBONG', N'ON'
GO
ALTER DATABASE QLSANBONG SET QUERY_STORE = ON
GO
ALTER DATABASE QLSANBONG SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE QLSANBONG
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateSoHD]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GenerateSoHD]()
RETURNS [char](5) WITH INLINE = ON, EXECUTE AS CALLER
AS 
BEGIN
    DECLARE @NextID INT;

    -- Tìm giá trị tự tăng tiếp theo
    SELECT @NextID = COALESCE(MAX(CAST(RIGHT(SoHD, 3) AS INT)), 0) + 1
    FROM HoaDon;

    -- Chuyển đổi giá trị tự tăng thành định dạng "HD01", "HD02", ...
    DECLARE @GeneratedID CHAR(5) = 'HD' + RIGHT('00' + CAST(@NextID AS VARCHAR(2)), 2);

    RETURN @GeneratedID;
END;
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [char](5) NOT NULL,
	[TenCV] [nvarchar](20) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[SoHD] [char](5) NOT NULL,
	[MaNV] [char](5) NOT NULL,
	[MaKH] [char](5) NOT NULL,
	[Masan] [char](5) NOT NULL,
	[NgayLapHD] [date] NULL,
	[ThanhTien] [decimal](18, 0) NOT NULL,
	[SLVe] [int] NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [char](5) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Sdt] [char](11) NOT NULL,
	[Email] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](3) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAISAN]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISAN](
	[MaLoaisan] [char](5) NOT NULL,
	[TenLoaisan] [nvarchar](40) NULL,
 CONSTRAINT [PK_LOAIsan] PRIMARY KEY CLUSTERED 
(
	[MaLoaisan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](5) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Sdt] [nvarchar](11) NULL,
	[MaCV] [char](5) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHUONGTIEN]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [varchar](30) NOT NULL,
	[MatKhau] [varchar](10) NULL,
	[MaNV] [char](5) NOT NULL,
 CONSTRAINT [PK_TK] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THONGTINSAN]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINSAN](
	[MaSan] [char](5) NOT NULL,
	[TenSan] [nvarchar](40) NULL,
	[MoTaSan] [nvarchar](255) NULL,
	[AnhSan] [nvarchar](40) NULL,
	[GiaSan] [decimal](18, 2) NULL,
	[TGBatDau] [datetime] NULL,
	[TGKetThuc] [datetime] NULL,
	[MaLoaiSan] [char](5) NULL,
	[MaPhuongTien] [char](5) NULL,
	[MaXP] [char](5) NULL,
	[SLVeConLai] [int] NOT NULL,
 CONSTRAINT [PK_THONGTINSAN] PRIMARY KEY CLUSTERED 
(
	[MaSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XUATPHATSAN]    Script Date: 7/8/2024 11:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'NV   ', N'Nhân Viên')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'QL   ', N'Quản Lý')
GO
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD001', N'NV002', N'KH001', N'TO001', CAST(N'2023-11-10' AS Date), CAST(2000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD002', N'NV003', N'KH005', N'TO003', CAST(N'2023-11-09' AS Date), CAST(7000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD003', N'NV004', N'KH002', N'TO002', CAST(N'2023-11-11' AS Date), CAST(1800000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD004', N'NV005', N'KH003', N'TO001', CAST(N'2023-11-10' AS Date), CAST(4000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD005', N'NV002', N'KH004', N'TO005', CAST(N'2023-11-05' AS Date), CAST(11000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD006', N'NV003', N'KH005', N'TO004', CAST(N'2023-11-06' AS Date), CAST(18000000 AS Decimal(18, 0)), 3)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD007', N'NV004', N'KH006', N'TO002', CAST(N'2023-11-01' AS Date), CAST(3600000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD008', N'NV005', N'KH009', N'TO007', CAST(N'2023-12-02' AS Date), CAST(26000000 AS Decimal(18, 0)), 4)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD009', N'NV003', N'KH008', N'TO008', CAST(N'2023-12-07' AS Date), CAST(40000000 AS Decimal(18, 0)), 5)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD010', N'NV001', N'KH010', N'TO006', CAST(N'2023-12-08' AS Date), CAST(4400000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD011', N'NV002', N'KH001', N'TO003', CAST(N'2023-11-10' AS Date), CAST(2000000 AS Decimal(18, 0)), 3)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD012', N'NV002', N'KH001', N'TO004', CAST(N'2023-11-10' AS Date), CAST(2000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD013', N'NV001', N'KH005', N'TO013', CAST(N'2023-12-01' AS Date), CAST(5500000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD014', N'NV002', N'KH002', N'TO014', CAST(N'2023-05-22' AS Date), CAST(7500000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD015', N'NV003', N'KH001', N'TO015', CAST(N'2023-11-18' AS Date), CAST(5000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD016', N'NV001', N'KH006', N'TO016', CAST(N'2023-06-10' AS Date), CAST(6800000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD017', N'NV002', N'KH008', N'TO017', CAST(N'2023-08-05' AS Date), CAST(8500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD018', N'NV003', N'KH007', N'TO018', CAST(N'2023-02-21' AS Date), CAST(7000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD019', N'NV001', N'KH009', N'TO019', CAST(N'2023-11-30' AS Date), CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD020', N'NV002', N'KH010', N'TO020', CAST(N'2023-04-10' AS Date), CAST(3500000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD022', N'NV001', N'KH002', N'TO002', CAST(N'2023-04-15' AS Date), CAST(3600000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD023', N'NV003', N'KH003', N'TO003', CAST(N'2023-08-20' AS Date), CAST(14000000 AS Decimal(18, 0)), 4)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD024', N'NV002', N'KH004', N'TO004', CAST(N'2023-05-02' AS Date), CAST(6000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD025', N'NV001', N'KH005', N'TO005', CAST(N'2023-09-10' AS Date), CAST(11000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD26 ', N'NV001', N'KH011', N'TO004', CAST(N'2024-07-07' AS Date), CAST(18000000 AS Decimal(18, 0)), 3)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD27 ', N'NV001', N'KH011', N'TO003', CAST(N'2024-07-07' AS Date), CAST(45500000 AS Decimal(18, 0)), 13)
INSERT [dbo].[HOADON] ([SoHD], [MaNV], [MaKH], [Masan], [NgayLapHD], [ThanhTien], [SLVe]) VALUES (N'HD28 ', N'NV001', N'KH011', N'TO002', CAST(N'2024-07-08' AS Date), CAST(9000000 AS Decimal(18, 0)), 5)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH001', N'Nguyen Van Toan', N'0528151123 ', N'vana@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH002', N'Tran Thi Be', N'1234567899 ', N'thib@email.com', N'Nữ')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH003', N'Le Nhan', N'9876543211 ', N'vanc@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH004', N'Le Thi Minh', N'0912345678 ', N'minhle@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH005', N'Pham Van Hau', N'0987654321 ', N'hau.pham@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH006', N'Nguyen Anh Tuan', N'0365897412 ', N'tuanna@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH007', N'Tran Thi Nga', N'0777777777 ', N'ngatran@email.com', N'Nữ')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH008', N'Hoang Van Cuong', N'0123456789 ', N'cuonghoang@email.com', N'Nam')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH009', N'Doan Ngoc Thao', N'0933333333 ', N'thaongoc@email.com', N'Nữ')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH010', N'Vu Thi Hien', N'0888888888 ', N'hienvu@email.com', N'Nữ')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Sdt], [Email], [GioiTinh]) VALUES (N'KH011', N'DuyBinh', N'0933900544 ', N'sos@gmail.com', N'Nam')
GO
INSERT [dbo].[LOAISAN] ([MaLoaisan], [TenLoaisan]) VALUES (N'TNN  ', N'TP.HCM')
INSERT [dbo].[LOAISAN] ([MaLoaisan], [TenLoaisan]) VALUES (N'TTN  ', N'TP.HN')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV001', N'Hoàng Bảo Trúc', N'Nữ', CAST(N'1995-12-10' AS Date), N'trucdeptrai001@gmail.com', N'A Lưới, Thừa Thiên Huế', N'0971542382', N'QL   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV002', N'Hoàng Văn Hiệp', N'Nam', CAST(N'2001-02-01' AS Date), N'tinhlan00@gmail.com', N'Cầu Giấy, Hà Nội', N'0831241393', N'NV   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV003', N'Hoàng Hạnh Nhân', N'Nam', CAST(N'2003-06-25' AS Date), N'long123@gmail.com', N'Tân Bình, TP.HCM', N'0951636578', N'NV   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV004', N'Đỗ Công Tôn Sách', N'Nam', CAST(N'2001-08-11' AS Date), N'lamngoc123@gmail.com', N'Bàu Bàng, Bình Dương', N'0916724983', N'NV   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV005', N'Toàn Đinh', N'Nam', CAST(N'2000-04-21' AS Date), N'dinhtoan111@gmail.com', N'Bình Thủy,Cần Thơ', N'0389911722', N'NV   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [GioiTinh], [NgaySinh], [Email], [DiaChi], [Sdt], [MaCV]) VALUES (N'NV006', N'DuyBinh', N'Nữ', CAST(N'2024-07-07' AS Date), N'bossvip14@gmail.com', N'a', N'0933900544', N'NV   ')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV]) VALUES (N'baotruc', N'truc123', N'NV001')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV]) VALUES (N'DuyBinh', N'123', N'NV005')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV]) VALUES (N'hoangnhan', N'nhan123', N'NV003')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV]) VALUES (N'SangKhongLo', N'1234', N'NV001')
GO
INSERT [dbo].[THONGTINSAN] ([MaSan], [TenSan], [MoTaSan], [AnhSan], [GiaSan], [TGBatDau], [TGKetThuc], [MaLoaiSan]) VALUES (N'TO001', N'Sân vận động Cần Thơ', N'ân vận động Cần Thơ là một sân vận động bóng đá tại Quận Ninh Kiều, Thành phố Cần Thơ. Đây là sân vận động có sức chứa lớn nhất ở Việt Nam (hơn cả sân Mỹ Đình) với 60.000 chỗ', N'vietnam1.jpg', CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2023-12-25T10:00:00.000' AS DateTime), CAST(N'2023-12-30T19:00:00.000' AS DateTime), N'TTN  ')
INSERT [dbo].[THONGTINSAN] ([MaSan], [TenSan], [MoTaSan], [AnhSan], [GiaSan], [TGBatDau], [TGKetThuc], [MaLoaiSan]) VALUES (N'TO002', N' Sân vận động Quốc gia Mỹ Đình', N'Sân vận động Quốc gia Mỹ Đình (tiếng Anh: Mỹ Đình National Stadium) là sân vận động quốc gia ở Hà Nội, Việt Nam với sức chứa 40.192 chỗ, lớn thứ nhì Việt Nam (sau sân vận động Cần Thơ).', N'sapa1.jpg', CAST(1800000.00 AS Decimal(18, 2)), CAST(N'2024-01-01T16:00:00.000' AS DateTime), CAST(N'2024-01-06T17:00:00.000' AS DateTime), N'TTN  ')
INSERT [dbo].[THONGTINSAN] ([MaSan], [TenSan], [MoTaSan], [AnhSan], [GiaSan], [TGBatDau], [TGKetThuc], [MaLoaiSan]) VALUES (N'TO003', N' Sân vận động Lạch Tray ', N'Sân vận động Lạch Tray là một sân vận động nằm ở đường Lạch Tray, quận Ngô Quyền, thành phố Hải Phòng, Việt Nam. Đây một trong những sân vận động ', N'phuquoc1.jpg', CAST(3500000.00 AS Decimal(18, 2)), CAST(N'2024-07-07T19:00:00.000' AS DateTime), CAST(N'2024-07-07T08:00:00.000' AS DateTime), N'TTN  ')
GO

ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HD_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HD_KH]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HD_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HD_NV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NV_CV] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NV_CV]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE QLSANBONG SET  READ_WRITE 
GO
