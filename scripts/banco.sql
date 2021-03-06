USE [master]
GO
/****** Object:  Database [TesteConhecimento]    Script Date: 09/01/2015 14:34:20 ******/
CREATE DATABASE [TesteConhecimento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TesteConhecimento', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\TesteConhecimento.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TesteConhecimento_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\TesteConhecimento_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TesteConhecimento] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TesteConhecimento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TesteConhecimento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TesteConhecimento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TesteConhecimento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TesteConhecimento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TesteConhecimento] SET ARITHABORT OFF 
GO
ALTER DATABASE [TesteConhecimento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TesteConhecimento] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TesteConhecimento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TesteConhecimento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TesteConhecimento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TesteConhecimento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TesteConhecimento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TesteConhecimento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TesteConhecimento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TesteConhecimento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TesteConhecimento] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TesteConhecimento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TesteConhecimento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TesteConhecimento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TesteConhecimento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TesteConhecimento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TesteConhecimento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TesteConhecimento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TesteConhecimento] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TesteConhecimento] SET  MULTI_USER 
GO
ALTER DATABASE [TesteConhecimento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TesteConhecimento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TesteConhecimento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TesteConhecimento] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TesteConhecimento]
GO
/****** Object:  Schema [TesteSeusConhecimentos]    Script Date: 09/01/2015 14:34:20 ******/
CREATE SCHEMA [TesteSeusConhecimentos]
GO
/****** Object:  Table [TesteSeusConhecimentos].[UserData]    Script Date: 09/01/2015 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TesteSeusConhecimentos].[UserData](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_UserData] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

  /****** Object:  Table [TesteSeusConhecimentos].[EnterpriseData]    Script Date: 15/05/2018 13:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TesteSeusConhecimentos].[EnterpriseData](
	[IdEnterprise] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[ZipCode] [varchar](100) NULL,
	[CorporateActivity] [varchar](100) NULL,
 CONSTRAINT [PK_EnterpriseData] PRIMARY KEY CLUSTERED 
(
	[IdEnterprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

  /****** Object:  Table [TesteSeusConhecimentos].[RelationshipData]    Script Date: 15/05/2018 13:28:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TesteSeusConhecimentos].[RelationshipData](
	[IdRelationship] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EnterpriseId] [int] NOT NULL,
	FOREIGN KEY (UserId) REFERENCES TesteSeusConhecimentos.UserData(IdUser),
	FOREIGN KEY (EnterpriseId) REFERENCES TesteSeusConhecimentos.EnterpriseData(IdEnterprise),
 CONSTRAINT [PK_RelationshipData] PRIMARY KEY CLUSTERED 
(
	[IdRelationship] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [TesteConhecimento] SET  READ_WRITE 
GO
