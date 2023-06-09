USE [master]
GO
/****** Object:  Database [dbManagerShop]    Script Date: 3/13/2023 9:57:31 AM ******/
CREATE DATABASE [dbManagerShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbManagerShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbManagerShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbManagerShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbManagerShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbManagerShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbManagerShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbManagerShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbManagerShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbManagerShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbManagerShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbManagerShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbManagerShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbManagerShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbManagerShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbManagerShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbManagerShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbManagerShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbManagerShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbManagerShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbManagerShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbManagerShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbManagerShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbManagerShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbManagerShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbManagerShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbManagerShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbManagerShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbManagerShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbManagerShop] SET RECOVERY FULL 
GO
ALTER DATABASE [dbManagerShop] SET  MULTI_USER 
GO
ALTER DATABASE [dbManagerShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbManagerShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbManagerShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbManagerShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbManagerShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbManagerShop', N'ON'
GO
USE [dbManagerShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[idUser] [int] NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[idColor] [int] IDENTITY(1,1) NOT NULL,
	[valueColor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Color] PRIMARY KEY CLUSTERED 
(
	[idColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[idCustomer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[phoneNumber] [varchar](15) NOT NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailInvoiceReturn]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailInvoiceReturn](
	[idDetailInvoiceReturn] [int] IDENTITY(1,1) NOT NULL,
	[idInvoiceReturn] [int] NULL,
	[idPrDetails] [int] NULL,
	[quatity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetailInvoiceReturn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailsChangeProducts]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsChangeProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDetailsPr] [int] NULL,
	[idDetailsInvoiceChange] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailsInvoiceChange]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsInvoiceChange](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idInvoiceChangeProducts] [int] NULL,
	[idDetailsPr] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detailsInvoiceImportPr]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailsInvoiceImportPr](
	[idInvoice] [int] NOT NULL,
	[idPrDeltails] [int] NOT NULL,
	[quatity] [int] NULL,
	[status] [bit] NULL,
	[detailsInvoice] [int] IDENTITY(1,1) NOT NULL,
	[priceImport] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailsInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detailsInvoiceSELL]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailsInvoiceSELL](
	[idDetailsInvoiceSELL] [int] IDENTITY(1,1) NOT NULL,
	[idInvoiceSell] [int] NULL,
	[idPrDetails] [int] NULL,
	[quatity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetailsInvoiceSELL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detailsProduct]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[detailsProduct](
	[idPrDeltails] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NULL,
	[idSize] [int] NULL,
	[idColor] [int] NULL,
	[idMaterial] [int] NULL,
	[price] [money] NULL,
	[sku] [varchar](255) NULL,
	[quatity] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__detailsP] PRIMARY KEY CLUSTERED 
(
	[idPrDeltails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImageProducts]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProducts](
	[idImage] [int] IDENTITY(1,1) NOT NULL,
	[idPrDeltails] [int] NULL,
	[valueImage] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__ImagePro] PRIMARY KEY CLUSTERED 
(
	[idImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceChangeProducts]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceChangeProducts](
	[idInvoiceChangeProducts] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NULL,
	[idInvoiceSell] [int] NULL,
	[dateCreateInvoice] [datetime] NULL,
	[idUser] [int] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idInvoiceChangeProducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceImportPr]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceImportPr](
	[idInvoice] [int] IDENTITY(1,1) NOT NULL,
	[dateCreateInvoice] [datetime] NULL,
	[statusInvoice] [bit] NULL,
	[statusPay] [bit] NULL,
	[idAdmin] [int] NULL,
	[idSupplier] [int] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK__Invoice] PRIMARY KEY CLUSTERED 
