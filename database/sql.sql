USE [master]
GO
/****** Object:  Database [WebBanHang]    Script Date: 8/5/2021 9:57:36 AM ******/
CREATE DATABASE [WebBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebBanHang.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WebBanHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebBanHang] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebBanHang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WebBanHang]
GO
/****** Object:  Table [chitiethoadon]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chitiethoadon](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[soluong] [int] NOT NULL,
	[id_hoadon] [bigint] NOT NULL,
	[id_sanpham] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [chitietsanpham]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [chitietsanpham](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[anhchitiet] [ntext] NOT NULL,
	[id_sanpham] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [hoadon]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hoadon](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](191) NOT NULL,
	[sonha] [nvarchar](191) NOT NULL,
	[diachi] [nvarchar](191) NOT NULL,
	[dienthoai] [nvarchar](191) NOT NULL,
	[email] [nvarchar](191) NOT NULL,
	[ghichu] [ntext] NULL,
	[trangthai] [int] NOT NULL,
	[ngaydat] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [loaisanpham]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [loaisanpham](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tenloai] [nvarchar](191) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [quanhuyen]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [quanhuyen](
	[id] [int] NULL,
	[ten] [nvarchar](19) NULL,
	[donvi] [nvarchar](9) NULL,
	[tenkhongdau] [nvarchar](19) NULL,
	[tendaydu] [nvarchar](29) NULL,
	[tenthuong] [nvarchar](31) NULL,
	[tenhanhchinh] [nvarchar](46) NULL,
	[code] [int] NULL,
	[id_tinhthanhpho] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sanpham]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sanpham](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tensanpham] [ntext] NOT NULL,
	[mota] [ntext] NOT NULL,
	[giagoc] [float] NOT NULL,
	[khuyenmai] [int] NOT NULL,
	[anhchinh] [ntext] NOT NULL,
	[tinhtrang] [int] NOT NULL,
	[luotthich] [int] NOT NULL,
	[id_loaisp] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [taikhoan]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [taikhoan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tentaikhoan] [nvarchar](191) NOT NULL,
	[email] [nvarchar](191) NOT NULL,
	[matkhau] [nvarchar](191) NOT NULL,
	[phanquyen] [nvarchar](191) NOT NULL,
	[tenhienthi] [nvarchar](191) NOT NULL,
	[hinhanh] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [tinhthanhpho]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tinhthanhpho](
	[id] [int] NULL,
	[ten] [nvarchar](17) NULL,
	[tenkhongdau] [nvarchar](15) NULL,
	[donvi] [nvarchar](9) NULL,
	[tendaydu] [nvarchar](22) NULL,
	[code] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [xaphuong]    Script Date: 8/5/2021 9:57:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xaphuong](
	[id] [int] NULL,
	[ten] [nvarchar](20) NULL,
	[donvi] [nvarchar](8) NULL,
	[tenkhongdau] [nvarchar](20) NULL,
	[tendaydu] [nvarchar](29) NULL,
	[tenthuong] [nvarchar](42) NULL,
	[tenhanhchinh] [nvarchar](64) NULL,
	[code] [int] NULL,
	[id_quanhuyen] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [chitiethoadon] ON 

INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (1, 1, 1, 3)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (3, 1, 1, 4)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (4, 1, 2, 4)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (5, 1, 2, 6)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (6, 3, 3, 3)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (7, 1, 3, 4)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (8, 3, 3, 6)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (9, 1, 4, 2)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (10, 1, 5, 5)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (11, 1, 5, 6)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (12, 1, 6, 6)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (13, 1, 6, 7)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (14, 1, 7, 2)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (15, 1, 7, 5)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (16, 1, 7, 6)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (17, 1, 8, 8)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (18, 5, 9, 2)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (19, 2, 16, 3)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (20, 1, 17, 1)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (21, 1, 18, 2)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (22, 1, 19, 1)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (23, 2, 19, 2)
INSERT [chitiethoadon] ([id], [soluong], [id_hoadon], [id_sanpham]) VALUES (24, 1, 20, 4)
SET IDENTITY_INSERT [chitiethoadon] OFF
SET IDENTITY_INSERT [chitietsanpham] ON 

INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (9, N'Sp1BanhMan1.jpg', 1)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (10, N'Sp1BanhMan2.jpg', 1)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (13, N'Sp1BanhMan3.jpg', 1)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (14, N'Sp1BanhMan4.jpg', 1)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (15, N'Sp2Banhngot1.png', 2)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (16, N'Sp2Banhngot2.png', 2)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (17, N'Sp2Banhngot3.png', 2)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (18, N'Sp2Banhngot4.png', 2)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (19, N'Sp3banhngot1.jpg', 3)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (20, N'Sp3banhngot2.jpg', 3)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (21, N'Sp3banhngot3.jpg', 3)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (22, N'Sp3banhngot4.jpg', 3)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (23, N'Sp4banhngot1.jpg', 5)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (24, N'Sp4banhngot2.jpg', 5)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (25, N'Sp4banhngot3.jpg', 5)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (26, N'Sp4banhngot4.jpg', 5)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (27, N'Sp5camep1.jpg', 6)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (28, N'Sp5camep2.jpg', 6)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (29, N'Sp5camep4.jpg', 6)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (30, N'Sp5camep3.jpg', 6)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (31, N'Sp6nuocchanh1.jpg', 7)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (32, N'Sp6nuocchanh2.jpg', 7)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (33, N'Sp6nuocchanh3.jpg', 7)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (34, N'Sp6nuocchanh4.jpg', 7)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (35, N'Sp7trasua1.png', 8)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (36, N'Sp7trasua2.jpg', 8)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (37, N'Sp7trasua3.jpg', 8)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (38, N'Sp7trasua4.jpg', 8)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (41, N'Sp8banhngot1.jpg', 4)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (42, N'Sp8banhngot2.jpg', 4)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (43, N'Sp8banhngot3.jpg', 4)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (44, N'Sp8banhngot4.jpg', 4)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (46, N'Sp9banhbonglan1.jpg', 15)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (48, N'Sp9banhbonglan2.jpg', 15)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (49, N'Sp9banhbonglan3.jpg', 15)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (50, N'Sp9banhbonglan4.jpg', 15)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (51, N'Sp10banhchewy1.jpg', 16)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (52, N'Sp10banhchewy2.jpg', 16)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (53, N'Sp10banhchewy3.jpg', 16)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (54, N'Sp10banhchewy4.jpg', 16)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (55, N'Sp11banhchewy1.jpg', 21)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (56, N'Sp11banhchewy2.jpg', 21)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (57, N'Sp11banhchewy3.jpg', 21)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (58, N'Sp11banhchewy4.jpg', 21)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (60, N'Sp12banhchewy1.jpg', 18)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (61, N'Sp12banhchewy2.jpg', 18)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (62, N'Sp12banhchewy3.jpg', 18)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (63, N'Sp12banhchewy4.jpg', 18)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (64, N'Sp13banhchewy1.jpg', 25)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (65, N'Sp13banhchewy2.jpg', 25)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (66, N'Sp13banhchewy3.jpg', 25)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (67, N'Sp13banhchewy4.jpg', 25)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (68, N'Sp14banhchewy1.jpg', 26)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (69, N'Sp14banhchewy2.jpg', 26)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (70, N'Sp14banhchewy3.jpg', 26)
INSERT [chitietsanpham] ([id], [anhchitiet], [id_sanpham]) VALUES (71, N'Sp14banhchewy4.jpg', 26)
SET IDENTITY_INSERT [chitietsanpham] OFF
SET IDENTITY_INSERT [hoadon] ON 

INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (1, N'Nguyễn Văn Nhật Huy', N'Thị trấn Thuận An, Huyện Phú Vang, Thừa Thiên Huế', N'1 Kinh Dương Vương', N'08328904800', N'nguyenvannhathuy@gmail.com', N'Giao hàng trong 2 ngày', 1, CAST(0x060006C0BF01FE410B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (2, N'Nhật Huy Nguyễn Văn', N'Thành phố Huế, Thừa Thiên Huế', N'7 Hà Nội', N'01232890480', N'nhathuynguyenvan@gmail.com', N'Giao hàng gấp trong 3 ngày', 2, CAST(0x06C01565290F00420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (3, N'Văn Nhật Huy Nguyễn', N'Thành phố Huế, Thừa Thiên Huế', N'102 Bà Triệu', N'01232890480', N'vannhathuynguyen@gmail.com', N'Không yêu cầu', 2, CAST(0x06803E69030702420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (4, N'Huỳnh Công Nam', N'Thành phố Huế, Thừa Thiên Huế', N'28 Võ Thị Sáu', N'09361562850', N'huynhcongnam@gmail.com', N'Không yêu cầu', 2, CAST(0x064013BE0A0702420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (5, N'Trương Vinh Hiếu', N'Thị xã Hương Trà, Thừa Thiên Huế', N'12 Lý Thái Tổ', N'09361562850', N'truongvinhhieu@gmail.com', N'Giao hàng trong 1h', 2, CAST(0x064096FE140704420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (6, N'Hồ Khắc Thiện Huy', N'Thị xã Hương Thuỷ, Thừa Thiên Huế', N'12 An Dương Vương', N'08261537150', N'hokhacthienhuy@gmail.com', N'Không cần giao nhanh', 2, CAST(0x0600FF76190705420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (7, N'Hoàng Đức Đại Hạnh', N'Phường Hương Sơ, Thành Phố Huế', N'20 Yết Kiêu', N'09372374900', N'hoangducdaihanh@gmail.com', N'Giao hàng trong 2h', 1, CAST(0x06C079691E070F420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (8, N'Phạm Ngọc Bảo Khánh', N'Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', N'13 Hoàng Chính', N'09374635230', N'phamngocbaokhanh@gmail.com', N'Không yêu cầu', 2, CAST(0x06807BEF26071D420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (9, N'Đặng Hữu Thiện Phong', N'Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', N'12 Duy Tân', N'09361562850', N'danghuuthienphong@gmail.com', N'Giao hàng nhanh', 0, CAST(0x0680383914091E420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (14, N'Nguyễn Ích Phước', N'Phường Hòa Hiệp Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', N'131 Trần Phú', N'09123678230', N'nguyenichphuoc@gmail.com', N'Giao hàng nhanh', 0, CAST(0x06402841C90F1E420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (15, N'Lê Đức Anh', N'Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', N'58 Điện Biên Phủ', N'01237384340', N'leducanh@gmail.com', N'Không yêu cầu', 0, CAST(0x06803C91F70F1F420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (16, N'Trương Đức Thiện', N'Phường Hòa Hiệp Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', N'72 Lý Thái Tổ', N'09687123540', N'truongducthien@gmail.com', N'Giao hàng trong 1 ngày', 3, CAST(0x06C05659FD0F1F420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (17, N'Trần Thị Thu Nhàn', N'Phường Phước Ninh , Quận Hải Châu, Thành phố Đà Nẵng', N'01 Hùng Vương', N'09123349560', N'thunhan2104@gmail.com', N'Không yêu cầu', 0, CAST(0x06404A19291020420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (18, N'Trương Mai Trang Nhã', N'Huyện Bắc Trà My, Tỉnh Quảng Nam', N'270 Hai Bà Trưng', N'08123213950', N'truongmaitrangnha@gmail.com', N'Giao hàng sớm', 3, CAST(0x0680FDF76F102A420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (19, N'Dương Văn Việt', N'Huyện Núi Thành, Tỉnh Quảng Nam', N'187 Nguyễn Công Trứ', N'09734686840', N'duongvanviet@gmail.com', N'Không yêu cầu', 0, CAST(0x060071E1C00030420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (20, N'Trương Văn Trường', N'Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'45 An Dương Vương', N'01378912630', N'truongvantruong@gmail.com', N'Giao hàng nhanh chóng', 0, CAST(0x0680EC9B101439420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (21, N'Nguyễn Hoàng Nam', N'Thành phố Huế, Thừa Thiên Huế', N'47 Kinh Dương Vương, Huế', N'04231238950', N'nguyenhoangnam@gmail.com', N'Giao hàng chậm', 2, CAST(0x06002D201E0D76420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (22, N'Nghiêm Xuân Khánh', N'Huyện Phú Lộc, Thừa Thiên Huế', N'109 Ông Ích Khiêm', N'01244891230', N'nghiemxuankhanh@gmail.com', N'Giao hàng trong 2 ngày', 0, CAST(0x06C085A1B5087A420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (24, N'Dương Công Uẩn', N'Huyện Nghi Sơn, Thành phố Đà Nẵng', N'100 Tam Thai, Nghi Sơn, Đà Nẵng', N'08123127850', N'duongconguan@gmail.com', N'Giao hàng nhanh', 1, CAST(0x0640267AA00B7B420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (26, N'Trần Văn Nam', N'Huyện Bắc Trà My, Tỉnh Quảng Nam', N'47 Bà Triệu', N'09123857230', N'tranvannam@gmail.com', N'Không yêu cầu', 1, CAST(0x068011ECC60B7B420B AS DateTime2))
INSERT [hoadon] ([id], [hoten], [sonha], [diachi], [dienthoai], [email], [ghichu], [trangthai], [ngaydat]) VALUES (28, N'Hoàng Nam Kỳ', N'Thành phố Huế, Thừa Thiên Huế', N'28 Hà Nội, Thành phố Huế', N'01289435870', N'hoangnamky@gmail.com', N'Giao hàng nhanh', 1, CAST(0x0640C755DE057C420B AS DateTime2))
SET IDENTITY_INSERT [hoadon] OFF
SET IDENTITY_INSERT [loaisanpham] ON 

INSERT [loaisanpham] ([id], [tenloai]) VALUES (1, N' Bánh mặn')
INSERT [loaisanpham] ([id], [tenloai]) VALUES (2, N'Bánh ngọt')
INSERT [loaisanpham] ([id], [tenloai]) VALUES (3, N'Nước uống')
INSERT [loaisanpham] ([id], [tenloai]) VALUES (4, N'Trà sữa')
INSERT [loaisanpham] ([id], [tenloai]) VALUES (5, N'Bánh bông lan')
INSERT [loaisanpham] ([id], [tenloai]) VALUES (6, N'Bánh Chewy')
SET IDENTITY_INSERT [loaisanpham] OFF
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (0, N'', N'', N'', N'', N'', N'', 0, 0)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (490, N'Liên Chiểu', N'quan', N'lien-chieu', N'Quận Liên Chiểu', N'Liên Chiểu, Đà Nẵng', N'Quận Liên Chiểu, Thành phố Đà Nẵng', 490, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (491, N'Thanh Khê', N'quan', N'thanh-khe', N'Quận Thanh Khê', N'Thanh Khê, Đà Nẵng', N'Quận Thanh Khê, Thành phố Đà Nẵng', 491, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (492, N'Hải Châu', N'quan', N'hai-chau', N'Quận Hải Châu', N'Hải Châu, Đà Nẵng', N'Quận Hải Châu, Thành phố Đà Nẵng', 492, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (493, N'Sơn Trà', N'quan', N'son-tra', N'Quận Sơn Trà', N'Sơn Trà, Đà Nẵng', N'Quận Sơn Trà, Thành phố Đà Nẵng', 493, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (494, N'Ngũ Hành Sơn', N'quan', N'ngu-hanh-son', N'Quận Ngũ Hành Sơn', N'Ngũ Hành Sơn, Đà Nẵng', N'Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 494, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (495, N'Cẩm Lệ', N'quan', N'cam-le', N'Quận Cẩm Lệ', N'Cẩm Lệ, Đà Nẵng', N'Quận Cẩm Lệ, Thành phố Đà Nẵng', 495, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (497, N'Hòa Vang', N'huyen', N'hoa-vang', N'Huyện Hòa Vang', N'Hòa Vang, Đà Nẵng', N'Huyện Hòa Vang, Thành phố Đà Nẵng', 497, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (502, N'Tam Kỳ', N'thanh-pho', N'tam-ky', N'Thành phố Tam Kỳ', N'Tam Kỳ, Quảng Nam', N'Thành phố Tam Kỳ, Tỉnh Quảng Nam', 502, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (503, N'Hội An', N'thanh-pho', N'hoi-an', N'Thành phố Hội An', N'Hội An, Quảng Nam', N'Thành phố Hội An, Tỉnh Quảng Nam', 503, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (504, N'Tây Giang', N'huyen', N'tay-giang', N'Huyện Tây Giang', N'Tây Giang, Quảng Nam', N'Huyện Tây Giang, Tỉnh Quảng Nam', 504, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (505, N'Đông Giang', N'huyen', N'dong-giang', N'Huyện Đông Giang', N'Đông Giang, Quảng Nam', N'Huyện Đông Giang, Tỉnh Quảng Nam', 505, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (506, N'Đại Lộc', N'huyen', N'dai-loc', N'Huyện Đại Lộc', N'Đại Lộc, Quảng Nam', N'Huyện Đại Lộc, Tỉnh Quảng Nam', 506, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (507, N'Điện Bàn', N'thi-xa', N'dien-ban', N'Thị xã Điện Bàn', N'Điện Bàn, Quảng Nam', N'Thị xã Điện Bàn, Tỉnh Quảng Nam', 507, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (508, N'Duy Xuyên', N'huyen', N'duy-xuyen', N'Huyện Duy Xuyên', N'Duy Xuyên, Quảng Nam', N'Huyện Duy Xuyên, Tỉnh Quảng Nam', 508, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (509, N'Quế Sơn', N'huyen', N'que-son', N'Huyện Quế Sơn', N'Quế Sơn, Quảng Nam', N'Huyện Quế Sơn, Tỉnh Quảng Nam', 509, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (510, N'Nam Giang', N'huyen', N'nam-giang', N'Huyện Nam Giang', N'Nam Giang, Quảng Nam', N'Huyện Nam Giang, Tỉnh Quảng Nam', 510, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (511, N'Phước Sơn', N'huyen', N'phuoc-son', N'Huyện Phước Sơn', N'Phước Sơn, Quảng Nam', N'Huyện Phước Sơn, Tỉnh Quảng Nam', 511, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (512, N'Hiệp Đức', N'huyen', N'hiep-duc', N'Huyện Hiệp Đức', N'Hiệp Đức, Quảng Nam', N'Huyện Hiệp Đức, Tỉnh Quảng Nam', 512, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (513, N'Thăng Bình', N'huyen', N'thang-binh', N'Huyện Thăng Bình', N'Thăng Bình, Quảng Nam', N'Huyện Thăng Bình, Tỉnh Quảng Nam', 513, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (514, N'Tiên Phước', N'huyen', N'tien-phuoc', N'Huyện Tiên Phước', N'Tiên Phước, Quảng Nam', N'Huyện Tiên Phước, Tỉnh Quảng Nam', 514, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (515, N'Bắc Trà My', N'huyen', N'bac-tra-my', N'Huyện Bắc Trà My', N'Bắc Trà My, Quảng Nam', N'Huyện Bắc Trà My, Tỉnh Quảng Nam', 515, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (516, N'Nam Trà My', N'huyen', N'nam-tra-my', N'Huyện Nam Trà My', N'Nam Trà My, Quảng Nam', N'Huyện Nam Trà My, Tỉnh Quảng Nam', 516, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (517, N'Núi Thành', N'huyen', N'nui-thanh', N'Huyện Núi Thành', N'Núi Thành, Quảng Nam', N'Huyện Núi Thành, Tỉnh Quảng Nam', 517, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (518, N'Phú Ninh', N'huyen', N'phu-ninh', N'Huyện Phú Ninh', N'Phú Ninh, Quảng Nam', N'Huyện Phú Ninh, Tỉnh Quảng Nam', 518, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (519, N'Nông Sơn', N'huyen', N'nong-son', N'Huyện Nông Sơn', N'Nông Sơn, Quảng Nam', N'Huyện Nông Sơn, Tỉnh Quảng Nam', 519, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (0, N'', N'', N'', N'', N'', N'', 0, 0)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (490, N'Liên Chiểu', N'quan', N'lien-chieu', N'Quận Liên Chiểu', N'Liên Chiểu, Đà Nẵng', N'Quận Liên Chiểu, Thành phố Đà Nẵng', 490, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (491, N'Thanh Khê', N'quan', N'thanh-khe', N'Quận Thanh Khê', N'Thanh Khê, Đà Nẵng', N'Quận Thanh Khê, Thành phố Đà Nẵng', 491, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (492, N'Hải Châu', N'quan', N'hai-chau', N'Quận Hải Châu', N'Hải Châu, Đà Nẵng', N'Quận Hải Châu, Thành phố Đà Nẵng', 492, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (493, N'Sơn Trà', N'quan', N'son-tra', N'Quận Sơn Trà', N'Sơn Trà, Đà Nẵng', N'Quận Sơn Trà, Thành phố Đà Nẵng', 493, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (494, N'Ngũ Hành Sơn', N'quan', N'ngu-hanh-son', N'Quận Ngũ Hành Sơn', N'Ngũ Hành Sơn, Đà Nẵng', N'Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 494, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (495, N'Cẩm Lệ', N'quan', N'cam-le', N'Quận Cẩm Lệ', N'Cẩm Lệ, Đà Nẵng', N'Quận Cẩm Lệ, Thành phố Đà Nẵng', 495, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (497, N'Hòa Vang', N'huyen', N'hoa-vang', N'Huyện Hòa Vang', N'Hòa Vang, Đà Nẵng', N'Huyện Hòa Vang, Thành phố Đà Nẵng', 497, 48)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (502, N'Tam Kỳ', N'thanh-pho', N'tam-ky', N'Thành phố Tam Kỳ', N'Tam Kỳ, Quảng Nam', N'Thành phố Tam Kỳ, Tỉnh Quảng Nam', 502, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (503, N'Hội An', N'thanh-pho', N'hoi-an', N'Thành phố Hội An', N'Hội An, Quảng Nam', N'Thành phố Hội An, Tỉnh Quảng Nam', 503, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (504, N'Tây Giang', N'huyen', N'tay-giang', N'Huyện Tây Giang', N'Tây Giang, Quảng Nam', N'Huyện Tây Giang, Tỉnh Quảng Nam', 504, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (505, N'Đông Giang', N'huyen', N'dong-giang', N'Huyện Đông Giang', N'Đông Giang, Quảng Nam', N'Huyện Đông Giang, Tỉnh Quảng Nam', 505, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (506, N'Đại Lộc', N'huyen', N'dai-loc', N'Huyện Đại Lộc', N'Đại Lộc, Quảng Nam', N'Huyện Đại Lộc, Tỉnh Quảng Nam', 506, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (507, N'Điện Bàn', N'thi-xa', N'dien-ban', N'Thị xã Điện Bàn', N'Điện Bàn, Quảng Nam', N'Thị xã Điện Bàn, Tỉnh Quảng Nam', 507, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (508, N'Duy Xuyên', N'huyen', N'duy-xuyen', N'Huyện Duy Xuyên', N'Duy Xuyên, Quảng Nam', N'Huyện Duy Xuyên, Tỉnh Quảng Nam', 508, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (509, N'Quế Sơn', N'huyen', N'que-son', N'Huyện Quế Sơn', N'Quế Sơn, Quảng Nam', N'Huyện Quế Sơn, Tỉnh Quảng Nam', 509, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (510, N'Nam Giang', N'huyen', N'nam-giang', N'Huyện Nam Giang', N'Nam Giang, Quảng Nam', N'Huyện Nam Giang, Tỉnh Quảng Nam', 510, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (511, N'Phước Sơn', N'huyen', N'phuoc-son', N'Huyện Phước Sơn', N'Phước Sơn, Quảng Nam', N'Huyện Phước Sơn, Tỉnh Quảng Nam', 511, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (512, N'Hiệp Đức', N'huyen', N'hiep-duc', N'Huyện Hiệp Đức', N'Hiệp Đức, Quảng Nam', N'Huyện Hiệp Đức, Tỉnh Quảng Nam', 512, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (513, N'Thăng Bình', N'huyen', N'thang-binh', N'Huyện Thăng Bình', N'Thăng Bình, Quảng Nam', N'Huyện Thăng Bình, Tỉnh Quảng Nam', 513, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (514, N'Tiên Phước', N'huyen', N'tien-phuoc', N'Huyện Tiên Phước', N'Tiên Phước, Quảng Nam', N'Huyện Tiên Phước, Tỉnh Quảng Nam', 514, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (515, N'Bắc Trà My', N'huyen', N'bac-tra-my', N'Huyện Bắc Trà My', N'Bắc Trà My, Quảng Nam', N'Huyện Bắc Trà My, Tỉnh Quảng Nam', 515, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (516, N'Nam Trà My', N'huyen', N'nam-tra-my', N'Huyện Nam Trà My', N'Nam Trà My, Quảng Nam', N'Huyện Nam Trà My, Tỉnh Quảng Nam', 516, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (517, N'Núi Thành', N'huyen', N'nui-thanh', N'Huyện Núi Thành', N'Núi Thành, Quảng Nam', N'Huyện Núi Thành, Tỉnh Quảng Nam', 517, 49)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (520, N'Thành phố Huế', N'thanh-pho', N'thanh-pho-hue', N'Thành phố Huế', N'Thành phố Huế, Thừa Thiên Huế', N'Thành phố Huế, Tỉnh Thừa Thiên Huế', 520, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (521, N'Huyện A Lưới', N'huyen', N'huyen-a-luoi', N'Huyện A Lưới', N'A Lưới, Thừa Thiên Huế', N'Huyện A Lưới, Tỉnh Thừa Thiên Huế', 521, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (522, N'Thị xã Hương Thuỷ', N'thi-xa', N'thi-xa-huong-thuy', N'Thị xã Hương Thuỷ', N'Hương Thuỷ, Thừa Thiên Huế', N'Thị xã Hương Thuỷ, Tỉnh Thừa Thiên Huế', 522, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (523, N'Thị xã Hương Trà', N'thi-xa', N'thi-xa-huong-tra', N'Thị xã Hương Trà', N'Hương Trà, Thừa Thiên Huế', N'Thị xã Hương Trà, Tỉnh Thừa Thiên Huế', 523, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (524, N'Huyện Nam Đông ', N'huyen', N'huyen-nam-dong', N'Huyện Nam Đông', N'Nam Đông, Thừa Thiên Huế', N'Huyện Nam Đông, Tỉnh Thừa Thiên Huế', 524, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (525, N'Huyện Phong Điền', N'huyen', N'huyen-phong-dien', N'Huyện Phong Điền', N'Phong Điền, Thừa Thiên Huế', N'Huyện Phong Điền, Tỉnh Thừa Thiên Huế', 525, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (526, N'Huyện Phú Lộc', N'huyen', N'huyen-phu-loc', N'Huyện Phú Lộc', N'Phú Lộc, Thừa Thiên Huế', N'Huyện Phú Lộc, Tỉnh Thừa Thiên Huế', 526, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (527, N'Huyện Phú Vang', N'huyen', N'huyen-phu-vang', N'Huyện Phú Vang', N'Phú Vang, Thừa Thiên Huế ', N'Huyện Phú Vang, Tỉnh Thừa Thiên Huế', 527, 50)
INSERT [quanhuyen] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_tinhthanhpho]) VALUES (528, N'Huyện Quảng Điền ', N'huyen', N'huyen-quang-dien', N'Huyện Quảng Điền', N'Quảng Điền, Thừa Thiên Huế', N'Huyện Quảng Điền, Tỉnh Thừa Thiên Huế', 528, 50)
SET IDENTITY_INSERT [sanpham] ON 

INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (1, N'Bánh ổ mặn', N'Bánh ổ mặn được làm từ thành phần chủ yếu là bột gạo pha với ít bột mì cùng với nước cốt dừa, thêm chút gia vị đường, muối và được chế biến bằng phương pháp hấp cách thủy. Bánh có vị mặn và mùi thơm rất hấp dẫn.', 20000, 5, N'BanhMan1.png', 1, 100, 1)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (2, N'Panna cotta', N'Panna cotta (tiếng Ý có nghĩa là "kem nấu") là một món ngọt của Ý nấu kem, sữa và đường với bột thạch rồi đợi cho hỗn hợp đông lại. Món này xuất phát từ miền bắc nước Ý, vùng Piedmont rồi được phổ biến khắp đất nước với việc thêm vào các loại dâu dại, nước caramen, các loại sốt sô cô la hoặc trang trí thêm các vệt sốt trái cây. Người ta không biết món ăn này được khởi nguồn thế nào, có lẽ là từ khi kem, đặc biệt là loại kem trên các vùng núi miền bắc nước Ý, được ăn không hoặc pha thêm chất ngọt, ăn với trái cây hoặc hạt dẻ. Các công thức xa xưa của món này dùng xương cá luộc thay thế cho bột thạch; đường, gia vị chính cuẩ món này ngày nay, có lẽ đã không được sử dụng phổ biến vì thời xưa, đây là một nguyên liệu ngoại nhập đắt tiền. Sau nhiều năm, ngày nay, món này đã trở thành món thạch đông đặc với vani và gia thêm hương vị bằng các loại trái cây và gia vị đặt trên cùng và ăn lạnh.', 20000, 0, N'BanhNgot1.png', 1, 323, 2)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (3, N'Biscotti', N'Biscotti, còn được gọi là cantucci, là bánh quy hạnh nhân Ý có nguồn gốc từ thành phố Prato Tuscan. Chúng được nướng hai lần, hình thuôn, khô, giòn và có thể được nhúng trong đồ uống, theo truyền thống Vin Santo. Cantuccio là một từ tiếng Ý cổ có nghĩa đen là "nơi nhỏ", "ngóc ngách", nhưng trước đây, nó cũng được dùng để chỉ một miếng bánh mì nhỏ với nhiều lớp vỏ (thường là bánh đầu tiên và cuối cùng. lát của ổ bánh mì, "các góc").

Từ Biscotto , được sử dụng trong tiếng Ý hiện đại để chỉ một loại bánh quy (hoặc bánh quy), có nguồn gốc từ từ biscoctus trong tiếng Latinh thời trung cổ , có nghĩa là "nấu hai lần". Nó có đặc điểm là bánh nướng bằng lò nướng được nướng hai lần nên rất khô và có thể bảo quản trong thời gian dài. Loại thực phẩm khó hư hỏng này đặc biệt hữu ích trong các cuộc hành trình và chiến tranh, và bánh mì nướng hai lần là thực phẩm chủ yếu của quân đoàn La Mã . [2]

Từ biscotto , theo nghĩa này, có chung nguồn gốc với từ " biscuit " trong tiếng Anh-Anh (thông qua tiếng Pháp Cổ ) , [3] dùng để chỉ cái mà những người nói tiếng Anh-Mỹ gọi là " cookie ". Trong tiếng Ý hiện đại, từ biscotto dùng để chỉ bất kỳ loại bánh quy hoặc bánh quy giòn nào, cũng như người Anh sử dụng từ "bánh quy" (số lần nướng và mức độ cứng không liên quan đến thuật ngữ này). Ở các quốc gia khác, thuật ngữ "biscotti", được sử dụng như một số ít, chỉ dùng để chỉ loại bánh quy Ý cụ thể được biết đến ở Ý là cantuccio .', 13000, 2, N'BanhNgot2.png', 1, 1238, 2)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (4, N'Tartufo', N'Tartufo là một loại bánh có nguồn gốc từ ÝNó thường bao gồm hai hoặc nhiều hương vị kem, thường có xi-rô trái cây hoặc trái cây đông lạnh - thường là mâm xôi , dâu tây hoặc anh đào  - ở giữa. Nó thường được bao phủ trong lớp vỏ làm từ sô cô la hoặc ca cao , nhưng quếhoặc các loại hạt cũng được sử dụng. Tartufo thường bao gồm hai vị kem được điêu khắc bằng tay. Nếu có trái cây ở giữa, kem có thể được múc ra từ giữa và đặt trái cây vào bên trong, hoặc có thể dùng siro trái cây để dán hai muỗng lại với nhau. Nếu vỏ của nó là sô-cô-la, sô-cô-la đặc biệt thường được nấu chảy và nhúng hoặc đổ lên viên kem sau khi để nguội đến âm ấm - mặc dù nó cũng có thể được cuộn trong sô-cô-la - và sau đó đông lạnh. Nếu vỏ của nó là quế hoặc ca cao, nó thường được cuộn trong quế hoặc ca cao trước khi đông lạnh. Nếu nó sử dụng các loại hạt, chúng thường được đặt bằng tay nếu lớn hoặc cuộn lại nếu nhỏ hơn. Để có hình dạng đẹp hơn, khuôn hình tròn đôi khi được sử dụng.', 40000, 5, N'BanhNgot3.png', 0, 3853, 2)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (5, N'Bánh Cannoli ', N'Cannoli là loại bánh ngọt Ý bao gồm vỏ hình ống bằng bột bánh ngọt chiên , có nhân kem ngọt, thường chứa ricotta — một món ăn chính của ẩm thực Sicily . [1] [2] Chúng có kích thước từ 9 cm (3,5 in) đến 20 cm (7,9 in). Ở lục địa Ý, chúng thường được gọi là cannoli siciliani (Sicilian cannoli).', 30000, 4, N'BanhNgot4.png', 0, 5302, 2)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (6, N'Cam ép nguyên chất', N'Nước cam ép nguyên chất Ngày hè oi bức với nhiệt độ ngoài trời có khi lên tới 40 độ C Làm sao lại phải đi ra ngoài trong khi bạn hoàn toàn có thể ngồi tại chỗ và gọi cho mình ly nước cam mát ngọt thiên nhiên đầy năng lượng Nước ép cam tươi nguyên chất tại Lắc Coffee được chắt lọc từ những trái cam tươi ngon, chín mọng, cho ra sản phẩm là chai nước cam đỏ tươi ngọt dịu hòa vị chua thanh cùng với đá mát lạnh', 15000, 0, N'NuocUong.png', 1, 123, 3)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (7, N'Nước chanh đá', N'Chanh là một loại hoa quả được rất nhiều chị em phụ nữ yêu thích vì giá trị dinh dưỡng cao và tác dụng làm đẹp, giảm cân tự nhiên của chúng. Nhưng ít người biết hết được những công dụng bảo vệ sức khỏe tuyệt vời của chúng như nâng cao sức đề kháng và phòng ngừa một số bệnh.', 20000, 0, N'NuocUong1.png', 0, 32, 3)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (8, N'Đài Loan socola', N'Trà sữa là một món ăn vặt, là thức uống giải khát quen thuộc, đặc biệt là đối với trẻ nhỏ. Với hương vị thơm ngon béo ngậy của socola, đậm đà dễ uống, trà đen mát giải nhiệt, dùng kèm với trân châu dai dai hoặc thạch rau câu giòn, không ít người “mê mẩn” món trà sữa socola.', 45000, 2, N'TraSua1.png', 1, 462, 4)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (15, N'Bánh bông lan', N'Bánh có nguồn gốc từ phương Tây. Bánh một dạng thức ăn ngọt làm từ bột mì, đường và các thành phần khác, thường được nướng. Trong các hình thức lâu đời nhất của họ, bánh là sửa đổi từ bánh mì, nhưng hiện bao gồm một loạt các chế phẩm có thể đơn giản hoặc phức tạp, và chia sẻ các tính năng với các món tráng miệng khác như bánh pastry, bánh trứng đường, bánh trứng, bánh bông lan và bánh nướng.', 120000, 0, N'BanhBongLan1.jpg', 1, 123, 5)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (16, N'Bánh Chewy Classic', N'Bánh Chewy là một loại bánh bông lan ngọt, daiđến từ Việt Nam . [1] [2] Nó được làm từ bột gạo , nước, đường và men, [3] và có hình dạnggiống như tổ ong ở bên trong do có nhiều bọt khí nhỏ. Nước cốt dừa cũng thường là một phần của bột bánh, mang lại hương vị nhẹ và thơm của dừa. Chiếc bánh là của miền Nam Trung Quốc xuất xứ, mặc dù phiên bản Trung Quốc, gọi là bái táng Gao (白糖糕), không chứa nước cốt dừa. [4] Bánh bòthường được ăn như một món tráng miệng, mặc dù chúng cũng có thể được dùng như một món ăn kèm trong bữa ăn. ', 12000, 0, N'BanhChewy1.jpg', 1, 478, 6)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (18, N'Bánh Chewy Deluxe', N'Bánh Chewy là một loại bánh bông lan ngọt, daiđến từ Việt Nam . [1] [2] Nó được làm từ bột gạo , nước, đường và men, [3] và có hình dạnggiống như tổ ong ở bên trong do có nhiều bọt khí nhỏ. Nước cốt dừa cũng thường là một phần của bột bánh, mang lại hương vị nhẹ và thơm của dừa. Chiếc bánh là của miền Nam Trung Quốc xuất xứ, mặc dù phiên bản Trung Quốc, gọi là bái táng Gao (白糖糕), không chứa nước cốt dừa. [4] Bánh bòthường được ăn như một món tráng miệng, mặc dù chúng cũng có thể được dùng như một món ăn kèm trong bữa ăn. ', 28000, 0, N'BanhChewy3.jpg', 1, 119, 6)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (21, N'Bánh Chewy Event', N'Bánh Chewy event là loại bánh được sử dụng trong các sự kiện, tiệc lớn và tổ chức hội họp, hội thảo. Bánh có vị ngọt rất đặc trưng nhờ vào công thức pha chế đặc biệt.', 100000, 0, N'BanhChewy2.jpg', 2, 587, 6)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (25, N'Bánh Chewy Deluxe 2', N'Bánh Chewy là một loại bánh bông lan ngọt, daiđến từ Việt Nam . [1] [2] Nó được làm từ bột gạo , nước, đường và men, [3] và có hình dạnggiống như tổ ong ở bên trong do có nhiều bọt khí nhỏ. Nước cốt dừa cũng thường là một phần của bột bánh, mang lại hương vị nhẹ và thơm của dừa. Chiếc bánh là của miền Nam Trung Quốc xuất xứ, mặc dù phiên bản Trung Quốc, gọi là bái táng Gao (白糖糕), không chứa nước cốt dừa. [4] Bánh bòthường được ăn như một món tráng miệng, mặc dù chúng cũng có thể được dùng như một món ăn kèm trong bữa ăn. ', 70000, 0, N'BanhChewy3.jpg', 1, 236, 6)
INSERT [sanpham] ([id], [tensanpham], [mota], [giagoc], [khuyenmai], [anhchinh], [tinhtrang], [luotthich], [id_loaisp]) VALUES (26, N'Bánh Chewy Deluxe 3', N'Bánh Chewy là một loại bánh bông lan ngọt, daiđến từ Việt Nam . [1] [2] Nó được làm từ bột gạo , nước, đường và men, [3] và có hình dạnggiống như tổ ong ở bên trong do có nhiều bọt khí nhỏ. Nước cốt dừa cũng thường là một phần của bột bánh, mang lại hương vị nhẹ và thơm của dừa. Chiếc bánh là của miền Nam Trung Quốc xuất xứ, mặc dù phiên bản Trung Quốc, gọi là bái táng Gao (白糖糕), không chứa nước cốt dừa. [4] Bánh bòthường được ăn như một món tráng miệng, mặc dù chúng cũng có thể được dùng như một món ăn kèm trong bữa ăn. ', 80000, 0, N'BanhChewy4.jpg', 1, 458, 6)
SET IDENTITY_INSERT [sanpham] OFF
SET IDENTITY_INSERT [taikhoan] ON 

INSERT [taikhoan] ([id], [tentaikhoan], [email], [matkhau], [phanquyen], [tenhienthi], [hinhanh]) VALUES (10, N'nguyenvannhathuy', N'nhathuy@gmail.com', N'123', N'1', N'Nguyễn Văn Nhật Huy', N'nhathuy.jpg')
INSERT [taikhoan] ([id], [tentaikhoan], [email], [matkhau], [phanquyen], [tenhienthi], [hinhanh]) VALUES (11, N'nhathuy', N'nhathuy@gmail.com', N'123', N'0', N'Nguyễn Văn Nhật Huy', N'nhathuy2.jpg')
INSERT [taikhoan] ([id], [tentaikhoan], [email], [matkhau], [phanquyen], [tenhienthi], [hinhanh]) VALUES (14, N'huynhat', N'nhathuy@gmail.com', N'123', N'0', N'Nguyễn Văn Nhật Huy', N'nhathuy3.jpg')
SET IDENTITY_INSERT [taikhoan] OFF
INSERT [tinhthanhpho] ([id], [ten], [tenkhongdau], [donvi], [tendaydu], [code]) VALUES (0, N'', N'', N'', N'', 0)
INSERT [tinhthanhpho] ([id], [ten], [tenkhongdau], [donvi], [tendaydu], [code]) VALUES (48, N'Đà Nẵng', N'da-nang', N'thanh-pho', N'Thành phố Đà Nẵng', 48)
INSERT [tinhthanhpho] ([id], [ten], [tenkhongdau], [donvi], [tendaydu], [code]) VALUES (49, N'Quảng Nam', N'quang-nam', N'tinh', N'Tỉnh Quảng Nam', 49)
INSERT [tinhthanhpho] ([id], [ten], [tenkhongdau], [donvi], [tendaydu], [code]) VALUES (50, N'Thừa Thiên Huế', N'thua-thien-hue', N'tinh', N'Tỉnh Thừa Thiên Huế', 50)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20194, N'Hòa Hiệp Bắc', N'phuong', N'hoa-hiep-bac', N'Phường Hòa Hiệp Bắc', N'Hòa Hiệp Bắc, Liên Chiểu, Đà Nẵng', N'Phường Hòa Hiệp Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 20194, 490)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20195, N'Hòa Hiệp Nam', N'phuong', N'hoa-hiep-nam', N'Phường Hòa Hiệp Nam', N'Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng', N'Phường Hòa Hiệp Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 20195, 490)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20197, N'Hòa Khánh Bắc', N'phuong', N'hoa-khanh-bac', N'Phường Hòa Khánh Bắc', N'Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng', N'Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành phố Đà Nẵng', 20197, 490)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20198, N'Hòa Khánh Nam', N'phuong', N'hoa-khanh-nam', N'Phường Hòa Khánh Nam', N'Hòa Khánh Nam, Liên Chiểu, Đà Nẵng', N'Phường Hòa Khánh Nam, Quận Liên Chiểu, Thành phố Đà Nẵng', 20198, 490)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20200, N'Hòa Minh', N'phuong', N'hoa-minh', N'Phường Hòa Minh', N'Hòa Minh, Liên Chiểu, Đà Nẵng', N'Phường Hòa Minh, Quận Liên Chiểu, Thành phố Đà Nẵng', 20200, 490)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20203, N'Tam Thuận', N'phuong', N'tam-thuan', N'Phường Tam Thuận', N'Tam Thuận, Thanh Khê, Đà Nẵng', N'Phường Tam Thuận, Quận Thanh Khê, Thành phố Đà Nẵng', 20203, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20206, N'Thanh Khê Tây', N'phuong', N'thanh-khe-tay', N'Phường Thanh Khê Tây', N'Thanh Khê Tây, Thanh Khê, Đà Nẵng', N'Phường Thanh Khê Tây, Quận Thanh Khê, Thành phố Đà Nẵng', 20206, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20207, N'Thanh Khê Đông', N'phuong', N'thanh-khe-dong', N'Phường Thanh Khê Đông', N'Thanh Khê Đông, Thanh Khê, Đà Nẵng', N'Phường Thanh Khê Đông, Quận Thanh Khê, Thành phố Đà Nẵng', 20207, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20209, N'Xuân Hà', N'phuong', N'xuan-ha', N'Phường Xuân Hà', N'Xuân Hà, Thanh Khê, Đà Nẵng', N'Phường Xuân Hà, Quận Thanh Khê, Thành phố Đà Nẵng', 20209, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20212, N'Tân Chính', N'phuong', N'tan-chinh', N'Phường Tân Chính', N'Tân Chính, Thanh Khê, Đà Nẵng', N'Phường Tân Chính, Quận Thanh Khê, Thành phố Đà Nẵng', 20212, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20215, N'Chính Gián', N'phuong', N'chinh-gian', N'Phường Chính Gián', N'Chính Gián, Thanh Khê, Đà Nẵng', N'Phường Chính Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 20215, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20218, N'Vĩnh Trung', N'phuong', N'vinh-trung', N'Phường Vĩnh Trung', N'Vĩnh Trung, Thanh Khê, Đà Nẵng', N'Phường Vĩnh Trung, Quận Thanh Khê, Thành phố Đà Nẵng', 20218, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20221, N'Thạc Gián', N'phuong', N'thac-gian', N'Phường Thạc Gián', N'Thạc Gián, Thanh Khê, Đà Nẵng', N'Phường Thạc Gián, Quận Thanh Khê, Thành phố Đà Nẵng', 20221, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20224, N'An Khê', N'phuong', N'an-khe', N'Phường An Khê', N'An Khê, Thanh Khê, Đà Nẵng', N'Phường An Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 20224, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20225, N'Hòa Khê', N'phuong', N'hoa-khe', N'Phường Hòa Khê', N'Hòa Khê, Thanh Khê, Đà Nẵng', N'Phường Hòa Khê, Quận Thanh Khê, Thành phố Đà Nẵng', 20225, 491)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20227, N'Thanh Bình', N'phuong', N'thanh-binh', N'Phường Thanh Bình', N'Thanh Bình, Hải Châu, Đà Nẵng', N'Phường Thanh Bình, Quận Hải Châu, Thành phố Đà Nẵng', 20227, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20230, N'Thuận Phước', N'phuong', N'thuan-phuoc', N'Phường Thuận Phước', N'Thuận Phước, Hải Châu, Đà Nẵng', N'Phường Thuận Phước, Quận Hải Châu, Thành phố Đà Nẵng', 20230, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20233, N'Thạch Thang', N'phuong', N'thach-thang', N'Phường Thạch Thang', N'Thạch Thang, Hải Châu, Đà Nẵng', N'Phường Thạch Thang, Quận Hải Châu, Thành phố Đà Nẵng', 20233, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20236, N'Hải Châu  I', N'phuong', N'hai-chau-i', N'Phường Hải Châu  I', N'Hải Châu  I, Hải Châu, Đà Nẵng', N'Phường Hải Châu  I, Quận Hải Châu, Thành phố Đà Nẵng', 20236, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20239, N'Hải Châu II', N'phuong', N'hai-chau-ii', N'Phường Hải Châu II', N'Hải Châu II, Hải Châu, Đà Nẵng', N'Phường Hải Châu II, Quận Hải Châu, Thành phố Đà Nẵng', 20239, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20242, N'Phước Ninh', N'phuong', N'phuoc-ninh', N'Phường Phước Ninh', N'Phước Ninh, Hải Châu, Đà Nẵng', N'Phường Phước Ninh, Quận Hải Châu, Thành phố Đà Nẵng', 20242, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20245, N'Hòa Thuận Tây', N'phuong', N'hoa-thuan-tay', N'Phường Hòa Thuận Tây', N'Hòa Thuận Tây, Hải Châu, Đà Nẵng', N'Phường Hòa Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng', 20245, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20246, N'Hòa Thuận Đông', N'phuong', N'hoa-thuan-dong', N'Phường Hòa Thuận Đông', N'Hòa Thuận Đông, Hải Châu, Đà Nẵng', N'Phường Hòa Thuận Đông, Quận Hải Châu, Thành phố Đà Nẵng', 20246, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20248, N'Nam Dương', N'phuong', N'nam-duong', N'Phường Nam Dương', N'Nam Dương, Hải Châu, Đà Nẵng', N'Phường Nam Dương, Quận Hải Châu, Thành phố Đà Nẵng', 20248, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20251, N'Bình Hiên', N'phuong', N'binh-hien', N'Phường Bình Hiên', N'Bình Hiên, Hải Châu, Đà Nẵng', N'Phường Bình Hiên, Quận Hải Châu, Thành phố Đà Nẵng', 20251, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20254, N'Bình Thuận', N'phuong', N'binh-thuan', N'Phường Bình Thuận', N'Bình Thuận, Hải Châu, Đà Nẵng', N'Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', 20254, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20257, N'Hòa Cường Bắc', N'phuong', N'hoa-cuong-bac', N'Phường Hòa Cường Bắc', N'Hòa Cường Bắc, Hải Châu, Đà Nẵng', N'Phường Hòa Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng', 20257, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20258, N'Hòa Cường Nam', N'phuong', N'hoa-cuong-nam', N'Phường Hòa Cường Nam', N'Hòa Cường Nam, Hải Châu, Đà Nẵng', N'Phường Hòa Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', 20258, 492)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20263, N'Thọ Quang', N'phuong', N'tho-quang', N'Phường Thọ Quang', N'Thọ Quang, Sơn Trà, Đà Nẵng', N'Phường Thọ Quang, Quận Sơn Trà, Thành phố Đà Nẵng', 20263, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20266, N'Nại Hiên Đông', N'phuong', N'nai-hien-dong', N'Phường Nại Hiên Đông', N'Nại Hiên Đông, Sơn Trà, Đà Nẵng', N'Phường Nại Hiên Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 20266, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20269, N'Mân Thái', N'phuong', N'man-thai', N'Phường Mân Thái', N'Mân Thái, Sơn Trà, Đà Nẵng', N'Phường Mân Thái, Quận Sơn Trà, Thành phố Đà Nẵng', 20269, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20272, N'An Hải Bắc', N'phuong', N'an-hai-bac', N'Phường An Hải Bắc', N'An Hải Bắc, Sơn Trà, Đà Nẵng', N'Phường An Hải Bắc, Quận Sơn Trà, Thành phố Đà Nẵng', 20272, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20275, N'Phước Mỹ', N'phuong', N'phuoc-my', N'Phường Phước Mỹ', N'Phước Mỹ, Sơn Trà, Đà Nẵng', N'Phường Phước Mỹ, Quận Sơn Trà, Thành phố Đà Nẵng', 20275, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20278, N'An Hải Tây', N'phuong', N'an-hai-tay', N'Phường An Hải Tây', N'An Hải Tây, Sơn Trà, Đà Nẵng', N'Phường An Hải Tây, Quận Sơn Trà, Thành phố Đà Nẵng', 20278, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20281, N'An Hải Đông', N'phuong', N'an-hai-dong', N'Phường An Hải Đông', N'An Hải Đông, Sơn Trà, Đà Nẵng', N'Phường An Hải Đông, Quận Sơn Trà, Thành phố Đà Nẵng', 20281, 493)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20284, N'Mỹ An', N'phuong', N'my-an', N'Phường Mỹ An', N'Mỹ An, Ngũ Hành Sơn, Đà Nẵng', N'Phường Mỹ An, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 20284, 494)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20285, N'Khuê Mỹ', N'phuong', N'khue-my', N'Phường Khuê Mỹ', N'Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng', N'Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 20285, 494)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20287, N'Hoà Quý', N'phuong', N'hoa-quy', N'Phường Hoà Quý', N'Hoà Quý, Ngũ Hành Sơn, Đà Nẵng', N'Phường Hoà Quý, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 20287, 494)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20290, N'Hoà Hải', N'phuong', N'hoa-hai', N'Phường Hoà Hải', N'Hoà Hải, Ngũ Hành Sơn, Đà Nẵng', N'Phường Hoà Hải, Quận Ngũ Hành Sơn, Thành phố Đà Nẵng', 20290, 494)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20260, N'Khuê Trung', N'phuong', N'khue-trung', N'Phường Khuê Trung', N'Khuê Trung, Cẩm Lệ, Đà Nẵng', N'Phường Khuê Trung, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20260, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20305, N'Hòa Phát', N'phuong', N'hoa-phat', N'Phường Hòa Phát', N'Hòa Phát, Cẩm Lệ, Đà Nẵng', N'Phường Hòa Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20305, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20306, N'Hòa An', N'phuong', N'hoa-an', N'Phường Hòa An', N'Hòa An, Cẩm Lệ, Đà Nẵng', N'Phường Hòa An, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20306, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20311, N'Hòa Thọ Tây', N'phuong', N'hoa-tho-tay', N'Phường Hòa Thọ Tây', N'Hòa Thọ Tây, Cẩm Lệ, Đà Nẵng', N'Phường Hòa Thọ Tây, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20311, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20312, N'Hòa Thọ Đông', N'phuong', N'hoa-tho-dong', N'Phường Hòa Thọ Đông', N'Hòa Thọ Đông, Cẩm Lệ, Đà Nẵng', N'Phường Hòa Thọ Đông, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20312, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20314, N'Hòa Xuân', N'phuong', N'hoa-xuan', N'Phường Hòa Xuân', N'Hòa Xuân, Cẩm Lệ, Đà Nẵng', N'Phường Hòa Xuân, Quận Cẩm Lệ, Thành phố Đà Nẵng', 20314, 495)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20293, N'Hòa Bắc', N'xa', N'hoa-bac', N'Xã Hòa Bắc', N'Hòa Bắc, Hòa Vang, Đà Nẵng', N'Xã Hòa Bắc, Huyện Hòa Vang, Thành phố Đà Nẵng', 20293, 497)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20296, N'Hòa Liên', N'xa', N'hoa-lien', N'Xã Hòa Liên', N'Hòa Liên, Hòa Vang, Đà Nẵng', N'Xã Hòa Liên, Huyện Hòa Vang, Thành phố Đà Nẵng', 20296, 497)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20299, N'Hòa Ninh', N'xa', N'hoa-ninh', N'Xã Hòa Ninh', N'Hòa Ninh, Hòa Vang, Đà Nẵng', N'Xã Hòa Ninh, Huyện Hòa Vang, Thành phố Đà Nẵng', 20299, 497)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20302, N'Hòa Sơn', N'xa', N'hoa-son', N'Xã Hòa Sơn', N'Hòa Sơn, Hòa Vang, Đà Nẵng', N'Xã Hòa Sơn, Huyện Hòa Vang, Thành phố Đà Nẵng', 20302, 497)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20308, N'Hòa Nhơn', N'xa', N'hoa-nhon', N'Xã Hòa Nhơn', N'Hòa Nhơn, Hòa Vang, Đà Nẵng', N'Xã Hòa Nhơn, Huyện Hòa Vang, Thành phố Đà Nẵng', 20308, 497)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20400, N'An Cựu', N'phuong', N'an-cuu', N'Phường An Cựu ', N'An Cựu, Huế', N'Phường An Cựu, Thành phố Huế, Thừa Thiên Huế', 20400, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20401, N'An Hoà', N'phuong', N'an-hoa', N'Phường An Hoà', N'An Hoà, Huế', N'Phường An Hoà, Thành phố Huế, Thừa Thiên Huế', 20401, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20402, N'Hương Long', N'phuong', N'huong-long', N'Phường Hương Long', N'Hương Long, Huế', N'Phường Hương Long, Thành phố Huế, Thừa Thiên Huế', 20402, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20403, N'Kim Long', N'phuong ', N'kim-long', N'Phường Kim Long', N'Kim Long, Huế', N'Phường Kim Long, Thành phố Huế, Thừa Thiên Huế', 20403, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20404, N'Phú Cát', N'phuong', N'phu-cat', N'Phường Phú Cát', N'Phú Cát, Huế', N'Phường Phú Cát, Thành phố Huế, Thừa Thiên Huế', 20404, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20405, N'Phú Hiệp', N'phuong', N'phu-hiep', N'Phường Phú Hiệp', N'Phú Hiệp, Huế', N'Phường Phú Hiệp, Thành phố Huế, Thừa Thiên Huế', 20405, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20406, N'Phú Hội', N'phuong', N'phu-hoi', N'Phường Phú Hội', N'Phú Hội, Huế', N'Phường Phú Hội, Thành phố Huế, Thừa Thiên Huế', 20406, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20407, N'Phú Thuận', N'phuong', N'phu-thuan', N'Phường Phú Thuận', N'Phú Thuận, Huế', N'Phường Phú Thuận, Thành phố Huế, Thừa Thiên Huế', 20407, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20408, N'Phường Đúc', N'phuong', N'phuong-duc', N'Phường Phường Đúc', N'Phường Đúc, Huế', N'Phường Phường Đúc, Thành phố Huế, Thừa Thiên Huế', 20408, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20409, N'Thuận Hoà', N'phuong', N'thuan-hoa', N'Phường Thuận Hoà', N'Thuận Hoà, Huế', N'Phường Thuận Hoà, Thành phố Huế, Thừa Thiên Huế', 20409, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20410, N'Thuận Thành ', N'phuong', N'thuan-thanh', N'Phường Thuận Thành', N'Thuận Thành, Huế', N'Phường Thuận Thành, Thành phố Huế, Thừa Thiên Huế', 20410, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20411, N'Thuỷ Xuân', N'phuong', N'thuy-xuan', N'Phường Thuỷ Xuân', N'Thuỷ Xuân, Huế', N'Phường Thuỷ Xuân, Thành phố Huế, Thừa Thiên Huế', 20411, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20412, N'Vĩnh Ninh', N'phuong', N'vinh-ninh', N'Phường Vĩnh Ninh', N'Vĩnh Ninh, Huế', N'Phường Vĩnh Ninh, Thành phố Huế, Thừa Thiên Huế', 20412, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20413, N'Xuân Phú', N'phuong', N'xuan-phu', N'Phường Xuân Phú', N'Xuân Phú, Huế', N'Phường Xuân Phú, Thành phố Huế, Thừa Thiên Huế', 20413, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20414, N'An Đông', N'phuong', N'an-dong', N'Phường An Đông', N'An Đông, Huế', N'Phường An Đông, Thành phố Huế, Thừa Thiên Huế', 20414, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20415, N'An Tây', N'phuong', N'an-tay', N'Phường An Tây', N'An Tây, Huế', N'Phương An Tây, Thành phố Huế, Thừa Thiên Huế', 20415, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20416, N'Hương Sơ', N'phuong', N'huong-so', N'Phường Hương Sơ', N'Hương Sơ, Huế', N'Phường Hương Sơ, Thành phố Huế, Thừa Thiên Huế', 20416, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20417, N'Phú Bình ', N'phuong', N'phu-binh', N'Phường Phú Bình', N'Phú Bình, Huế', N'Phường Phú Bình, Thành phố Huế, Thừa Thiên Huế', 20417, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20418, N'Phú Hậu ', N'phuong', N'phu-hau', N'Phường Phú Hậu', N'Phú Hậu, Huế', N'Phường Phú Hậu, Thành phố Huế, Thừa Thiên Huế', 20418, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20419, N'Phú Hoà', N'phuong ', N'phu-hoa', N'Phường Phú Hoà', N'Phú Hoà, Huế', N'Phường Phú Hoà, Thành phố Huế, Thừa Thiên Huế', 20419, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20420, N'Phú Nhuận', N'phuong', N'phu-nhuan', N'Phường Phú Nhuận', N'Phú Nhuận, Huế', N'Phường Phú Nhuận, Thành phố huế, Thừa Thiên Huế', 20420, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20421, N'Phước Vĩnh ', N'phuong', N'phuoc-vinh', N'Phường Phước Vĩnh', N'Phước Vĩnh, Huế', N'Phường Phước Vĩnh, Thành phố Huế, Thừa Thiên Huế', 20421, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20422, N'Tây Lộc', N'phuong', N'tay-loc', N'Phường Tây Lộc', N'Tây Lộc, Huế', N'Phường Tây Lộc, Thành phố Huế, Thừa Thiên Huế', 20422, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20423, N'Thuận Lộc', N'phuong', N'thuan-loc', N'Phường Thuận Lộc', N'Thuận Lộc, Huế', N'Phường Thuận Lộc, Thành phố Huế, Thừa Thiên Huế', 20423, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20424, N'Thuỷ Biều', N'phuong', N'thuy-bieu', N'Phường Thuỷ Biều', N'Thuỷ Biều, Huế', N'Phường Thuỷ Biều, Thành phố Huế, Thừa Thiên Huế', 20424, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20425, N'Trường An', N'phuong', N'truong-an', N'Phường Trường An', N'Trường An, Huế ', N'Phường Trường An, Thành phố Huế, Thừa Thiên Huế', 20425, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20426, N'Vĩ Dạ ', N'phuong', N'vi-da', N'Phường Vĩ Dạ', N'Vĩ Dạ, Huế', N'Phường Vĩ Dạ, Thành phố Huế, Thừa Thiên Huế', 20426, 520)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20427, N'A Lưới', N'thi-tran', N'a-luoi', N'Thị trấn A Lưới', N'A Lưới, Huế', N'Thị trấn A Lưới, Huyện A Lưới, Thừa Thiên Huế', 20427, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20428, N'A Roàng', N'xa', N'a-roang', N'Xã A Roàng', N'A Roàng, Huế', N'Xã A Roàng, Huyện A Lưới,  Thừa Thiên Huế', 20428, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20429, N'Hồng Bắc ', N'xa', N'hong-bac', N'Xã Hồng Bắc ', N'Hồng Bắc, Huế', N'Xã Hồng Bắc, Huyện A Lưới,  Thừa Thiên Huế', 20429, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20430, N'Hồng Kim', N'xa', N'hong-kim', N'Xã Hồng Kim', N'Hồng Kim, Huế', N'Xã Hồng Kim, Huyện A Lưới,  Thừa Thiên Huế', 20430, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20431, N'Hồng Thượng', N'xa', N'hong-thuong', N'Xã Hồng Thượng', N'Hồng Thượng, Huế', N'Xã Hồng Thượng, Huyện A Lưới,  Thừa Thiên Huế', 20431, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20432, N'Hồng Vân', N'xa', N'hong-van', N'Xã Hồng Vân', N'Hồng Vân, Huế', N'Xã Hồng Vân, Huyện A Lưới,  Thừa Thiên Huế', 20432, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20433, N'Hương Phong ', N'xa', N'huong-phong', N'Xã Hương Phong', N'Hương Phong, Huế', N'Xã Hương Phong, Huyện A Lưới,  Thừa Thiên Huế', 20433, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20434, N'Phú Vinh', N'xa', N'phu-vinh', N'Xã Phú Vinh', N'Phú Vinh, Huế', N'Xã Phú Vinh, Huyện A Lưới,  Thừa Thiên Huế', 20434, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20435, N'Sơn Thuỷ', N'xa', N'son-thuy', N'Xã Sơn Thuỷ', N'Sơn Thuỷ, Huế', N'Xã Sơn Thuỷ, Huyện A Lưới,  Thừa Thiên Huế', 20435, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20436, N'A Ngo', N'xa', N'a-ngo', N'Xã A Ngo', N'A Ngo, Huế', N'Xã A Ngo, Huyện A Lưới,  Thừa Thiên Huế', 20436, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20437, N'Đông Sơn', N'xa', N'dong-son', N'Xã Đông Sơn', N'Đông Sơn, Huế', N'Xã Đông Sơn, Huyện A Lưới,  Thừa Thiên Huế', 20437, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20438, N'Hồng Hạ ', N'xa', N'hong-ha', N'Xã Hồng Hạ', N'Hồng Hạ, Huế', N'Xã Hồng Hạ, Huyện A Lưới,  Thừa Thiên Huế', 20438, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20439, N'Hồng Thái', N'xa', N'hong-thai', N'Xã Hồng Thái', N'Hồng Thái, Huế', N'Xã Hồng Thái, Huyện A Lưới,  Thừa Thiên Huế', 20439, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20440, N'Hồng Thuỷ', N'xa', N'hong-thuy', N'Xã Hồng Thuỷ', N'Hồng Thuỷ, Huế', N'Xã Hồng Thuỷ, Huyện A Lưới,  Thừa Thiên Huế', 20440, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20441, N'Hương Nguyên', N'xa', N'huong-nguyen', N'Xã Hương Nguyên', N'Hương Nguyên, Huế', N'Xã Hương Nguyên, Huyện A Lưới,  Thừa Thiên Huế', 20441, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20442, N'Lâm Đớt', N'xa', N'lam-dot', N'Xã Lâm Đớt', N'Lâm Đớt, Huế', N'Xã Lâm Đớt, Huyện A Lưới,  Thừa Thiên Huế', 20442, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20443, N'Quảng Nhâm', N'xa', N'quang-nham', N'Xã Quảng Nhâm', N'Quảng Nhâm, Huế', N'Xã Quảng Nhâm, Huyện A Lưới,  Thừa Thiên Huế', 20443, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20444, N'Trung Sơn', N'xa', N'trung-son', N'Xã Trung Sơn', N'Trung Sơn, Huế', N'Xã Trung Sơn, Huyện A Lưới,  Thừa Thiên Huế', 20444, 521)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20445, N'Phú Bài', N'phuong', N'phu-bai', N'Phường Phú Bài', N'Phú Bài, Huế', N'Phường Phú Bài, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20445, 522)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20446, N'Thuỷ Dương ', N'phuong', N'thuy-duong', N'Phường Thuỷ Dương', N'Thuỷ Dương, Huế', N'Phường Thuỷ Dương, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20446, 522)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20447, N'Thuỷ Phương', N'phuong', N'thuy-phuong', N'Phường Thuỷ Phương', N'Thuỷ Phương, Huế', N'Phường Thuỷ Phương, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20447, 522)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20448, N'Phú Sơn', N'xa', N'phu-son', N'Xã Phú Sơn', N'Phú Sơn, Huế', N'Xã Phú Sơn, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20448, 522)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20449, N'Thuỷ Phù', N'xa', N'thuy-phu', N'Xã Thuỷ Phù', N'Thuỷ Phù, Huế', N'Xã Thuỷ Phù, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20449, 522)
GO
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20450, N'Thuỷ Thanh', N'xa', N'thuy-thanh', N'Xã Thuỷ Thanh', N'Thuỷ Thanh, Huế', N'Xã Thuỷ Thanh, Thị xã Hương Thuỷ, Thừa Thiên Huế', 20450, 522)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20451, N'Hương An', N'phuong', N'huong-an', N'Phường Hương An', N'Hương An, Huế', N'Phường Hương An, Thị xã Hương Trà, Thừa Thiên Huế', 20451, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20452, N'Hương Hồ', N'phuong', N'huong-ho', N'Phường Hương Hồ', N'Hương Hồ, Huế', N'Phường Hương Hồ, Thị xã Hương Trà, Thừa Thiên Huế', 20452, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20453, N'Hương Văn ', N'phuong', N'huong-van', N'Phường Hương Văn', N'Hương Văn, Huế', N'Phường Hương Văn, Thị xã Hương Trà, Thừa Thiên Huế', 20453, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20454, N'Tứ Hạ', N'phuong', N'tu-ha', N'Phường Tứ Hạ', N'Tứ Hạ, Huế', N'Phường Tứ Hạ, Thị xã Hương Trà, Thừa Thiên Huế', 20454, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20455, N'Bình Tiến', N'xa', N'binh-tien', N'Xã Bình Tiến', N'Bình Tiến, Huế', N'Xã Bình Tiến, Thị xã Hương Trà, Thừa Thiên Huế', 20455, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20456, N'Hương Bình', N'xa', N'huong-binh', N'Xã Hương Bình', N'Hương Bình, Huế', N'Xã Hương Bình, Thị xã Hương Trà, Thừa Thiên Huế', 20456, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20457, N'Hương Thọ', N'xa', N'huong-tho', N'Xã Hương Thọ', N'Hương Thọ, Huế', N'Xã Hương Thọ, Thị xã Hương Trà, Thừa Thiên Huế', 20457, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20458, N'Hương Vinh', N'xa', N'huong-vinh', N'Xã Hương Vinh', N'Hương Vinh, Huế', N'Xã Hương Vinh, Thị xã Hương Trà, Thừa Thiên Huế', 20458, 523)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20459, N'Khe Tre', N'thi-tran', N'khe-tre', N'Trị trấn Khe Tre', N'Khe Tre, Huế', N'Trị trấn Khe Tre, Huyện Nam Đông, Thừa Thiên Huế', 20459, 524)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20460, N'Hương Lộc', N'xa', N'huong-loc', N'Xã Hương Lộc', N'Hương Lộc, Nam Đông, Thừa Thiên Huế', N'Xã Hương Lộc, Huyện Nam Đông, Thừa Thiên Huế', 20460, 524)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20461, N'Hương Sơn', N'xa', N'huong-son', N'Xã Hương Sơn', N'Hương Sơn, Nam Đông, Thừa Thiên Huế', N'Xã Hương Sơn, Huyện Nam Đông, Thừa Thiên Huế', 20461, 524)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20462, N'Thượng Lộ ', N'xa', N'thuong-lo', N'Xã Thượng Lộ', N'Thượng Lộ, Nam Đông, Thừa Thiên Huế', N'Xã Thượng Lộ, Huyện Nam Đông, Thừa Thiên Huế', 20462, 524)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20463, N'Thượng Nhật ', N'xa', N'thuong-nhat', N'Xã Thượng Nhật ', N'Thượng Nhật, Nam Đông, Thừa Thiên Huế', N'Xã Thượng Nhật, Huyện Nam Đông, Thừa Thiên Huế', 20463, 524)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20464, N'Thị trấn Phong Điền', N'thi-tran', N'phong-dien', N'Thị trấn Phong Điền', N'Phong Điền, Phong Điền, Thừa Thiên Huế', N'Thị trấn Phong Điền, Huyện Phong Điền, Thừa Thiên Huế', 20464, 525)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20465, N'Xã Điền Hoà', N'xa', N'dien-hoa', N'Xã Điền Hoà', N'Điền Hoà, Phong Điền, Thừa Thiên Huế', N'Xã Điền Hoà, Huyện Phong Điền, Thừa Thiên Huế', 20465, 525)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20466, N'Xã Điền Lộc', N'xa', N'dien-loc', N'Xã Điền Lộc', N'Điền Lộc, Phong Điền, Thừa Thiên Huế', N'Xã Điền Lộc, Huyện Phong Điền, Thừa Thiên Huế', 20466, 525)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20467, N'Xã Phong An', N'xa', N'phong-an', N'Xã Phong An', N'Phong An, Phong Điền, Thừa Thiên Huế', N'Xã Phong An, Huyện Phong Điền, Thừa Thiên Huế', 20467, 525)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20468, N'Xã Phong Chương', N'xa', N'phong-chuong', N'Xã Phong Chương', N'Phong Chương, Phong Điền, Thừa Thiên Huế', N'Xã Phong Chương, Huyện Phong Điền, Thừa Thiên Huế', 20468, 525)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20469, N'Thị trấn Lăng Cô', N'thi-tran', N'lang-co', N'Thị trấn Lăng Cô ', N'Lăng Cô, Phú Lộc, Thừa Thiên Huế', N'Thị trấn Lăng Cô, Huyện Phú Lộc, Thừa Thiên Huế', 20469, 526)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20470, N'Xã Giang Hải', N'xa', N'giang-hai', N'Xã Giang Hải', N'Giang Hải, Phú Lộc, Thừa Thiên Huế', N'Xã Giang Hải, Huyện Phú Lộc, Thừa Thiên Huế', 20470, 526)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20471, N'Xã Lộc Bình', N'xa ', N'loc-binh', N'Xã Lộc Bình', N'Lộc Bình, Phú Lộc, Thừa Thiên Huế', N'Xã Lộc Bình, Huyện Phú Lộc, Thừa Thiên Huế', 20471, 526)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20472, N'Xã Lộc Điền', N'xa', N'loc-dien', N'Xã Lộc Điền', N'Lộc Điền, Phú Lộc, Thừa Thiên Huế', N'Xã Lộc Điền, Huyện Phú Lộc, Thừa Thiên Huế', 20472, 526)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20473, N'Thị trấn Thuận An', N'thi-tran', N'thuan-an', N'Thị trấn Thuận An', N'Thuận An, Phú Vang, Thừa Thiên Huế', N'Thị trấn Thuận An, Huyện Phú Vang, Thừa Thiên Huế', 20473, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20474, N'Thị trấn Phú Đa', N'thi-tran', N'phu-da', N'Thị trấn Phú Đa', N'Phú Đa, Phú Vang, Thừa Thiên Huế', N'Thị trấn Phú Đa, Huyện Phú Vang, Thừa Thiên Huế', 20474, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20475, N'Xã Phú An', N'xa', N'phu-an', N'Xã Phú An', N'Phú An, Phú Vang, Thừa Thiên Huế', N'Xã Phú An, Huyện Phú Vang, Thừa Thiên Huế', 20475, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20476, N'Xã Phú Dương', N'xa', N'phu-duong', N'Xã Phú Dương', N'Phú Dương, Phú Vang, Thừa Thiên Huế', N'Xã Phú Dương, Huyện Phú Vang, Thừa Thiên Huế', 20476, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20477, N'Xã Phú Hải ', N'xa', N'phu-hai', N'Xã Phú Hải', N'Phú Hải, Phú Vang, Thừa Thiên Huế', N'Xã Phú Hải, Huyện Phú Vang, Thừa Thiên Huế', 20477, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20478, N'Xã Phú Lương', N'xa', N'phu-luong', N'Xã Phú Lương', N'Phú Lương, Phú Vang, Thừa Thiên Huế', N'Xã Phú Lương, Huyện Phú Vang, Thừa Thiên Huế', 20478, 527)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20479, N'Thị trấn Sịa', N'thi-tran', N'sia', N'Thị trấn Sịa', N'Sịa, Quảng Điền, Thừa Thiên Huế', N'Thị trấn Sịa, Huyện Quảng Điền, Thừa Thiên Huế', 20479, 528)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20480, N'Xã Quảng Công', N'xa', N'quang-cong', N'Xã Quảng Công', N'Quảng Công, Quảng Điền, Thừa Thiên Huế', N'Xã Quảng Công, Huyện Quảng Điền, Thừa Thiên Huế', 20480, 528)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20481, N'Xã Quảng Ngạn', N'xa', N'quang-ngan', N'Xã Quảng Ngạn', N'Quảng Ngạn, Quảng Điền, Thừa Thiên Huế', N'Xã Quảng Ngạn, Huyện Quảng Điền, Thừa Thiên Huế', 20481, 528)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20482, N'Xã Quảng Phước', N'xa', N'quang-phuoc', N'Xã Quảng Phước', N'Quảng Phước, Quảng Điền, Thừa Thiên Huế', N'Xã Quảng Phước, Huyện Quảng Điền, Thừa Thiên Huế', 20482, 528)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20483, N'Xã Quảng Thành', N'xa', N'quang-thanh', N'Xã Quảng Thành', N'Quảng Thành, Quảng Điền, Thừa Thiên Huế', N'Xã Quảng Thành, Huyện Quảng Điền, Thừa Thiên Huế', 20483, 528)
INSERT [xaphuong] ([id], [ten], [donvi], [tenkhongdau], [tendaydu], [tenthuong], [tenhanhchinh], [code], [id_quanhuyen]) VALUES (20484, N'Xã Quảng Vinh', N'xa', N'quang-vinh', N'Xã Quảng Vinh', N'Quảng Vinh, Quảng Điền, Thừa Thiên Huế', N'Xã Quảng Vinh, Huyện Quảng Điền, Thừa Thiên Huế', 20484, 528)
/****** Object:  Index [chitiethoadon_id_hoadon_foreign]    Script Date: 8/5/2021 9:57:36 AM ******/
CREATE NONCLUSTERED INDEX [chitiethoadon_id_hoadon_foreign] ON [chitiethoadon]
(
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [chitiethoadon_id_sanpham_foreign]    Script Date: 8/5/2021 9:57:36 AM ******/
CREATE NONCLUSTERED INDEX [chitiethoadon_id_sanpham_foreign] ON [chitiethoadon]
(
	[id_sanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [chitietsanpham_id_sanpham_foreign]    Script Date: 8/5/2021 9:57:36 AM ******/
CREATE NONCLUSTERED INDEX [chitietsanpham_id_sanpham_foreign] ON [chitietsanpham]
(
	[id_sanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [sanpham_id_loaisp_foreign]    Script Date: 8/5/2021 9:57:36 AM ******/
CREATE NONCLUSTERED INDEX [sanpham_id_loaisp_foreign] ON [sanpham]
(
	[id_loaisp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_hoadon] FOREIGN KEY([id_hoadon])
REFERENCES [hoadon] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_hoadon]
GO
ALTER TABLE [chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_sanpham] FOREIGN KEY([id_sanpham])
REFERENCES [sanpham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_sanpham]
GO
ALTER TABLE [chitietsanpham]  WITH CHECK ADD  CONSTRAINT [FK_chitietsanpham_sanpham] FOREIGN KEY([id_sanpham])
REFERENCES [sanpham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [chitietsanpham] CHECK CONSTRAINT [FK_chitietsanpham_sanpham]
GO
ALTER TABLE [sanpham]  WITH CHECK ADD  CONSTRAINT [FK_sanpham_loaisanpham] FOREIGN KEY([id_loaisp])
REFERENCES [loaisanpham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sanpham] CHECK CONSTRAINT [FK_sanpham_loaisanpham]
GO
USE [master]
GO
ALTER DATABASE [WebBanHang] SET  READ_WRITE 
GO
