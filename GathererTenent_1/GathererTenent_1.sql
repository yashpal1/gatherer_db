USE [GathererTenent_1]
GO
/****** Object:  Table [dbo].[tbl_PermissionDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_PermissionDetail]
GO
/****** Object:  Table [dbo].[tbl_Permission]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_Permission]
GO
/****** Object:  Table [dbo].[tbl_MenuDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_MenuDetail]
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_Menu]
GO
/****** Object:  Table [dbo].[tbl_Investments]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_Investments]
GO
/****** Object:  Table [dbo].[tbl_ExpensesHeadsDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_ExpensesHeadsDetail]
GO
/****** Object:  Table [dbo].[tbl_ExpensesHeads]    Script Date: 5/13/2017 11:17:04 AM ******/
DROP TABLE [dbo].[tbl_ExpensesHeads]
GO
/****** Object:  Table [dbo].[tbl_ExpensesHeads]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ExpensesHeads](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExpenseName] [varchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ExpensesHeadsDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ExpensesHeadsDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExpensesHeadId] [bigint] NULL,
	[Jan] [decimal](28, 4) NULL,
	[feb] [decimal](28, 4) NULL,
	[mar] [decimal](28, 4) NULL,
	[apr] [decimal](28, 4) NULL,
	[may] [decimal](28, 4) NULL,
	[jun] [decimal](28, 4) NULL,
	[jul] [decimal](28, 4) NULL,
	[aug] [decimal](28, 4) NULL,
	[sep] [decimal](28, 4) NULL,
	[oct] [decimal](28, 4) NULL,
	[nov] [decimal](28, 4) NULL,
	[dec] [decimal](28, 4) NULL,
	[FinancialYear] [decimal](28, 4) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Investments]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Investments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvestmentName] [varchar](200) NULL,
	[UserId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[SubmittionDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[id] [bigint] NULL,
	[MenuName] [varchar](200) NULL,
	[URL] [varchar](200) NULL,
	[Status] [int] NULL,
	[MenuOrder] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_MenuDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuDetail](
	[id] [bigint] NULL,
	[fk_MenuId] [bigint] NULL,
	[fk_PermissionId] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Permission]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Permission](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](200) NULL,
	[Description] [varchar](500) NULL,
	[URL] [nvarchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PermissionDetail]    Script Date: 5/13/2017 11:17:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PermissionDetail](
	[id] [bigint] NULL,
	[fk_PermissionId] [bigint] NULL,
	[fk_LoginId] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ExpensesHeads] ON 

GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (1, N'Frequency', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (2, N'Base and Other Costs', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (3, N'Performance Fees', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (4, N'Check', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (5, N'Operational', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (6, N'Property Operating', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (7, N'Transactional', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (8, N'Futures', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (9, N'Market Impact', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (10, N'Foreign Exchange - Spot', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (11, N'Foreign Exchange - Other', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (12, N'OTC Derivatives', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (13, N'Securities Lending', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (14, N'Leverage', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (15, N'Buy/Sell', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (16, N'percentage of product
', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (17, N'Currency', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (18, N'Gross Base Fee', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (19, N'Base fee rebates ', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (20, N'Net Base fees', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (21, N'Trustee/Admin/Other Costs', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (22, N'Performance fee rebates (as negatives)', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (23, N'Net Performance  fees', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (24, N'Opening Balance', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (25, N'Change in Performance Fees Accrued', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (26, N'Closing Balance', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (27, N'Property', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (28, N'Transaction', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (29, N'Foreign Exchange', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (30, N'Leverage / Borrowing ', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[tbl_ExpensesHeads] ([ID], [ExpenseName], [Description], [CreatedDate], [ModifiedDate], [Status]) VALUES (31, N'Buy/Sell Spread', NULL, CAST(0x0000A77100C33904 AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_ExpensesHeads] OFF
GO
