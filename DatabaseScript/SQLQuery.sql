USE [master]
GO
/****** Object:  Database [IyaElepoDB]    Script Date: 15/12/2021 01:55:41 ******/
CREATE DATABASE [IyaElepoDB]
 
GO

USE [IyaElepoDB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](300) NOT NULL,
	[CustomerTypeID] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[ContactPerson] [nvarchar](150) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTypes](
	[CustomerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerTypes] PRIMARY KEY CLUSTERED 
(
	[CustomerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[Picture] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[ProductSaleID] [bigint] IDENTITY(1,1) NOT NULL,
	[SalesDate] [datetime] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[QuantityInLitres] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_ProductSales] PRIMARY KEY CLUSTERED 
(
	[ProductSaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSuppliers]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSuppliers](
	[ProductSupplierID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductSupplierName] [nvarchar](300) NOT NULL,
	[OfficeAddress] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[ContactPerson] [nvarchar](150) NULL,
 CONSTRAINT [PK_ProductSuppliers] PRIMARY KEY CLUSTERED 
(
	[ProductSupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSupplies]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSupplies](
	[SupplyID] [bigint] IDENTITY(1,1) NOT NULL,
	[SupplyDate] [datetime] NOT NULL,
	[ProductSupplierID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[QuantityInLitres] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductSupplies] PRIMARY KEY CLUSTERED 
(
	[SupplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 15/12/2021 01:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerTypeID], [Address], [Email], [PhoneNumber], [ContactPerson]) VALUES (1, N'Daniel Igwe', 1, N'14 Alafia Street Ejigbo Lagos', N'danieligwe@yahoo.com', N'7874847847847', NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerName], [CustomerTypeID], [Address], [Email], [PhoneNumber], [ContactPerson]) VALUES (2, N'MUYIK SOFTWARE COMPANY', 2, N'14 Thierry Henry Close London', N'info@muyik.com', N'6486847847484', N'MR. BENJAMIN MUYIK')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerTypes] ON 
GO
INSERT [dbo].[CustomerTypes] ([CustomerTypeID], [CustomerTypeName]) VALUES (2, N'Corporate')
GO
INSERT [dbo].[CustomerTypes] ([CustomerTypeID], [CustomerTypeName]) VALUES (1, N'Individual')
GO
SET IDENTITY_INSERT [dbo].[CustomerTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductTypeID], [Picture]) VALUES (1, N'Kerosene', 2, NULL)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductTypeID], [Picture]) VALUES (2, N'Togal Motor Oil SE Lubricant', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSales] ON 
GO
INSERT [dbo].[ProductSales] ([ProductSaleID], [SalesDate], [CustomerID], [ProductID], [QuantityInLitres]) VALUES (1, CAST(N'2021-12-10T00:00:00.000' AS DateTime), 1, 1, CAST(12 AS Decimal(18, 0)))
GO
INSERT [dbo].[ProductSales] ([ProductSaleID], [SalesDate], [CustomerID], [ProductID], [QuantityInLitres]) VALUES (2, CAST(N'2021-12-14T00:00:00.000' AS DateTime), 2, 2, CAST(32 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ProductSales] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSuppliers] ON 
GO
INSERT [dbo].[ProductSuppliers] ([ProductSupplierID], [ProductSupplierName], [OfficeAddress], [Email], [PhoneNumber], [ContactPerson]) VALUES (1, N'Demoteach Lubricants Ltd', N'24 Macron Close Lekki', N'demoltd@yahoo.com', N'78787878787', N'Imaya Daniel')
GO
INSERT [dbo].[ProductSuppliers] ([ProductSupplierID], [ProductSupplierName], [OfficeAddress], [Email], [PhoneNumber], [ContactPerson]) VALUES (2, N'TOGAL NIGERIA LTD', N'25 Machuke Close Mushin', N'togalltd@gmail.com', N'6863863863836', N'Ms. Rosemary')
GO
SET IDENTITY_INSERT [dbo].[ProductSuppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSupplies] ON 
GO
INSERT [dbo].[ProductSupplies] ([SupplyID], [SupplyDate], [ProductSupplierID], [ProductID], [QuantityInLitres]) VALUES (1, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 1, 2, CAST(56.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[ProductSupplies] ([SupplyID], [SupplyDate], [ProductSupplierID], [ProductID], [QuantityInLitres]) VALUES (2, CAST(N'2021-12-04T00:00:00.000' AS DateTime), 2, 1, CAST(78.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[ProductSupplies] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 
GO
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName]) VALUES (2, N'Fuel')
GO
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName]) VALUES (1, N'Lubricants')
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CustomerTypes]    Script Date: 15/12/2021 01:55:42 ******/
ALTER TABLE [dbo].[CustomerTypes] ADD  CONSTRAINT [IX_CustomerTypes] UNIQUE NONCLUSTERED 
(
	[CustomerTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products]    Script Date: 15/12/2021 01:55:42 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [IX_Products] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductTypes]    Script Date: 15/12/2021 01:55:42 ******/
ALTER TABLE [dbo].[ProductTypes] ADD  CONSTRAINT [IX_ProductTypes] UNIQUE NONCLUSTERED 
(
	[ProductTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerTypes] FOREIGN KEY([CustomerTypeID])
REFERENCES [dbo].[CustomerTypes] ([CustomerTypeID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerTypes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSales_Customers]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSales_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSales_Products]
GO
ALTER TABLE [dbo].[ProductSupplies]  WITH CHECK ADD  CONSTRAINT [FK_ProductSupplies_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductSupplies] CHECK CONSTRAINT [FK_ProductSupplies_Products]
GO
ALTER TABLE [dbo].[ProductSupplies]  WITH CHECK ADD  CONSTRAINT [FK_ProductSupplies_ProductSuppliers] FOREIGN KEY([ProductSupplierID])
REFERENCES [dbo].[ProductSuppliers] ([ProductSupplierID])
GO
ALTER TABLE [dbo].[ProductSupplies] CHECK CONSTRAINT [FK_ProductSupplies_ProductSuppliers]
GO
USE [master]
GO
ALTER DATABASE [IyaElepoDB] SET  READ_WRITE 
GO
