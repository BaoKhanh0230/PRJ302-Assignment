USE [IS1903_Student]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[eid] [int] NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[managerid] [int] NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveForm]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveForm](
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[reason] [nvarchar](1000) NOT NULL,
	[status] [nvarchar](30) NOT NULL,
	[createdBy] [nvarchar](150) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[processedBy] [nvarchar](150) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LeaveForm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[username] [varchar](150) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/23/2025 3:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[eid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departments] ([did], [dname]) VALUES (1, N'IT')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (2, N'Marketing')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (3, N'Accounting')
INSERT [dbo].[Departments] ([did], [dname]) VALUES (4, N'Sales')
GO
INSERT [dbo].[Employees] ([eid], [ename], [managerid], [did]) VALUES (1, N'BaoKhanh', NULL, 1)
INSERT [dbo].[Employees] ([eid], [ename], [managerid], [did]) VALUES (2, N'Mr A', 1, 1)
INSERT [dbo].[Employees] ([eid], [ename], [managerid], [did]) VALUES (3, N'Mr B', 1, 1)
INSERT [dbo].[Employees] ([eid], [ename], [managerid], [did]) VALUES (4, N'MR C', 2, 1)
INSERT [dbo].[Employees] ([eid], [ename], [managerid], [did]) VALUES (5, N'MR D', 2, 1)
GO
INSERT [dbo].[Features] ([fid], [url]) VALUES (1, N'/user/list')
INSERT [dbo].[Features] ([fid], [url]) VALUES (2, N'/user/create')
INSERT [dbo].[Features] ([fid], [url]) VALUES (3, N'/user/update')
INSERT [dbo].[Features] ([fid], [url]) VALUES (4, N'/user/view')
INSERT [dbo].[Features] ([fid], [url]) VALUES (5, N'/user/approve')
INSERT [dbo].[Features] ([fid], [url]) VALUES (6, N'/user/approve2')
INSERT [dbo].[Features] ([fid], [url]) VALUES (7, N'/user/reject2')
INSERT [dbo].[Features] ([fid], [url]) VALUES (8, N'/user/update2')
GO
SET IDENTITY_INSERT [dbo].[LeaveForm] ON 

INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-04' AS Date), CAST(N'2025-03-05' AS Date), N'Em đi học!', N'Em đi học!', N'BaoKhanh', CAST(N'2025-03-04T18:30:32.320' AS DateTime), N'', 1)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-04' AS Date), CAST(N'2025-03-07' AS Date), N'Em đi chơi!', N'Approved', N'Mr A', CAST(N'2025-03-04T18:57:31.477' AS DateTime), N'', 2)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-06' AS Date), CAST(N'2025-03-08' AS Date), N'EM bị ốm!', N'Approved', N'MR C', CAST(N'2025-03-04T19:01:35.857' AS DateTime), N'BaoKhanh', 3)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-08' AS Date), CAST(N'2025-03-10' AS Date), N'abc', N'Rejected', N'Mr A', CAST(N'2025-03-08T11:19:11.060' AS DateTime), N'BaoKhanh', 4)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-08' AS Date), CAST(N'2025-03-08' AS Date), N'gg', N'Approved', N'Mr B', CAST(N'2025-03-08T11:21:21.737' AS DateTime), N'BaoKhanh', 5)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-04' AS Date), CAST(N'2025-03-05' AS Date), N'123', N'Approved', N'Mr A', CAST(N'2025-03-08T11:26:50.283' AS DateTime), N'BaoKhanh', 6)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-14' AS Date), CAST(N'2025-03-16' AS Date), N'alo1234', N'In progress', N'BaoKhanh', CAST(N'2025-03-12T09:38:36.990' AS DateTime), N'', 7)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-13' AS Date), CAST(N'2025-03-15' AS Date), N'Em xin nghỉ ốm!', N'Approved', N'Mr A', CAST(N'2025-03-13T16:03:39.950' AS DateTime), N'BaoKhanh', 8)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-28' AS Date), CAST(N'2025-03-28' AS Date), N'abc', N'Rejected', N'Mr A', CAST(N'2025-03-14T13:25:59.137' AS DateTime), N'BaoKhanh', 9)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-01' AS Date), CAST(N'2025-03-02' AS Date), N'', N'Approved', N'MR C', CAST(N'2025-03-14T13:27:21.683' AS DateTime), N'BaoKhanh', 10)
INSERT [dbo].[LeaveForm] ([from], [to], [reason], [status], [createdBy], [createdDate], [processedBy], [id]) VALUES (CAST(N'2025-03-17' AS Date), CAST(N'2025-03-18' AS Date), N'xzy', N'In progress', N'Mr A', CAST(N'2025-03-17T10:06:37.380' AS DateTime), N'', 11)
SET IDENTITY_INSERT [dbo].[LeaveForm] OFF
GO
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 6)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 7)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 8)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 5)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 6)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 7)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 8)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (4, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (4, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (4, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (4, 8)
GO
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (1, N'Division Leader')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (2, N'Department Manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (4, N'Staff')
GO
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'BaoKhanh', 1)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'mra', 2)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'mra', 4)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'mrb', 4)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'mrc', 4)
GO
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'BaoKhanh', N'123', N'BaoKhanh', 1)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mra', N'123', N'Mr A', 2)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrb', N'123', N'Mr B', 3)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrc', N'123', N'Mr C', 4)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrd', N'123', N'Mr D', 5)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'sonnt', N'123', N'SonNT', 1)
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Features]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
