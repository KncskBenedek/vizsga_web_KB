USE [vizsga]
GO
ALTER TABLE [dbo].[szavak] DROP CONSTRAINT [FK__szavak__temaId__286302EC]
GO
ALTER TABLE [dbo].[tema] DROP CONSTRAINT [DF__tema__timestamps__24927208]
GO
ALTER TABLE [dbo].[szavak] DROP CONSTRAINT [DF__szavak__timestam__276EDEB3]
GO
/****** Object:  Table [dbo].[tema]    Script Date: 2023. 05. 31. 13:37:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tema]') AND type in (N'U'))
DROP TABLE [dbo].[tema]
GO
/****** Object:  Table [dbo].[szavak]    Script Date: 2023. 05. 31. 13:37:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[szavak]') AND type in (N'U'))
DROP TABLE [dbo].[szavak]
GO
USE [master]
GO
/****** Object:  Database [vizsga]    Script Date: 2023. 05. 31. 13:37:20 ******/
DROP DATABASE [vizsga]
GO
/****** Object:  Database [vizsga]    Script Date: 2023. 05. 31. 13:37:20 ******/
CREATE DATABASE [vizsga]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vizsga', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\vizsga.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vizsga_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\vizsga_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [vizsga] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vizsga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vizsga] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vizsga] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vizsga] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vizsga] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vizsga] SET ARITHABORT OFF 
GO
ALTER DATABASE [vizsga] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vizsga] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vizsga] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vizsga] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vizsga] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vizsga] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vizsga] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vizsga] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vizsga] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vizsga] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vizsga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vizsga] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vizsga] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vizsga] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vizsga] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vizsga] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vizsga] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vizsga] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vizsga] SET  MULTI_USER 
GO
ALTER DATABASE [vizsga] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vizsga] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vizsga] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vizsga] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vizsga] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vizsga] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [vizsga] SET QUERY_STORE = OFF
GO
USE [vizsga]
GO
/****** Object:  Table [dbo].[szavak]    Script Date: 2023. 05. 31. 13:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[szavak](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[angol] [varchar](40) NULL,
	[magyar] [varchar](40) NULL,
	[temaId] [int] NULL,
	[timestamps] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tema]    Script Date: 2023. 05. 31. 13:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[temanev] [varchar](20) NOT NULL,
	[timestamps] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[szavak] ON 
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (1, N'apple', N'alma', 1, CAST(N'2023-05-31T10:48:44.947' AS DateTime))
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (2, N'grape', N'szőlő', 1, CAST(N'2023-05-31T10:48:44.950' AS DateTime))
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (3, N'pineapple', N'ananász', 1, CAST(N'2023-05-31T10:48:44.950' AS DateTime))
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (4, N'cabbage', N'káposzta', 2, CAST(N'2023-05-31T10:48:44.950' AS DateTime))
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (5, N'pepper', N'paprika', 2, CAST(N'2023-05-31T10:48:44.953' AS DateTime))
GO
INSERT [dbo].[szavak] ([id], [angol], [magyar], [temaId], [timestamps]) VALUES (6, N'tomato', N'paradicsom', 2, CAST(N'2023-05-31T10:48:44.957' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[szavak] OFF
GO
SET IDENTITY_INSERT [dbo].[tema] ON 
GO
INSERT [dbo].[tema] ([id], [temanev], [timestamps]) VALUES (1, N'gyümölcs', CAST(N'2023-05-31T10:45:26.403' AS DateTime))
GO
INSERT [dbo].[tema] ([id], [temanev], [timestamps]) VALUES (2, N'zöldség', CAST(N'2023-05-31T10:45:32.830' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tema] OFF
GO
ALTER TABLE [dbo].[szavak] ADD  DEFAULT (getdate()) FOR [timestamps]
GO
ALTER TABLE [dbo].[tema] ADD  DEFAULT (getdate()) FOR [timestamps]
GO
ALTER TABLE [dbo].[szavak]  WITH CHECK ADD FOREIGN KEY([temaId])
REFERENCES [dbo].[tema] ([id])
GO
USE [master]
GO
ALTER DATABASE [vizsga] SET  READ_WRITE 
GO