(
	[idInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceReturn]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceReturn](
	[idInvoiceReturn] [int] IDENTITY(1,1) NOT NULL,
	[idInvoiceSell] [int] NULL,
	[idCustomer] [int] NULL,
	[description] [nvarchar](255) NULL,
	[totalReturn] [money] NULL,
	[idUser] [int] NULL,
	[dateCreateInvoice] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idInvoiceReturn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceSell]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceSell](
	[idInvoiceSell] [int] IDENTITY(1,1) NOT NULL,
	[idCustomer] [int] NULL,
	[idHumanSell] [int] NULL,
	[idVoucher] [int] NULL,
	[dateCreateInvoice] [datetime] NULL,
	[description] [nvarchar](255) NULL,
	[statusPay] [bit] NULL,
	[statusInvoice] [bit] NULL,
	[moneyCustom] [money] NULL,
	[moneyReturn] [money] NULL,
	[totalMoney] [money] NULL,
 CONSTRAINT [PK__InvoiceS] PRIMARY KEY CLUSTERED 
(
	[idInvoiceSell] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[List]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List](
	[idList] [int] IDENTITY(1,1) NOT NULL,
	[nameList] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__List] PRIMARY KEY CLUSTERED 
(
	[idList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Material]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[idMaterial] [int] IDENTITY(1,1) NOT NULL,
	[valueMaterial] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Material] PRIMARY KEY CLUSTERED 
(
	[idMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[idList] [int] NOT NULL,
	[nameProduct] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[statusDelete] [bit] NULL,
 CONSTRAINT [PK__Products] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idRole] [int] IDENTITY(0,1) NOT NULL,
	[valueRole] [nvarchar](20) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Size](
	[idSize] [int] IDENTITY(1,1) NOT NULL,
	[valueSize] [varchar](5) NOT NULL,
 CONSTRAINT [PK__Size] PRIMARY KEY CLUSTERED 
(
	[idSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[idSupplier] [int] IDENTITY(1,1) NOT NULL,
	[nameMaterial] [nvarchar](255) NOT NULL,
	[phoneNumber] [varchar](15) NOT NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK__Supplier] PRIMARY KEY CLUSTERED 
(
	[idSupplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[birthday] [date] NULL,
	[gender] [bit] NULL,
	[phoneNumber] [varchar](15) NULL,
	[email] [varchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[salary] [money] NULL,
	[role] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Voucher](
	[idVoucher] [int] IDENTITY(1,1) NOT NULL,
	[valueVoucher] [varchar](255) NULL,
	[value] [float] NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[quatity] [int] NULL,
 CONSTRAINT [PK__Voucher] PRIMARY KEY CLUSTERED 
(
	[idVoucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (2, N'nv001', N'nv001')
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (3, N'nv002', N'nv002')
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (4, N'nv003', N'nv003')
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (5, N'nv005', N'nv005')
INSERT [dbo].[Account] ([idUser], [username], [password]) VALUES (8, N'nv006', N'nv006')
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (4, N'Đen (Black)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (5, N'Xanh lam (Blue)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (6, N'Lục (Green)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (7, N'Lục lam (Cyan)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (8, N'Đỏ (Red)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (9, N'Hồng cánh sen (Magenta)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (10, N'Nâu (Brown)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (11, N'Xám sáng (Light Gray)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (12, N'Xám tối (Dark Gray)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (13, N'Xanh lam sáng (Light Blue)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (14, N'Lục sáng (Light Green)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (15, N'Lục lam sáng (Light Cyan)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (16, N'Đỏ sáng (Light Red)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (17, N'Hồng cánh sen sáng (Light Magenta)
')
INSERT [dbo].[Color] ([idColor], [valueColor]) VALUES (18, N'Vàng (Yellow)
')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (2, N'Trần Tiến Phát
', N'0790960173
', 1, N'Gia Lai
')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (3, N'Triệu Đăng Khoa
', N'0910950028
', 1, N'Hậu Giang
')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (5, N'Nguyễn Xuân An
', N'0790970163', 1, N'Ninh Bình')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (6, N'Cao Nguyễn Sơn Lâm', N'0790970162', 1, N'Hưng Yên')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (7, N'Bùi Tuấn Anh
', N'0340970036', 1, N'Quảng Ngãi')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (8, N'Trần Ngọc Hiếu
', N'0360970017
', 1, N'Sóc Trăng
')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (9, N'Phạm Thị Thảo Ly
', N'0421980089
', 0, N'Quảng Ngãi
')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (10, N'Vũ Thị Mến
', N'0341980141
', 0, N'Bến Tre
')
INSERT [dbo].[Customer] ([idCustomer], [name], [phoneNumber], [gender], [address]) VALUES (11, N'Huỳnh Thị Ngọc Thảo
', N'0681980082
', 0, N'Sơn La
')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[DetailInvoiceReturn] ON 

INSERT [dbo].[DetailInvoiceReturn] ([idDetailInvoiceReturn], [idInvoiceReturn], [idPrDetails], [quatity], [price]) VALUES (1, 1, 1, 1, 150000.0000)
SET IDENTITY_INSERT [dbo].[DetailInvoiceReturn] OFF
SET IDENTITY_INSERT [dbo].[DetailsChangeProducts] ON 

INSERT [dbo].[DetailsChangeProducts] ([id], [idDetailsPr], [idDetailsInvoiceChange], [quantity]) VALUES (1, 6, 1, 2)
INSERT [dbo].[DetailsChangeProducts] ([id], [idDetailsPr], [idDetailsInvoiceChange], [quantity]) VALUES (2, 1, 2, 2)
INSERT [dbo].[DetailsChangeProducts] ([id], [idDetailsPr], [idDetailsInvoiceChange], [quantity]) VALUES (3, 2, 2, 3)
INSERT [dbo].[DetailsChangeProducts] ([id], [idDetailsPr], [idDetailsInvoiceChange], [quantity]) VALUES (4, 4, 3, 1)
INSERT [dbo].[DetailsChangeProducts] ([id], [idDetailsPr], [idDetailsInvoiceChange], [quantity]) VALUES (5, 7, 4, 1)
SET IDENTITY_INSERT [dbo].[DetailsChangeProducts] OFF
SET IDENTITY_INSERT [dbo].[DetailsInvoiceChange] ON 

INSERT [dbo].[DetailsInvoiceChange] ([id], [idInvoiceChangeProducts], [idDetailsPr], [quantity]) VALUES (1, 1, 2, 1)
INSERT [dbo].[DetailsInvoiceChange] ([id], [idInvoiceChangeProducts], [idDetailsPr], [quantity]) VALUES (2, 2, 5, 12)
INSERT [dbo].[DetailsInvoiceChange] ([id], [idInvoiceChangeProducts], [idDetailsPr], [quantity]) VALUES (3, 3, 5, 1)
INSERT [dbo].[DetailsInvoiceChange] ([id], [idInvoiceChangeProducts], [idDetailsPr], [quantity]) VALUES (4, 4, 4, 1)
SET IDENTITY_INSERT [dbo].[DetailsInvoiceChange] OFF
SET IDENTITY_INSERT [dbo].[detailsInvoiceImportPr] ON 

INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (1, 1, 100, NULL, 1, 100000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (2, 2, 100, NULL, 2, 100000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (3, 3, 100, NULL, 3, 10000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (4, 5, 1000, NULL, 4, 1000000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (6, 4, 100, NULL, 5, 200000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (7, 3, 10, NULL, 6, 20000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (8, 6, 100, NULL, 7, 20000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (9, 6, 12, NULL, 8, 12000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (10, 7, 20, NULL, 9, 111111.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (11, 9, 20, NULL, 10, 12000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (12, 12, 10, NULL, 11, 80000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (12, 11, 9, NULL, 12, 80000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (12, 12, 12, NULL, 13, 80000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (13, 12, 1, NULL, 14, 90000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (13, 12, 3, NULL, 15, 50000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (13, 10, 12, NULL, 16, 30000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (14, 13, 1, NULL, 17, 80000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (15, 13, 100, NULL, 18, 10000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (15, 11, 10, NULL, 19, 10000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (16, 10, 1, NULL, 20, 90000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (17, 13, 10, NULL, 21, 10000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (17, 13, 10, NULL, 22, 10000.0000)
INSERT [dbo].[detailsInvoiceImportPr] ([idInvoice], [idPrDeltails], [quatity], [status], [detailsInvoice], [priceImport]) VALUES (18, 11, 100, NULL, 23, 10000.0000)
SET IDENTITY_INSERT [dbo].[detailsInvoiceImportPr] OFF
SET IDENTITY_INSERT [dbo].[detailsInvoiceSELL] ON 

INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (1, 1, 1, 1, 150000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (2, 2, 3, 10, 30000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (3, 3, 3, 1, 30000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (4, 3, 2, 1, 200000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (5, 4, 5, 100, 1299000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (6, 5, 5, 10, 1299000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (7, 6, 4, 1, 350000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (8, 7, 5, 800, 1299000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (9, 8, 12, 2, 99999.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (10, 8, 10, 2, 99999.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (11, 8, 5, 2, 1299000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (12, 8, 2, 2, 200000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (13, 9, 2, 1, 200000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (14, 10, 10, 10, 99999.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (15, 11, 12, 5, 99999.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (16, 12, 13, 10, 90000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (17, 13, 10, 1, 99999.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (18, 14, 13, 11, 90000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (19, 15, 6, 1, 100000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (20, 15, 5, 1, 1299000.0000)
INSERT [dbo].[detailsInvoiceSELL] ([idDetailsInvoiceSELL], [idInvoiceSell], [idPrDetails], [quatity], [price]) VALUES (21, 15, 11, 1, 99999.0000)
SET IDENTITY_INSERT [dbo].[detailsInvoiceSELL] OFF
SET IDENTITY_INSERT [dbo].[detailsProduct] ON 

INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (1, 5, 1, 4, 1, 150000.0000, NULL, 98, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (2, 4, 1, 5, 3, 200000.0000, NULL, 94, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (3, 3, 14, 5, 3, 30000.0000, NULL, 99, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (4, 2, 14, 12, 2, 350000.0000, NULL, 99, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (5, 1, 16, 4, 2, 1299000.0000, NULL, 100, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (6, 7, 1, 4, 1, 100000.0000, NULL, 109, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (7, 8, 1, 4, 1, 200000.0000, NULL, 19, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (9, 9, 1, 4, 1, 123456.0000, NULL, 20, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (10, 9, 5, 4, 1, 99999.0000, NULL, 0, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (11, 9, 6, 4, 1, 99999.0000, NULL, 118, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (12, 9, 6, 6, 1, 99999.0000, NULL, 19, 1)
INSERT [dbo].[detailsProduct] ([idPrDeltails], [idProduct], [idSize], [idColor], [idMaterial], [price], [sku], [quatity], [status]) VALUES (13, 8, 3, 4, 1, 90000.0000, NULL, 100, 1)
SET IDENTITY_INSERT [dbo].[detailsProduct] OFF
SET IDENTITY_INSERT [dbo].[InvoiceChangeProducts] ON 

INSERT [dbo].[InvoiceChangeProducts] ([idInvoiceChangeProducts], [idCustomer], [idInvoiceSell], [dateCreateInvoice], [idUser], [description]) VALUES (1, 3, 3, CAST(N'2023-03-08 08:14:18.000' AS DateTime), 1, N'')
INSERT [dbo].[InvoiceChangeProducts] ([idInvoiceChangeProducts], [idCustomer], [idInvoiceSell], [dateCreateInvoice], [idUser], [description]) VALUES (2, 3, 4, CAST(N'2023-03-08 08:17:35.000' AS DateTime), 1, N'')
INSERT [dbo].[InvoiceChangeProducts] ([idInvoiceChangeProducts], [idCustomer], [idInvoiceSell], [dateCreateInvoice], [idUser], [description]) VALUES (3, 11, 5, CAST(N'2023-03-09 20:24:41.000' AS DateTime), 1, N'')
INSERT [dbo].[InvoiceChangeProducts] ([idInvoiceChangeProducts], [idCustomer], [idInvoiceSell], [dateCreateInvoice], [idUser], [description]) VALUES (4, 6, 6, CAST(N'2023-03-09 20:29:14.000' AS DateTime), 1, N'')
SET IDENTITY_INSERT [dbo].[InvoiceChangeProducts] OFF
SET IDENTITY_INSERT [dbo].[InvoiceImportPr] ON 

INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (1, CAST(N'2023-03-07 19:50:21.000' AS DateTime), 1, 1, 1, 1, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (2, CAST(N'2023-03-07 19:56:24.000' AS DateTime), 1, 1, 1, 1, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (3, CAST(N'2023-03-07 19:56:48.000' AS DateTime), 1, 1, 1, 1, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (4, CAST(N'2023-03-07 20:22:57.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (6, CAST(N'2023-03-07 20:47:11.000' AS DateTime), 1, 1, 1, 2, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (7, CAST(N'2023-03-07 20:51:17.000' AS DateTime), 1, 1, 1, 1, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (8, CAST(N'2023-03-08 07:42:54.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (9, CAST(N'2023-03-08 07:43:31.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (10, CAST(N'2023-03-08 07:46:07.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (11, CAST(N'2023-03-08 08:50:19.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (12, CAST(N'2023-03-08 08:58:15.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (13, CAST(N'2023-03-08 09:01:31.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (14, CAST(N'2023-03-08 09:20:42.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (15, CAST(N'2023-03-09 21:35:37.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (16, CAST(N'2023-03-10 07:42:45.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (17, CAST(N'2023-03-10 14:30:24.000' AS DateTime), 1, 1, 1, 3, N'')
INSERT [dbo].[InvoiceImportPr] ([idInvoice], [dateCreateInvoice], [statusInvoice], [statusPay], [idAdmin], [idSupplier], [description]) VALUES (18, CAST(N'2023-03-11 14:01:34.000' AS DateTime), 1, 1, 1, 1, N'')
SET IDENTITY_INSERT [dbo].[InvoiceImportPr] OFF
SET IDENTITY_INSERT [dbo].[InvoiceReturn] ON 

INSERT [dbo].[InvoiceReturn] ([idInvoiceReturn], [idInvoiceSell], [idCustomer], [description], [totalReturn], [idUser], [dateCreateInvoice]) VALUES (1, 1, 3, N'tra hang', 150000.0000, 1, CAST(N'2023-03-07 20:00:54.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[InvoiceReturn] OFF
SET IDENTITY_INSERT [dbo].[InvoiceSell] ON 

INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (1, 3, 1, NULL, CAST(N'2023-03-07 19:52:48.000' AS DateTime), N'', 1, 1, 200000.0000, 50000.0000, 150000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (2, 2, 1, NULL, CAST(N'2023-03-07 19:59:36.000' AS DateTime), N'', 1, 1, 300000.0000, 0.0000, 300000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (3, 3, 1, NULL, CAST(N'2023-03-07 20:01:40.000' AS DateTime), N'', 1, 1, 250000.0000, 20000.0000, 230000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (4, 3, 1, NULL, CAST(N'2023-03-07 20:30:04.000' AS DateTime), N'', 1, 1, 130000000.0000, 100000.0000, 129900000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (5, 11, 1, NULL, CAST(N'2023-03-08 07:31:55.000' AS DateTime), N'', 1, 1, 13000000.0000, 10000.0000, 12990000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (6, 6, 2, NULL, CAST(N'2023-03-08 07:34:19.000' AS DateTime), N'', 1, 1, 400000.0000, 50000.0000, 350000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (7, 7, 1, NULL, CAST(N'2023-03-08 09:03:21.000' AS DateTime), N'', 1, 1, 1040000000.0000, 800000.0000, 1039200000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (8, 11, 1, NULL, CAST(N'2023-03-09 20:17:17.000' AS DateTime), N'', 1, 1, 3500000.0000, 441803.5000, 3397996.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (9, 7, 1, NULL, CAST(N'2023-03-09 20:37:19.000' AS DateTime), N'', 1, 1, 200000.0000, 20000.0000, 200000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (10, 9, 1, 1, CAST(N'2023-03-09 20:42:33.000' AS DateTime), N'', 1, 1, 1000000.0000, 100009.0000, 999990.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (11, 11, 1, 1, CAST(N'2023-03-09 20:56:33.000' AS DateTime), N'', 1, 1, 500000.0000, 50004.5000, 499995.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (12, 7, 1, NULL, CAST(N'2023-03-09 21:37:10.000' AS DateTime), N'', 1, 1, 1000000.0000, 190000.0000, 900000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (13, 11, 1, NULL, CAST(N'2023-03-10 07:43:03.000' AS DateTime), N'', 1, 1, 100000.0000, 10000.8984, 99999.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (14, 8, 1, NULL, CAST(N'2023-03-10 20:50:38.000' AS DateTime), N'', 1, 1, 1000000.0000, 109000.0000, 990000.0000)
INSERT [dbo].[InvoiceSell] ([idInvoiceSell], [idCustomer], [idHumanSell], [idVoucher], [dateCreateInvoice], [description], [statusPay], [statusInvoice], [moneyCustom], [moneyReturn], [totalMoney]) VALUES (15, 8, 1, NULL, CAST(N'2023-03-11 12:48:57.000' AS DateTime), N'', 1, 1, 1500000.0000, 150900.8750, 1498999.0000)
SET IDENTITY_INSERT [dbo].[InvoiceSell] OFF
SET IDENTITY_INSERT [dbo].[List] ON 

INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (1, N'Giày thể thao', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (2, N'Giày búp bê', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (3, N'Dép xỏ ngón', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (4, N'Giày da', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (5, N'Giày trẻ em', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (6, N'Dép trẻ em', 1)
INSERT [dbo].[List] ([idList], [nameList], [status]) VALUES (7, N'Dép', 1)
SET IDENTITY_INSERT [dbo].[List] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([idMaterial], [valueMaterial]) VALUES (1, N'Vải')
INSERT [dbo].[Material] ([idMaterial], [valueMaterial]) VALUES (2, N'Da')
INSERT [dbo].[Material] ([idMaterial], [valueMaterial]) VALUES (3, N'chất liệu tổng hợp')
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (1, 1, N'Giày Thể Thao 1', N'Giày đẹp thời trang', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (2, 2, N'Giày búp bê 1', N'Giày xinh dành cho phái nữ', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (3, 3, N'Dép xỏ ngón', N'Mang lại cảm giác thoải mái', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (4, 5, N'Giày trẻ em 1', N'Nâng niu đôi chân trẻ', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (5, 6, N'Dép trẻ em 1 ', N'Dép giá rẻ', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (6, 5, N'Giày du mục', N'Tăng tốc độ ', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (7, 1, N'Dép tổ ong', N'', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (8, 2, N'Giày kiên cường', NULL, 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (9, 1, N'giày da báo', N'', 1, 1)
INSERT [dbo].[Products] ([idProduct], [idList], [nameProduct], [description], [status], [statusDelete]) VALUES (10, 1, N'Giày Thể Thao 1', N'', 1, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([idRole], [valueRole], [description]) VALUES (0, N'Nhân viên', NULL)
INSERT [dbo].[Role] ([idRole], [valueRole], [description]) VALUES (1, N'Quản lý', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (1, N'25')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (2, N'26')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (3, N'27')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (4, N'28')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (5, N'29')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (6, N'30')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (7, N'31')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (8, N'32')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (9, N'33')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (10, N'34')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (11, N'35')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (12, N'36')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (13, N'37')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (14, N'38')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (15, N'39')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (16, N'40')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (17, N'41')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (18, N'42')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (19, N'43')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (20, N'44')
INSERT [dbo].[Size] ([idSize], [valueSize]) VALUES (21, N'45')
SET IDENTITY_INSERT [dbo].[Size] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([idSupplier], [nameMaterial], [phoneNumber], [address]) VALUES (1, N'chợ đầu mối', N'0345633333', N'Chợ Lớn, HCM')
INSERT [dbo].[Supplier] ([idSupplier], [nameMaterial], [phoneNumber], [address]) VALUES (2, N'Bitis', N'0966158666', N'quận 6, Thành phố Hồ Chí Minh')
INSERT [dbo].[Supplier] ([idSupplier], [nameMaterial], [phoneNumber], [address]) VALUES (3, N'Nike', N'02838235241', N'Tầng 12, Tòa Nhà Metropolitan, 235 Đường Đồng Khởi, Phường Bến Nghé, Quận 1, Thành Phố Hồ Chí Minh, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (1, N'Đinh Thành Được', CAST(N'2001-10-30' AS Date), 1, N'0394297048', N'email@gmail.com', N'HCM', 9999999.0000, 1, 1)
INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (2, N'Nguyen Van A', CAST(N'2001-03-06' AS Date), 1, N'0812207148', N'zdbluez@gmail.com', N'HCM', 8000000.0000, 0, 1)
INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (3, N'Nguyen Van B', CAST(N'2000-03-07' AS Date), 1, N'07230056789', N'email3@gmail.com', N'HN', 7000000.0000, 0, 0)
INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (4, N'Le Van C', CAST(N'1998-09-07' AS Date), 0, N'0365125425', N'zzdream10@gmail.com', N'HCM', 8000000.0000, 0, 1)
INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (5, N'nguyen van b', CAST(N'2000-03-10' AS Date), 1, N'0390000000', N'ajksdja@gmail.com', N'', 9000000.0000, 0, 0)
INSERT [dbo].[User] ([idUser], [name], [birthday], [gender], [phoneNumber], [email], [address], [salary], [role], [status]) VALUES (8, N'nguyen van c', CAST(N'2000-03-11' AS Date), 1, N'0394297047', N'email1234@gmail.com', N'', 8888888.0000, 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([idVoucher], [valueVoucher], [value], [dateStart], [dateEnd], [quatity]) VALUES (1, N'ZuOW0IuN', 10, CAST(N'2023-03-10' AS Date), CAST(N'2023-03-30' AS Date), 999998)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
ALTER TABLE [dbo].[InvoiceImportPr] ADD  CONSTRAINT [df_statusInvoice]  DEFAULT ((1)) FOR [statusInvoice]
GO
ALTER TABLE [dbo].[InvoiceImportPr] ADD  CONSTRAINT [df_statusPay]  DEFAULT ((1)) FOR [statusPay]
GO
ALTER TABLE [dbo].[InvoiceSell] ADD  CONSTRAINT [df_statusPaySell]  DEFAULT ((1)) FOR [statusPay]
GO
ALTER TABLE [dbo].[InvoiceSell] ADD  CONSTRAINT [df_statusInvoiceSell]  DEFAULT ((1)) FOR [statusInvoice]
GO
ALTER TABLE [dbo].[List] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [statusDelete]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__idUser] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__idUser]
GO
ALTER TABLE [dbo].[DetailInvoiceReturn]  WITH CHECK ADD FOREIGN KEY([idDetailInvoiceReturn])
REFERENCES [dbo].[InvoiceReturn] ([idInvoiceReturn])
GO
ALTER TABLE [dbo].[DetailInvoiceReturn]  WITH CHECK ADD FOREIGN KEY([idPrDetails])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[DetailsChangeProducts]  WITH CHECK ADD FOREIGN KEY([idDetailsInvoiceChange])
REFERENCES [dbo].[DetailsInvoiceChange] ([id])
GO
ALTER TABLE [dbo].[DetailsChangeProducts]  WITH CHECK ADD FOREIGN KEY([idDetailsPr])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[DetailsInvoiceChange]  WITH CHECK ADD FOREIGN KEY([idDetailsPr])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[DetailsInvoiceChange]  WITH CHECK ADD FOREIGN KEY([idInvoiceChangeProducts])
REFERENCES [dbo].[InvoiceChangeProducts] ([idInvoiceChangeProducts])
GO
ALTER TABLE [dbo].[detailsInvoiceImportPr]  WITH CHECK ADD  CONSTRAINT [FK__detailsIn__idInv] FOREIGN KEY([idInvoice])
REFERENCES [dbo].[InvoiceImportPr] ([idInvoice])
GO
ALTER TABLE [dbo].[detailsInvoiceImportPr] CHECK CONSTRAINT [FK__detailsIn__idInv]
GO
ALTER TABLE [dbo].[detailsInvoiceImportPr]  WITH CHECK ADD  CONSTRAINT [FK__detailsIn__idPrD] FOREIGN KEY([idPrDeltails])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[detailsInvoiceImportPr] CHECK CONSTRAINT [FK__detailsIn__idPrD]
GO
ALTER TABLE [dbo].[detailsInvoiceSELL]  WITH CHECK ADD FOREIGN KEY([idInvoiceSell])
REFERENCES [dbo].[InvoiceSell] ([idInvoiceSell])
GO
ALTER TABLE [dbo].[detailsInvoiceSELL]  WITH CHECK ADD FOREIGN KEY([idPrDetails])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[detailsProduct]  WITH CHECK ADD  CONSTRAINT [FK__detailsPr__idCol] FOREIGN KEY([idColor])
REFERENCES [dbo].[Color] ([idColor])
GO
ALTER TABLE [dbo].[detailsProduct] CHECK CONSTRAINT [FK__detailsPr__idCol]
GO
ALTER TABLE [dbo].[detailsProduct]  WITH CHECK ADD  CONSTRAINT [FK__detailsPr__idMat] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO
ALTER TABLE [dbo].[detailsProduct] CHECK CONSTRAINT [FK__detailsPr__idMat]
GO
ALTER TABLE [dbo].[detailsProduct]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[Products] ([idProduct])
GO
ALTER TABLE [dbo].[detailsProduct]  WITH CHECK ADD  CONSTRAINT [FK__detailsPr__idSiz] FOREIGN KEY([idSize])
REFERENCES [dbo].[Size] ([idSize])
GO
ALTER TABLE [dbo].[detailsProduct] CHECK CONSTRAINT [FK__detailsPr__idSiz]
GO
ALTER TABLE [dbo].[ImageProducts]  WITH CHECK ADD  CONSTRAINT [FK__ImageProd__idPrD] FOREIGN KEY([idPrDeltails])
REFERENCES [dbo].[detailsProduct] ([idPrDeltails])
GO
ALTER TABLE [dbo].[ImageProducts] CHECK CONSTRAINT [FK__ImageProd__idPrD]
GO
ALTER TABLE [dbo].[InvoiceChangeProducts]  WITH CHECK ADD FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[InvoiceChangeProducts]  WITH CHECK ADD FOREIGN KEY([idInvoiceSell])
REFERENCES [dbo].[InvoiceSell] ([idInvoiceSell])
GO
ALTER TABLE [dbo].[InvoiceChangeProducts]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[InvoiceImportPr]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceIm__idAdm] FOREIGN KEY([idAdmin])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[InvoiceImportPr] CHECK CONSTRAINT [FK__InvoiceIm__idAdm]
GO
ALTER TABLE [dbo].[InvoiceImportPr]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceIm__idSup] FOREIGN KEY([idSupplier])
REFERENCES [dbo].[Supplier] ([idSupplier])
GO
ALTER TABLE [dbo].[InvoiceImportPr] CHECK CONSTRAINT [FK__InvoiceIm__idSup]
GO
ALTER TABLE [dbo].[InvoiceReturn]  WITH CHECK ADD FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[InvoiceReturn]  WITH CHECK ADD FOREIGN KEY([idInvoiceSell])
REFERENCES [dbo].[InvoiceSell] ([idInvoiceSell])
GO
ALTER TABLE [dbo].[InvoiceReturn]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[InvoiceSell]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceSe__idHum] FOREIGN KEY([idHumanSell])
REFERENCES [dbo].[User] ([idUser])
GO
ALTER TABLE [dbo].[InvoiceSell] CHECK CONSTRAINT [FK__InvoiceSe__idHum]
GO
ALTER TABLE [dbo].[InvoiceSell]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceSe__idVou] FOREIGN KEY([idVoucher])
REFERENCES [dbo].[Voucher] ([idVoucher])
GO
ALTER TABLE [dbo].[InvoiceSell] CHECK CONSTRAINT [FK__InvoiceSe__idVou]
GO
ALTER TABLE [dbo].[InvoiceSell]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceSe__statu] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[InvoiceSell] CHECK CONSTRAINT [FK__InvoiceSe__statu]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__idList] FOREIGN KEY([idList])
REFERENCES [dbo].[List] ([idList])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__idList]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__Role__id] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([idRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__Role__id]
GO
/****** Object:  StoredProcedure [dbo].[PRDelete]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PRDelete]
@idPrDetails INT
AS
BEGIN TRY
	BEGIN TRAN
	DELETE dbo.ImageProducts
	WHERE idPrDeltails IN (SELECT idPrDeltails FROM dbo.ImageProducts WHERE @idPrDetails = idPrDeltails)
	DELETE dbo.detailsProduct
	WHERE idPrDeltails IN (SELECT idPrDeltails FROM dbo.detailsProduct WHERE @idPrDetails = idPrDeltails)
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[sp_Quantity]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Quantity]
AS
BEGIN
    SELECT name , iIF(gender = 0, N'Nữ', 'Nam') gender , phoneNumber, SUM(quatity) SumBuy FROM dbo.Customer JOIN dbo.InvoiceSell ON InvoiceSell.idCustomer = Customer.idCustomer
JOIN dbo.detailsInvoiceSELL ON detailsInvoiceSELL.idInvoiceSell = InvoiceSell.idInvoiceSell
GROUP BY name,
         gender,
         phoneNumber
END

GO
/****** Object:  StoredProcedure [dbo].[sp_revenue]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_revenue]
(@year int)
AS
BEGIN
	SELECT MONTH(InvoiceSell.dateCreateInvoice) MonthDate , SUM(detailsInvoiceSELL.quatity) quantity,
	CAST(SUM(detailsInvoiceSELL.price * detailsInvoiceSELL.quatity) AS INT)
	 totalSell, 
	 CAST(SUM(totalReturn) AS INT )
	  totalReturn, 
	  CAST(SUM(detailsInvoiceSELL.price * detailsInvoiceSELL.quatity) - SUM(totalReturn) AS INT)
	revenue
	FROM dbo.detailsInvoiceSELL  
	JOIN dbo.InvoiceSell ON InvoiceSell.idInvoiceSell = detailsInvoiceSELL.idInvoiceSell
	LEFT JOIN dbo.InvoiceReturn ON InvoiceReturn.idInvoiceSell = InvoiceSell.idInvoiceSell
	WHERE YEAR(InvoiceSell.dateCreateInvoice) = @year
	GROUP BY MONTH(InvoiceSell.dateCreateInvoice)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_statistical]    Script Date: 3/13/2023 9:57:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_statistical]
(@year INT, @month int)
AS
	BEGIN
	SELECT Products.idProduct  idProduct,nameProduct nameProduct, Sum(detailsInvoiceSELL.quatity) quantitySell  FROM dbo.detailsProduct 
	JOIN dbo.detailsInvoiceSELL ON detailsInvoiceSELL.idPrDetails = detailsProduct.idPrDeltails
	JOIN dbo.InvoiceSell ON InvoiceSell.idInvoiceSell = detailsInvoiceSELL.idInvoiceSell
	JOIN dbo.Products ON Products.idProduct = detailsProduct.idProduct
	WHERE YEAR(dateCreateInvoice) = @year AND MONTH(dateCreateInvoice) = @month
	GROUP BY Products.idProduct, nameProduct
	ORDER BY quantitySell DESC
END;

GO
USE [master]
GO
ALTER DATABASE [dbManagerShop] SET  READ_WRITE 
GO
