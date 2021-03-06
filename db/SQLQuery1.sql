USE [master]
GO
/****** Object:  Database [TokenShop]    Script Date: 12/25/2018 12:31:01 ب.ظ ******/
CREATE DATABASE [TokenShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TokenShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TokenShop.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TokenShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TokenShop_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TokenShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TokenShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TokenShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TokenShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TokenShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TokenShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TokenShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [TokenShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TokenShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TokenShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TokenShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TokenShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TokenShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TokenShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TokenShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TokenShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TokenShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TokenShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TokenShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TokenShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TokenShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TokenShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TokenShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TokenShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TokenShop] SET RECOVERY FULL 
GO
ALTER DATABASE [TokenShop] SET  MULTI_USER 
GO
ALTER DATABASE [TokenShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TokenShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TokenShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TokenShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TokenShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TokenShop', N'ON'
GO
USE [TokenShop]
GO
/****** Object:  UserDefinedFunction [dbo].[getTokenCount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getTokenCount] 
(
@CustomerId bigint
)
RETURNS  bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sum_out bigint
	DECLARE @sum_in bigint

	set @sum_in=COALESCE((select sum([count]) from CustomerToken where CustomerId=@CustomerId  and action=1 ),0) 
	set @sum_out=COALESCE((select sum([count]) from CustomerToken where CustomerId=@CustomerId  and action=2 ),0) 

	RETURN @sum_in-@sum_out

END

GO
/****** Object:  Table [dbo].[AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcctionLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AcctionName] [nvarchar](50) NULL,
	[ModifyDate] [date] NULL,
	[Description] [nvarchar](500) NULL,
	[ModuleId] [int] NULL,
 CONSTRAINT [PK_AcctionLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[Status] [int] NULL,
	[CardNumber] [nvarchar](50) NULL,
	[Sheba] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[BankId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankReceipt](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](50) NULL,
	[ReceiptNumber] [nvarchar](50) NULL,
	[Amount] [bigint] NULL,
	[PayDate] [datetime] NULL,
	[UserId] [int] NULL,
	[CustomerId] [bigint] NULL,
	[Statuse] [int] NULL,
	[ReciptType] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[BankAccountId] [bigint] NULL,
	[OrderId] [bigint] NULL,
	[Attachment] [nvarchar](50) NULL DEFAULT (NULL),
 CONSTRAINT [PK_BankReceipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[CustomerId] [bigint] NULL,
	[PayDate] [datetime] NULL,
	[Amount] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[TrackingCode] [nvarchar](50) NULL,
	[GatewayId] [int] NULL,
	[ReceptionNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_BankTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[Ip] [nvarchar](50) NULL,
	[Read] [bit] NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[NationalCode] [nvarchar](50) NULL,
	[RegisterDate] [datetime] NULL,
	[BirthDate] [datetime] NULL,
	[Country] [int] NULL,
	[State] [int] NULL,
	[City] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[WebAddress] [nvarchar](250) NULL,
	[ImageAddress] [nvarchar](250) NULL,
	[PasswordResetHash] [nvarchar](150) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerToken](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[CustomerId] [bigint] NULL,
	[Count] [bigint] NULL,
	[RialPrice] [bigint] NULL,
	[DollarPrice] [bigint] NULL DEFAULT ((0)),
	[PondPrice] [bigint] NULL DEFAULT ((0)),
	[UroPrice] [bigint] NULL DEFAULT ((0)),
	[Action] [int] NULL DEFAULT ((0)),
	[Date] [datetime] NULL DEFAULT (NULL),
	[PayRequestId] [bigint] NULL,
 CONSTRAINT [PK_CustomerToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorType] [nvarchar](50) NULL,
	[ErrorDate] [datetime] NULL,
	[UserId] [int] NULL,
	[CustomerId] [bigint] NULL,
	[ModuleId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleAccess](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ReadAccess] [bit] NULL,
	[DeleteAdccess] [bit] NULL,
	[WriteAccess] [bit] NULL,
 CONSTRAINT [PK_ModuleAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FaName] [nvarchar](50) NULL,
	[EnName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[Amount] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[Count] [bigint] NULL DEFAULT ((0)),
	[Dollar] [bigint] NULL DEFAULT ((0)),
	[Rial] [bigint] NULL DEFAULT ((0)),
	[Pond] [bigint] NULL DEFAULT ((0)),
	[Uro] [bigint] NULL DEFAULT ((0)),
	[IncomePercent] [int] NULL DEFAULT ((0)),
	[Currency] [int] NULL DEFAULT ((0)),
	[IncomePrice] [bigint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [bigint] NULL,
	[RequestDate] [datetime] NULL,
	[PayDate] [datetime] NULL,
	[CustomerId] [bigint] NULL,
	[Status] [int] NULL,
	[IncomePercent] [int] NULL,
	[IncomePrice] [bigint] NULL,
	[BankAccountId] [bigint] NULL,
	[Description] [nvarchar](50) NULL,
	[Count] [bigint] NULL,
	[Dollar] [bigint] NULL,
	[Rial] [bigint] NULL,
	[Pond] [bigint] NULL,
	[Uro] [bigint] NULL,
	[Currency] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](200) NULL,
	[PostContent] [nvarchar](max) NULL,
	[Cover] [nvarchar](200) NULL,
	[Status] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[FriendlyUrl] [nvarchar](200) NULL,
	[Seen] [int] NULL,
	[UserId] [int] NULL,
	[ModifiedUserId] [int] NULL,
	[type] [int] NULL DEFAULT ((1)),
	[point] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] NOT NULL,
	[SiteTitle] [nvarchar](200) NULL,
	[SiteStatus] [int] NULL,
	[SiteDomain] [nvarchar](200) NULL,
	[SmtpPort] [int] NULL,
	[SmtpAddress] [nvarchar](200) NULL,
	[SmtpUserName] [nvarchar](200) NULL,
	[SmtpPassword] [nvarchar](200) NULL,
	[GlobalIncomePercent] [int] NULL,
	[Slogan] [nvarchar](max) NULL,
	[Rial] [bigint] NULL DEFAULT ((0)),
	[Dollar] [bigint] NULL DEFAULT ((0)),
	[Uro] [bigint] NULL DEFAULT ((0)),
	[Pond] [bigint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CustomerId] [bigint] NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[StatusDate] [datetime] NULL,
	[UnitId] [int] NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketContent](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketId] [bigint] NULL,
	[Content] [nvarchar](2000) NULL,
	[RegisterDate] [datetime] NULL,
	[FileAddress] [nvarchar](500) NULL,
	[FileType] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[CustomerId] [bigint] NULL,
 CONSTRAINT [PK_TicketContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TokenTypeId] [int] NULL,
	[TokenCode] [nvarchar](50) NULL,
	[CreateDate] [date] NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CustomerId] [bigint] NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenTransfer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TokenId] [int] NULL,
	[CustomerId] [bigint] NULL,
	[TransferDate] [date] NULL,
	[SystemIP] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[TokenCode] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TokenTransfer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[RealValue] [bigint] NULL,
	[TomanValue] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tocken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RegisterDate] [datetime] NULL,
	[Address] [nvarchar](500) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[State] [int] NULL,
	[PasswordResetHash] [nvarchar](150) NULL,
	[Permission] [nvarchar](250) NULL DEFAULT (NULL),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[Delete_AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_AcctionLog]  @Id as bigint AS BEGIN 
        Delete from [dbo].[AcctionLog] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_BankAccount]  @Id as bigint AS BEGIN 
        Delete from [dbo].[BankAccount] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_BankReceipt]  @Id as bigint AS BEGIN 
        Delete from [dbo].[BankReceipt] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_BankTransactions]  @Id as bigint AS BEGIN 
        Delete from [dbo].[BankTransactions] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_ContactUs]  @Id as bigint AS BEGIN 
        Delete from [dbo].[ContactUs] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Customer]  @Id as bigint AS BEGIN 
        Delete from [dbo].[Customer] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_CustomerToken]  @Id as bigint AS BEGIN 
        Delete from [dbo].[CustomerToken] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_ErrorLog]  @Id as bigint AS BEGIN 
        Delete from [dbo].[ErrorLog] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_ModuleAccess]  @Id as bigint AS BEGIN 
        Delete from [dbo].[ModuleAccess] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Modules]  @Id as int AS BEGIN 
        Delete from [dbo].[Modules] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Order]  @Id as bigint AS BEGIN 
        Delete from [dbo].[Order] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_PayRequest]  @Id as bigint AS BEGIN 
        Delete from [dbo].[PayRequest] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Post]  @Id as int AS BEGIN 
        Delete from [dbo].[Post] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Setting]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Setting]  @Id as int AS BEGIN 
        Delete from [dbo].[Setting] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Ticket]  @Id as bigint AS BEGIN 
        Delete from [dbo].[Ticket] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_TicketContent]  @Id as bigint AS BEGIN 
        Delete from [dbo].[TicketContent] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_Token]  @Id as bigint AS BEGIN 
        Delete from [dbo].[Token] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_TokenTransfer]  @Id as bigint AS BEGIN 
        Delete from [dbo].[TokenTransfer] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_TokenType]  @Id as int AS BEGIN 
        Delete from [dbo].[TokenType] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Delete_UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Delete_UserAccount]  @Id as int AS BEGIN 
        Delete from [dbo].[UserAccount] where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Insert_AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_AcctionLog]  @UserId as int = null,@AcctionName as nvarchar(50) = null,@ModifyDate as date = null,@Description as nvarchar(500) = null,@ModuleId as int = null AS BEGIN 
        insert into [dbo].[AcctionLog] (UserId,AcctionName,ModifyDate,Description,ModuleId)  VALUES
           (@UserId,@AcctionName,@ModifyDate,@Description,@ModuleId) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_BankAccount]  @CustomerId as bigint=null,@Status as int=null,@CardNumber as nvarchar(50)=null,@Sheba as nvarchar(50)=null,@AccountNumber as nvarchar(50)=null,@BankId as int=null AS BEGIN 
        insert into [dbo].[BankAccount] (CustomerId,Status,CardNumber,Sheba,AccountNumber,BankId)  VALUES
           (@CustomerId,@Status,@CardNumber,@Sheba,@AccountNumber,@BankId) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_BankReceipt]  @BankName as nvarchar(50) = null,@ReceiptNumber as nvarchar(50) = null,@Amount as bigint = null,@PayDate as date = null,@UserId as int = null,@CustomerId as bigint = null,@Statuse as int = null,@ReciptType as int = null,@Description as nvarchar(500) = null,@BankAccountId bigint=null,@OrderId bigint=null,@Attachment nvarchar(50)=null AS BEGIN 
        insert into [dbo].[BankReceipt] (BankName,ReceiptNumber,Amount,PayDate,UserId,CustomerId,Statuse,ReciptType,Description,BankAccountId,OrderId,Attachment)  VALUES
           (@BankName,@ReceiptNumber,@Amount,@PayDate,@UserId,@CustomerId,@Statuse,@ReciptType,@Description,@BankAccountId,@OrderId,@Attachment) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_BankTransactions]  @OrderId as bigint = null,@CustomerId as bigint = null,@PayDate as datetime = null,@Amount as bigint = null,@Description as nvarchar(500) = null
 ,@Status as int = null,@TrackingCode as nvarchar(50) = null,@GatewayId as int = null,@ReceptionNumber as nvarchar(50) = null AS BEGIN 
        insert into [dbo].[BankTransactions] (OrderId,CustomerId,PayDate,Amount,Description,Status,TrackingCode,GatewayId,ReceptionNumber)  VALUES
           (@OrderId,@CustomerId,@PayDate,@Amount,@Description,@Status,@TrackingCode,@GatewayId,@ReceptionNumber) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_ContactUs]  @Date as datetime = null,@Name as nvarchar(200) = null,@Subject as nvarchar(200) = null,@Email as nvarchar(200) = null,@Message as nvarchar(Max) = null,@Ip as nvarchar(50) = null,@Read as bit = null AS BEGIN 
        insert into [dbo].[ContactUs] (Date,Name,Subject,Email,Message,Ip,[Read])  VALUES
           (@Date,@Name,@Subject,@Email,@Message,@Ip,@Read) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Customer]  @FirstName as nvarchar(50) = null,@LastName as nvarchar(50) = null,@UserName as nvarchar(50) = null,@Password as nvarchar(50) = null,@NationalCode as nvarchar(50) = null,@RegisterDate as datetime = null,@BirthDate as datetime = null,@Country as int = null,@State as int = null,@City as nvarchar(200) = null,@Address as nvarchar(500) = null,@UserCode as nvarchar(50) = null,@MobilePhone as nvarchar(50) = null,@Phone as nvarchar(50) = null,@Email as nvarchar(200) = null,@WebAddress as nvarchar(250) = null,@ImageAddress as nvarchar(250) = null,@PasswordResetHash nvarchar(50)=null AS BEGIN 
        insert into [dbo].[Customer] (FirstName,LastName,UserName,Password,NationalCode,RegisterDate,BirthDate,Country,State,City,Address,UserCode,MobilePhone,Phone,Email,WebAddress,ImageAddress,PasswordResetHash)  VALUES
           (@FirstName,@LastName,@UserName,@Password,@NationalCode,@RegisterDate,@BirthDate,@Country,@State,@City,@Address,@UserCode,@MobilePhone,@Phone,@Email,@WebAddress,@ImageAddress,@PasswordResetHash) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_CustomerToken]  @OrderId as bigint = null,@CustomerId as bigint = null,@Count bigint=null,@RialPrice bigint=null,
 @DollarPrice bigint=0,@PondPrice bigint=0,@UroPrice bigint=0,@Action int=0,@Date datetime=null,@PayRequestId bigint=null
  AS BEGIN 
        insert into [dbo].[CustomerToken] (OrderId,CustomerId,[Count],RialPrice,DollarPrice,PondPrice,UroPrice,[Action],[Date],PayRequestId)  VALUES
           (@OrderId,@CustomerId,@Count,@RialPrice,@DollarPrice,@PondPrice,@UroPrice,@Action,@Date,@PayRequestId) select @@IDENTITY END


GO
/****** Object:  StoredProcedure [dbo].[Insert_ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_ErrorLog]  @ErrorType as nvarchar(50) = null,@ErrorDate as datetime = null,@UserId as int = null,@CustomerId as bigint = null,@ModuleId as int = null,@Description as nvarchar(Max) = null AS BEGIN 
        insert into [dbo].[ErrorLog] (ErrorType,ErrorDate,UserId,CustomerId,ModuleId,Description)  VALUES
           (@ErrorType,@ErrorDate,@UserId,@CustomerId,@ModuleId,@Description) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_ModuleAccess]  @ModuleId as int = null,@UserId as int = null,@ReadAccess as bit = null,@DeleteAdccess as bit = null,@WriteAccess as bit = null AS BEGIN 
        insert into [dbo].[ModuleAccess] (ModuleId,UserId,ReadAccess,DeleteAdccess,WriteAccess)  VALUES
           (@ModuleId,@UserId,@ReadAccess,@DeleteAdccess,@WriteAccess) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Modules]  @FaName as nvarchar(50) = null,@EnName as nvarchar(50) = null AS BEGIN 
        insert into [dbo].[Modules] (FaName,EnName)  VALUES
           (@FaName,@EnName) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Order]  @CustomerId as bigint = null,@CreateDate as datetime = null,@ModifyDate as datetime = null,@Amount as bigint = null,@Description as nvarchar(500) = null,@Status as int = null
 ,@Count bigint=0,@Dollar bigint=0,@Rial bigint=0,@Pond bigint=0,@Uro bigint=0,@IncomePercent int=0,@Currency int=0,@IncomePrice bigint=0
 
  AS BEGIN 
        insert into [dbo].[Order] (CustomerId,CreateDate,ModifyDate,Amount,Description,Status,[Count],Dollar,Rial,Pond,Uro,Currency,IncomePercent,IncomePrice)  VALUES
           (@CustomerId,@CreateDate,@ModifyDate,@Amount,@Description,@Status,@Count,@Dollar,@Rial,@Pond,@Uro,@Currency,@IncomePercent,@IncomePrice) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_PayRequest]  @Amount as bigint=null,@RequestDate as datetime=null,@PayDate as datetime=null,@CustomerId as bigint=null,@Status as int=null,@IncomePercent as int=null,@IncomePrice as bigint=null,@BankAccountId as bigint=null,@Description as nvarchar(50)=null
 ,@Count as bigint,@Dollar as bigint,@Rial as bigint,@Pond as bigint,@Uro as bigint,@Currency as int
 AS
   BEGIN
        insert into [dbo].[PayRequest] (Amount,RequestDate,PayDate,CustomerId,Status,IncomePercent,IncomePrice,BankAccountId,Description, Count,Dollar,Rial,Pond,Uro,Currency)  VALUES
           (@Amount,@RequestDate,@PayDate,@CustomerId,@Status,@IncomePercent,@IncomePrice,@BankAccountId,@Description, @Count,@Dollar,@Rial,@Pond ,@Uro ,@Currency) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Post]  @Subject as nvarchar(200) = null,@PostContent as nvarchar(Max) = null,@Cover as nvarchar(200) = null,
 @Status as int = null,@CreateDate as datetime = null,@ModifyDate as datetime = null,@FriendlyUrl as nvarchar(200) = null,@Seen as int = null,
 @UserId as int = null,@ModifiedUserId as int = null,@Type as int = 1,@Point as int = 0 AS BEGIN 
        insert into [dbo].[Post] (Subject,PostContent,Cover,Status,CreateDate,ModifyDate,FriendlyUrl,Seen,UserId,ModifiedUserId,point,type)  VALUES
           (@Subject,@PostContent,@Cover,@Status,@CreateDate,@ModifyDate,@FriendlyUrl,@Seen,@UserId,@ModifiedUserId,@Point,@Type) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Setting]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Setting]  @SiteTitle as nvarchar(200) = null,@SiteStatus as int = null,@SiteDomain as nvarchar(200) = null,@SmtpPort as int = null,@SmtpAddress as nvarchar(200) = null,@SmtpUserName as nvarchar(200) = null,@SmtpPassword as nvarchar(200) = null,@GloballncomePercent as int = null,@Slogan text=null,@Dollar bigint=0,@Uro bigint=0,@Rial bigint=0,@Pond bigint=0 AS BEGIN 
        insert into [dbo].[Setting] (SiteTitle,SiteStatus,SiteDomain,SmtpPort,SmtpAddress,SmtpUserName,SmtpPassword,GlobalIncomePercent,Slogan,Rial,Dollar,Uro,Pond)  VALUES
           (@SiteTitle,@SiteStatus,@SiteDomain,@SmtpPort,@SmtpAddress,@SmtpUserName,@SmtpPassword,@GloballncomePercent,@Slogan,@Rial,@Dollar,@Uro,@Pond) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Ticket]  @Subject as nvarchar(500) = null,@Status as int = null,@CustomerId as bigint = null,@UserId as int = null,@CreateDate as datetime = null,@StatusDate as datetime = null,@UnitId as int = null,@Priority as int = null AS BEGIN 
        insert into [dbo].[Ticket] (Subject,Status,CustomerId,UserId,CreateDate,StatusDate,UnitId,Priority)  VALUES
           (@Subject,@Status,@CustomerId,@UserId,@CreateDate,@StatusDate,@UnitId,@Priority) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_TicketContent]  @TicketId as bigint = null,@Content as nvarchar(2000) = null,@RegisterDate as datetime = null,@FileAddress as nvarchar(500) = null,@FileType as nvarchar(50) = null,@UserId as int = null,@CustomerId as bigint = null AS BEGIN 
        insert into [dbo].[TicketContent] (TicketId,Content,RegisterDate,FileAddress,FileType,UserId,CustomerId)  VALUES
           (@TicketId,@Content,@RegisterDate,@FileAddress,@FileType,@UserId,@CustomerId) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_Token]  @TokenTypeId as int = null,@TokenCode as nvarchar(50) = null,@CreateDate as date = null,@UserId as int = null,@Status as int = null,@CustomerId as bigint = null AS BEGIN 
        insert into [dbo].[Token] (TokenTypeId,TokenCode,CreateDate,UserId,Status,CustomerId)  VALUES
           (@TokenTypeId,@TokenCode,@CreateDate,@UserId,@Status,@CustomerId) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_TokenTransfer]  @TokenId as int = null,@CustomerId as bigint = null,@TransferDate as date = null,@SystemIP as nvarchar(50) = null,@Description as nvarchar(500) = null,@TokenCode as nvarchar(50) = null,@UserId as int = null,@Status as int = null AS BEGIN 
        insert into [dbo].[TokenTransfer] (TokenId,CustomerId,TransferDate,SystemIP,Description,TokenCode,UserId,Status)  VALUES
           (@TokenId,@CustomerId,@TransferDate,@SystemIP,@Description,@TokenCode,@UserId,@Status) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_TokenType]  @Title as nvarchar(50) = null,@RealValue as bigint = null,@TomanValue as bigint = null,@Description as nvarchar(500) = null AS BEGIN 
        insert into [dbo].[TokenType] (Title,RealValue,TomanValue,Description)  VALUES
           (@Title,@RealValue,@TomanValue,@Description) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Insert_UserAccount] @State as int = null, @FirstName as nvarchar(50) = null,@LastName as nvarchar(50) = null,@UserName as nvarchar(50) = null,@Password as nvarchar(50) = null,@RegisterDate as datetime = null,@Address as nvarchar(500) = null,@MobilePhone as nvarchar(50) = null,@Phone as nvarchar(50) = null,@Email as nvarchar(200) = null,@PasswordResetHash nvarchar(50)=null,@Permission nvarchar(250)=null AS BEGIN 
        insert into [dbo].[UserAccount] (State,FirstName,LastName,UserName,Password,RegisterDate,Address,MobilePhone,Phone,Email,PasswordResetHash,Permission)  VALUES
           (@State,@FirstName,@LastName,@UserName,@Password,@RegisterDate,@Address,@MobilePhone,@Phone,@Email,@PasswordResetHash,@Permission) select @@IDENTITY END
GO
/****** Object:  StoredProcedure [dbo].[procCreateInsertPro]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[procCreateInsertPro]
AS

DECLARE @table nvarchar(500)
DECLARE @sql nvarchar(2520)
DECLARE @sqlUpdate nvarchar(2520)
DECLARE @sqlDelete nvarchar(520)

DECLARE CursorSelect CURSOR FOR
    select table_name from INFORMATION_SCHEMA.tables where table_name not like 'sys%'

OPEN CursorSelect
FETCH NEXT FROM CursorSelect
INTO @table


WHILE @@FETCH_STATUS = 0
BEGIN
        DECLARE CursorSelectFiled CURSOR FOR
            SELECT COLUMN_NAME,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH FROM TokenShop.INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @table
		Declare @id nvarchar(50)=''
       DECLARE @field nvarchar(100)=''
       DECLARE @len nvarchar(100)=''
       DECLARE @type nvarchar(100)=''
       DECLARE @propert nvarchar(2000)=''
       DECLARE @fields nvarchar(2000)=''
       DECLARE @varfields nvarchar(2000)=''
       DECLARE @updatefields nvarchar(2000)=''
        OPEN CursorSelectFiled
        FETCH NEXT FROM CursorSelectFiled
        INTO @field,@type,@len
        WHILE @@FETCH_STATUS = 0
        BEGIN

		if(@field<>'Id')
		begin
        	set @propert=(SELECT CONCAT(@propert+',', @field));
        	set @fields=(SELECT CONCAT(@fields+',@', @field));
        	set @updatefields=(SELECT CONCAT(@updatefields,','+@field+'=@', @field));

		  if(@len='-1') set @len='Max'
		  if(@type='int' or @type='bigint' or @type='bit'  or @type='datetime' or @type='date'  or @type='float') 
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type+' = null'));
			else
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type+'('+@len+')'+' = null'));
		END
		else
		set @id='@Id as '+@type;
            FETCH NEXT FROM CursorSelectFiled
            INTO @field,@type,@len 
        END
        CLOSE CursorSelectFiled
        DEALLOCATE CursorSelectFiled
		set @varfields=RIGHT(@varfields,LEN(@varfields)-1)
		set @propert=RIGHT(@propert,LEN(@propert)-1)
		set @fields=RIGHT(@fields,LEN(@fields)-1)
		set @updatefields=RIGHT(@updatefields,LEN(@updatefields)-1)

            SET @sql = ' CREATE Procedure dbo.Insert_'+@table +'  '+
			@varfields+
        ' AS BEGIN 
        insert into [dbo].[' + @table +'] ('+
		@propert+')'
		+'  VALUES
           ('+@fields+')'+
        ' select @@IDENTITY END'
		print @sql
         exec(@sql)
		   SET @sqlUpdate = ' CREATE Procedure dbo.Update_'+@table +'  '+
			'  '+ @id+','+@varfields+
        ' AS BEGIN 
        update [dbo].[' + @table +']'+
		' SET '+
		@updatefields + '
		 where Id=@Id '+
         'END'
		 	--print @sqlUpdate
			exec(@sqlUpdate)
		SET @sqlDelete = ' CREATE Procedure dbo.Delete_'+@table +
			  '  '+ @id+
        ' AS BEGIN 
        Delete from [dbo].[' + @table +']'+
		 ' where Id=@Id '+
         'END'
		 	--print @sqlDelete
			exec(@sqlDelete)

            FETCH NEXT FROM CursorSelect
            INTO @table     
END
CLOSE CursorSelect
DEALLOCATE CursorSelect
RETURN
GO
/****** Object:  StoredProcedure [dbo].[procCreateInsertPro_One]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[procCreateInsertPro_One]
 @table as nvarchar(250)

AS
DECLARE @sql nvarchar(2520)
DECLARE @sqlUpdate nvarchar(2520)
DECLARE @sqlDelete nvarchar(520)

BEGIN
        DECLARE CursorSelectFiled CURSOR FOR
            SELECT COLUMN_NAME,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH FROM TokenShop.INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @table
		Declare @id nvarchar(50)=''
       DECLARE @field nvarchar(100)=''
       DECLARE @len nvarchar(100)=''
       DECLARE @type nvarchar(100)=''
       DECLARE @propert nvarchar(2000)=''
       DECLARE @fields nvarchar(2000)=''
       DECLARE @varfields nvarchar(2000)=''
       DECLARE @updatefields nvarchar(2000)=''
        OPEN CursorSelectFiled
        FETCH NEXT FROM CursorSelectFiled
        INTO @field,@type,@len
        WHILE @@FETCH_STATUS = 0
        BEGIN

		if(@field<>'Id')
		begin
        	set @propert=(SELECT CONCAT(@propert+',', @field));
        	set @fields=(SELECT CONCAT(@fields+',@', @field));
        	set @updatefields=(SELECT CONCAT(@updatefields,','+@field+'=@', @field));

		  if(@len='-1') set @len='Max'
		  if(@type='int' or @type='bigint' or @type='bit'  or @type='datetime'  or @type='float') 
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type +'=null'));
			else
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type+'('+@len+')'+'=null'));
		END
		else
		set @id='@Id as '+@type;
            FETCH NEXT FROM CursorSelectFiled
            INTO @field,@type,@len 
        END
        CLOSE CursorSelectFiled
        DEALLOCATE CursorSelectFiled
		set @varfields=RIGHT(@varfields,LEN(@varfields)-1)
		set @propert=RIGHT(@propert,LEN(@propert)-1)
		set @fields=RIGHT(@fields,LEN(@fields)-1)
		set @updatefields=RIGHT(@updatefields,LEN(@updatefields)-1)

            SET @sql = ' CREATE Procedure dbo.Insert_'+@table +'  '+
			@varfields+
        ' AS BEGIN 
        insert into [dbo].[' + @table +'] ('+
		@propert+')'
		+'  VALUES
           ('+@fields+')'+
        ' select @@IDENTITY END'
		--print @sql
         exec(@sql)
		   SET @sqlUpdate = ' CREATE Procedure dbo.Update_'+@table +'  '+
			'  '+ @id+','+@varfields+
        ' AS BEGIN 
        update [dbo].[' + @table +']'+
		' SET '+
		@updatefields + '
		 where Id=@Id '+
         'END'
		 	--print @sqlUpdate
			exec(@sqlUpdate)
		SET @sqlDelete = ' CREATE Procedure dbo.Delete_'+@table +
			  '  '+ @id+
        ' AS BEGIN 
        Delete from [dbo].[' + @table +']'+
		 ' where Id=@Id '+
         'END'
		 	--print @sqlDelete
			exec(@sqlDelete)

END
RETURN

GO
/****** Object:  StoredProcedure [dbo].[proCreateSelectPro]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[proCreateSelectPro]
AS

DECLARE @table nvarchar(500)
DECLARE @sql nvarchar(520)


DECLARE CursorSelect CURSOR FOR
    select table_name from INFORMATION_SCHEMA.tables where table_name not like 'sys%'

OPEN CursorSelect
FETCH NEXT FROM CursorSelect
INTO @table


WHILE @@FETCH_STATUS = 0
BEGIN
        DECLARE CursorSelectFiled CURSOR FOR
            SELECT COLUMN_NAME,DATA_TYPE FROM TokenShop.INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @table
		Declare @id nvarchar(50)=''
       DECLARE @type nvarchar(100)=''
       DECLARE @field nvarchar(100)=''
       DECLARE @fields nvarchar(1220)=''
        OPEN CursorSelectFiled
        FETCH NEXT FROM CursorSelectFiled
        INTO @field,@type
        WHILE @@FETCH_STATUS = 0
        BEGIN
		
        	set @fields=(SELECT CONCAT(@fields+',', @field));
			if(@field='Id')
			set @id='@Id as '+@type;
            FETCH NEXT FROM CursorSelectFiled
            INTO @field,@type 
        END
        CLOSE CursorSelectFiled
        DEALLOCATE CursorSelectFiled
		set @fields=RIGHT(@fields,LEN(@fields)-1)
         --print @fields
            SET @sql = ' CREATE Procedure dbo.SelectAll_'+@table +
        ' AS BEGIN 
        select '+@fields+' from [dbo].[' + @table +']'+
        ' END'
		
            exec(@sql)
			 SET @sql = ' CREATE Procedure dbo.SelectOne_'+@table +
			 ' '+@id+
        ' AS BEGIN 
        select '+@fields+' from [dbo].[' + @table +']'+
        ' where Id=@id 
		 END'
		
            exec(@sql)

            FETCH NEXT FROM CursorSelect
            INTO @table     
END
CLOSE CursorSelect
DEALLOCATE CursorSelect
RETURN
GO
/****** Object:  StoredProcedure [dbo].[proDeleteAllProcedureCreated]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proDeleteAllProcedureCreated]
as
begin
DECLARE @spname sysname;

DECLARE SPCursor CURSOR FOR
SELECT  'dbo.' + name
FROM sys.objects
WHERE type = 'P';

OPEN SPCursor;
FETCH NEXT FROM SPCursor INTO @spname;
WHILE @@FETCH_STATUS = 0
BEGIN

if(@spname like 'dbo.Insert_%' or @spname like 'dbo.Update_%'  or @spname like 'dbo.Delete_%' or @spname like 'dbo.SelectAll_%' or @spname like 'dbo.SelectOne_%' )
  EXEC('DROP PROCEDURE ' + @spname);
  FETCH NEXT FROM SPCursor INTO @spname;
END
CLOSE SPCursor;
DEALLOCATE SPCursor;
end
GO
/****** Object:  StoredProcedure [dbo].[proDeleteOneProcedure]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[proDeleteOneProcedure]
 @spname sysname

AS

BEGIN

  EXEC('DROP PROCEDURE ' + @spname);
END

GO
/****** Object:  StoredProcedure [dbo].[SelectAll_AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_AcctionLog] AS BEGIN 
        select Id,UserId,AcctionName,ModifyDate,Description,ModuleId from [dbo].[AcctionLog] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectAll_BankAccount]
@customer_id bigint=0,
@status int=0
AS BEGIN 
        select Id,CustomerId,Status,CardNumber,Sheba,AccountNumber,BankId from [dbo].[BankAccount]
		where (CustomerId=@customer_id or @customer_id=0)
		and
		(Status=@status or @status=0)
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_BankReceipt]
 @customer_id bigint=0,
 @recipt_type int=0,
 @status int=0
  AS BEGIN 
        select Customer.FirstName+' '+Customer.LastName as CustomerName, [BankReceipt].Id,BankName,ReceiptNumber,Amount,PayDate,UserId,CustomerId,Statuse,ReciptType,Description,BankAccountId,OrderId,Attachment from [dbo].[BankReceipt] 
		
		left join Customer on Customer.Id=[BankReceipt].CustomerId
		where (CustomerId=@customer_id or @customer_id=0)
		and
		(ReciptType=@recipt_type or @recipt_type=0)
		and
		(Statuse=@status or @status=0)
		END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_BankTransactions] AS BEGIN 
        select Id,OrderId,CustomerId,PayDate,Amount,Description,Status,TrackingCode,GatewayId,ReceptionNumber from [dbo].[BankTransactions] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_ContactUs] AS BEGIN 
        select Id,Date,Name,Subject,Email,Message,Ip,[Read] from [dbo].[ContactUs] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Customer]
 @UserName nvarchar(50)='',
 @Password nvarchar(100)='',
 @PasswordResetToken nvarchar(150)='',
 @UserCode nvarchar(10)='',
 @Count int=10,
 @OFFSET int=0
 as
  BEGIN 
        select Id,FirstName,LastName,UserName,Password,NationalCode,RegisterDate,BirthDate,Country,State,City,Address,UserCode,MobilePhone,Phone,Email,WebAddress,ImageAddress,PasswordResetHash from [dbo].[Customer] 
		where 
		(UserName=@UserName or @UserName='') and 
		(Password=@Password or @Password='') and 
		(UserCode=@UserCode or @UserCode='') and 
		(PasswordResetHash=@PasswordResetToken or @PasswordResetToken='')
		order by Id
		OFFSET (@OFFSET) ROWS FETCH NEXT (@Count) ROWS ONLY
		END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_CustomerToken]
 @CustomerId bigint=0
  AS BEGIN 
        select Id,OrderId,CustomerId,Count,RialPrice,DollarPrice,PondPrice,UroPrice,[Action],[Date],PayRequestId from [dbo].[CustomerToken]
		
		where CustomerId=@CustomerId or @CustomerId=0
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_ErrorLog] AS BEGIN 
        select Id,ErrorType,ErrorDate,UserId,CustomerId,ModuleId,Description from [dbo].[ErrorLog] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_ModuleAccess] AS BEGIN 
        select Id,ModuleId,UserId,ReadAccess,DeleteAdccess,WriteAccess from [dbo].[ModuleAccess] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Modules] AS BEGIN 
        select Id,FaName,EnName from [dbo].[Modules] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Order]
 @CustomerId bigint=0
  AS BEGIN 
        select [Order].Id,CustomerId,CreateDate,ModifyDate,Amount,Description,Status,[Count],Dollar,Rial,Pond,Uro,IncomePercent,Currency,IncomePrice,Customer.FirstName+' '+Customer.LastName CustomerName from [dbo].[Order]
		inner join Customer on CustomerId=Customer.Id
		where
		(CustomerId=@CustomerId or @CustomerId=0)
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectAll_PayRequest]
@customer_id bigint=0,
@status bigint=0
 AS BEGIN 
        select Customer.FirstName+' '+Customer.LastName as CustomerName, BankAccount.AccountNumber,BankAccount.BankId,BankAccount.CardNumber,BankAccount.Sheba,[Count],Dollar,Rial,Pond,Uro,Currency,PayRequest.Id,Amount,RequestDate,PayDate,PayRequest.CustomerId,PayRequest.Status,IncomePercent,IncomePrice,BankAccountId,Description from [dbo].[PayRequest]
		
		left join Customer on Customer.Id=PayRequest.CustomerId
		left join BankAccount on BankAccount.Id=PayRequest.BankAccountId
		where (PayRequest.CustomerId=@customer_id or @customer_id=0)
		and
		(PayRequest.Status=@status or @status=0)
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Post]
 @type int=0,
 @status int=0
  AS BEGIN 
        select Id,Subject,PostContent,Cover,Status,CreateDate,ModifyDate,FriendlyUrl,Seen,UserId,ModifiedUserId,Type,Point
		
		
		 from [dbo].[Post]
		 
		 where (type=@type or @type=0) and (status=@status or @status=0)

		 order by point desc
		  END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Ticket] 
 @CustomerId bigint=-1,
 @Status int=-1
 AS BEGIN 
        select Ticket.Id,Subject,Status,CustomerId,UserId,CreateDate,StatusDate,UnitId,Priority,Customer.FirstName+' '+Customer.LastName CustomerName from [dbo].[Ticket] 
		inner join Customer on CustomerId=Customer.Id
		where 
		(CustomerId=@CustomerId or @CustomerId=-1) and
		(Status=@Status or @Status=-1)
		order by StatusDate desc
		END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_TicketContent]
 @TicketId bigint=0
  AS BEGIN 
        select TicketContent.Id,TicketId,Content,TicketContent.RegisterDate,FileAddress,FileType,UserId,CustomerId,
		Customer.firstname+' '+customer.lastname CustomerName,
		useraccount.firstname+' '+useraccount.lastname UserName
		from [dbo].[TicketContent] 
		left join Customer on Customer.id=CustomerId
		left join UserAccount on UserAccount.Id=UserId
		where (TicketId=@TicketId or TicketId=0)
		END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_Token] AS BEGIN 
        select Id,TokenTypeId,TokenCode,CreateDate,UserId,Status,CustomerId from [dbo].[Token] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_TokenTransfer] AS BEGIN 
        select Id,TokenId,CustomerId,TransferDate,SystemIP,Description,TokenCode,UserId,Status from [dbo].[TokenTransfer] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_TokenType] AS BEGIN 
        select Id,Title,RealValue,TomanValue,Description from [dbo].[TokenType] END
GO
/****** Object:  StoredProcedure [dbo].[SelectAll_UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectAll_UserAccount]
 @UserName nvarchar(50)='',
 @Password nvarchar(100)=''
  AS BEGIN 
        select Id,FirstName,LastName,UserName,Password,RegisterDate,Address,MobilePhone,Phone,Email,[State],Permission from [dbo].[UserAccount] 
		where 
		(UserName=@UserName or @UserName='') 
		and 
		(Password=@Password or @Password='')
		END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_AcctionLog] @Id as bigint AS BEGIN 
        select Id,UserId,AcctionName,ModifyDate,Description,ModuleId from [dbo].[AcctionLog] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SelectOne_BankAccount] @Id as bigint AS BEGIN 
        select Id,CustomerId,Status,CardNumber,Sheba,AccountNumber,BankId from [dbo].[BankAccount] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_BankReceipt] @Id as bigint AS BEGIN 
        select Customer.FirstName+' '+Customer.LastName as CustomerName, [BankReceipt].Id,BankName,ReceiptNumber,Amount,PayDate,UserId,CustomerId,Statuse,ReciptType,Description,BankAccountId,OrderId,Attachment from [dbo].[BankReceipt] 
		
		left join Customer on Customer.Id=[BankReceipt].CustomerId
		where [BankReceipt].Id=@id 
		order by id desc
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_BankTransactions] @Id as bigint AS BEGIN 
        select Id,OrderId,CustomerId,PayDate,Amount,Description,Status,TrackingCode,GatewayId,ReceptionNumber from [dbo].[BankTransactions] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_ContactUs] @Id as bigint AS BEGIN 
        select Id,Date,Name,Subject,Email,Message,Ip,[Read] from [dbo].[ContactUs] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Customer] @Id as bigint AS BEGIN 
        select Id,FirstName,LastName,UserName,Password,NationalCode,RegisterDate,BirthDate,Country,State,City,Address,UserCode,MobilePhone,Phone,Email,WebAddress,ImageAddress,PasswordResetHash
		,[dbo].[getTokenCount] (Customer.id) TokenCount
		
		 from [dbo].[Customer] where Id=@id 
		 END



GO
/****** Object:  StoredProcedure [dbo].[SelectOne_CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_CustomerToken] @Id as bigint AS BEGIN 
        select Id,OrderId,CustomerId,Count,RialPrice,DollarPrice,PondPrice,UroPrice,[Action],[Date],PayRequestId from [dbo].[CustomerToken] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_ErrorLog] @Id as bigint AS BEGIN 
        select Id,ErrorType,ErrorDate,UserId,CustomerId,ModuleId,Description from [dbo].[ErrorLog] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_ModuleAccess] @Id as bigint AS BEGIN 
        select Id,ModuleId,UserId,ReadAccess,DeleteAdccess,WriteAccess from [dbo].[ModuleAccess] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Modules] @Id as int AS BEGIN 
        select Id,FaName,EnName from [dbo].[Modules] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Order] @Id as bigint AS BEGIN 
        select Id,CustomerId,CreateDate,ModifyDate,Amount,Description,Status,[Count],Dollar,Rial,Pond,Uro,IncomePercent,Currency,IncomePrice from [dbo].[Order] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelectOne_PayRequest] @Id as bigint AS BEGIN 
        select Customer.FirstName+' '+Customer.LastName as CustomerName, BankAccount.AccountNumber,BankAccount.BankId,BankAccount.CardNumber,BankAccount.Sheba,[Count],Dollar,Rial,Pond,Uro,Currency,[PayRequest].Id,Amount,RequestDate,PayDate,[PayRequest].CustomerId,[PayRequest].Status,IncomePercent,IncomePrice,BankAccountId,Description 
		from [dbo].[PayRequest]
		left join Customer on Customer.Id=PayRequest.CustomerId
		left join BankAccount on BankAccount.Id=PayRequest.BankAccountId
		 where [PayRequest].Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Post] @Id as int AS BEGIN 
        select Id,Subject,PostContent,Cover,Status,CreateDate,ModifyDate,FriendlyUrl,Seen,UserId,ModifiedUserId,Point,Type from [dbo].[Post] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Setting]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Setting] @Id as int AS BEGIN 
        select Id,SiteTitle,SiteStatus,SiteDomain,SmtpPort,SmtpAddress,SmtpUserName,SmtpPassword,GlobalIncomePercent,Slogan,Dollar,Rial,Pond,Uro from [dbo].[Setting] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Ticket] @Id as bigint AS BEGIN 
        select Id,Subject,Status,CustomerId,UserId,CreateDate,StatusDate,UnitId,Priority from [dbo].[Ticket] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_TicketContent] @Id as bigint AS BEGIN 
        select Id,TicketId,RegisterDate,FileAddress,FileType,UserId,CustomerId from [dbo].[TicketContent] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_Token] @Id as bigint AS BEGIN 
        select Id,TokenTypeId,TokenCode,CreateDate,UserId,Status,CustomerId from [dbo].[Token] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_TokenTransfer] @Id as bigint AS BEGIN 
        select Id,TokenId,CustomerId,TransferDate,SystemIP,Description,TokenCode,UserId,Status from [dbo].[TokenTransfer] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_TokenType] @Id as int AS BEGIN 
        select Id,Title,RealValue,TomanValue,Description from [dbo].[TokenType] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[SelectOne_UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SelectOne_UserAccount] @Id as int AS BEGIN 
        select Id,FirstName,LastName,UserName,Password,RegisterDate,Address,MobilePhone,Phone,Email,Permission,[State],Permission from [dbo].[UserAccount] where Id=@id 
		 END
GO
/****** Object:  StoredProcedure [dbo].[Update_AcctionLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_AcctionLog]    @Id as bigint,@UserId as int = null,@AcctionName as nvarchar(50) = null,@ModifyDate as date = null,@Description as nvarchar(500) = null,@ModuleId as int = null AS BEGIN 
        update [dbo].[AcctionLog] SET UserId=@UserId,AcctionName=@AcctionName,ModifyDate=@ModifyDate,Description=@Description,ModuleId=@ModuleId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_BankAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_BankAccount]    @Id as bigint,@CustomerId as bigint=null,@Status as int=null,@CardNumber as nvarchar(50)=null,@Sheba as nvarchar(50)=null,@AccountNumber as nvarchar(50)=null,@BankId as int=null AS BEGIN 
        update [dbo].[BankAccount] SET CustomerId=@CustomerId,Status=@Status,CardNumber=@CardNumber,Sheba=@Sheba,AccountNumber=@AccountNumber,BankId=@BankId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_BankReceipt]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_BankReceipt]    @Id as bigint,@BankName as nvarchar(50) = null,@ReceiptNumber as nvarchar(50) = null,@Amount as bigint = null,@PayDate as date = null,@UserId as int = null,@CustomerId as bigint = null,@Statuse as int = null,@ReciptType as int = null,@Description as nvarchar(500) = null,@BankAccountId bigint=null,@OrderId bigint=null,@Attachment nvarchar(50)=null AS BEGIN 
        update [dbo].[BankReceipt] SET Attachment=@Attachment, BankName=@BankName,ReceiptNumber=@ReceiptNumber,BankAccountId=@BankAccountId,Amount=@Amount,PayDate=@PayDate,UserId=@UserId,CustomerId=@CustomerId,Statuse=@Statuse,ReciptType=@ReciptType,Description=@Description,OrderId=@OrderId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_BankTransactions]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_BankTransactions]    @Id as bigint,@OrderId as bigint = null,@CustomerId as bigint = null,@PayDate as datetime = null,@Amount as bigint = null,
 @Description as nvarchar(500) = null,@Status as int = null,@TrackingCode as nvarchar(50) = null,@GatewayId as int = null,@ReceptionNumber as nvarchar(50) = null AS BEGIN 
        update [dbo].[BankTransactions] SET OrderId=@OrderId,CustomerId=@CustomerId,PayDate=@PayDate,Amount=@Amount,Description=@Description,Status=@Status,TrackingCode=@TrackingCode,GatewayId=@GatewayId,ReceptionNumber=@ReceptionNumber
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_ContactUs]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_ContactUs]    @Id as bigint,@Date as date = null,@Name as nvarchar(200) = null,@Subject as nvarchar(200) = null,@Email as nvarchar(200) = null,@Message as nvarchar(Max) = null,@Ip as nvarchar(50) = null AS BEGIN 
        update [dbo].[ContactUs] SET Date=@Date,Name=@Name,Subject=@Subject,Email=@Email,Message=@Message,Ip=@Ip
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Customer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Customer]    @Id as bigint,@FirstName as nvarchar(50) = null,@LastName as nvarchar(50) = null,@UserName as nvarchar(50) = null,@Password as nvarchar(50) = null,@NationalCode as nvarchar(50) = null,@RegisterDate as datetime = null,@BirthDate as datetime = null,@Country as int = null,@State as int = null,@City as nvarchar(200) = null,@Address as nvarchar(500) = null,@UserCode as nvarchar(50) = null,@MobilePhone as nvarchar(50) = null,@Phone as nvarchar(50) = null,@Email as nvarchar(200) = null,@WebAddress as nvarchar(250) = null,@ImageAddress as nvarchar(250) = null,@PasswordResetHash nvarchar(50)=null AS BEGIN 
        update [dbo].[Customer] SET FirstName=@FirstName,LastName=@LastName,UserName=@UserName,Password=@Password,NationalCode=@NationalCode,RegisterDate=@RegisterDate,BirthDate=@BirthDate,Country=@Country,State=@State,City=@City,Address=@Address,UserCode=@UserCode,MobilePhone=@MobilePhone,Phone=@Phone,Email=@Email,WebAddress=@WebAddress,ImageAddress=@ImageAddress,PasswordResetHash=@PasswordResetHash
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_CustomerToken]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_CustomerToken]    @Id as bigint,@OrderId as bigint = null,@CustomerId as bigint = null,@Count bigint=null,@RialPrice bigint=null
  ,@DollarPrice bigint=0,@PondPrice bigint=0,@UroPrice bigint=0,@Action int=0,@Date datetime=null,@PayRequestId bigint=null
  AS BEGIN 
        update [dbo].[CustomerToken] SET PayRequestId=@PayRequestId,[Date]=@Date, [Action]=@Action, DollarPrice=@DollarPrice,PondPrice=@PondPrice,UroPrice=@UroPrice,OrderId=@OrderId,CustomerId=@CustomerId,[Count]=@Count,RialPrice=@RialPrice
		 where Id=@Id END

GO
/****** Object:  StoredProcedure [dbo].[Update_ErrorLog]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_ErrorLog]    @Id as bigint,@ErrorType as nvarchar(50) = null,@ErrorDate as datetime = null,@UserId as int = null,@CustomerId as bigint = null,@ModuleId as int = null,@Description as nvarchar(Max) = null AS BEGIN 
        update [dbo].[ErrorLog] SET ErrorType=@ErrorType,ErrorDate=@ErrorDate,UserId=@UserId,CustomerId=@CustomerId,ModuleId=@ModuleId,Description=@Description
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_ModuleAccess]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_ModuleAccess]    @Id as bigint,@ModuleId as int = null,@UserId as int = null,@ReadAccess as bit = null,@DeleteAdccess as bit = null,@WriteAccess as bit = null AS BEGIN 
        update [dbo].[ModuleAccess] SET ModuleId=@ModuleId,UserId=@UserId,ReadAccess=@ReadAccess,DeleteAdccess=@DeleteAdccess,WriteAccess=@WriteAccess
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Modules]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Modules]    @Id as int,@FaName as nvarchar(50) = null,@EnName as nvarchar(50) = null AS BEGIN 
        update [dbo].[Modules] SET FaName=@FaName,EnName=@EnName
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Order]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Order]    @Id as bigint,@CustomerId as bigint = null,@CreateDate as date = null,@ModifyDate as date = null,@Amount as bigint = null,@Description as nvarchar(500) = null,@Status as int = null
  ,@Count bigint=0,@Dollar bigint=0,@Rial bigint=0,@Pond bigint=0,@Uro bigint=0,@IncomePercent int=0,@Currency int=0,@IncomePrice bigint=0
  AS BEGIN 
        update [dbo].[Order] SET IncomePrice=@IncomePrice,IncomePercent=@IncomePercent,Currency=@Currency,Count=@Count,Dollar=@Dollar,Rial=@Rial,Pond=@Pond,Uro=@Uro, CustomerId=@CustomerId,CreateDate=@CreateDate,ModifyDate=@ModifyDate,Amount=@Amount,Description=@Description,Status=@Status
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_PayRequest]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_PayRequest]    @Id as bigint,@Amount as bigint=null,@RequestDate as datetime=null,@PayDate as datetime=null,@CustomerId as bigint=null,@Status as int=null,@IncomePercent as int=null,@IncomePrice as bigint=null,@BankAccountId as bigint=null,@Description as nvarchar(50)=null
  ,@Count as bigint,@Dollar as bigint,@Rial as bigint,@Pond as bigint,@Uro as bigint,@Currency as int
  AS BEGIN 
        update [dbo].[PayRequest] SET 
		Count=@Count,Dollar=@Dollar,Rial=@Rial,Pond=@Pond,Uro=@Uro,Currency=@Currency,
		Amount=@Amount,RequestDate=@RequestDate,PayDate=@PayDate,CustomerId=@CustomerId,Status=@Status,IncomePercent=@IncomePercent,IncomePrice=@IncomePrice,BankAccountId=@BankAccountId,Description=@Description
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Post]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Post]    
 @Id as int,@Subject as nvarchar(200) = null,
 @PostContent as nvarchar(Max) = null,@Cover as nvarchar(200) = null,
 @Status as int = null,@CreateDate as datetime = null,
 @ModifyDate as datetime = null,@FriendlyUrl as nvarchar(200) = null,@Seen as int = null
 ,@UserId as int = null,@ModifiedUserId as int = null,@Type as int = 1,@Point as int = 0 AS BEGIN 
        update [dbo].[Post] SET Type=@Type,Point=@Point,Subject=@Subject,PostContent=@PostContent,Cover=@Cover,Status=@Status,CreateDate=@CreateDate,ModifyDate=@ModifyDate,FriendlyUrl=@FriendlyUrl,Seen=@Seen,UserId=@UserId,ModifiedUserId=@ModifiedUserId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Setting]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Setting]    @Id as int,@SiteTitle as nvarchar(200) = null,@SiteStatus as int = null,@SiteDomain as nvarchar(200) = null,@SmtpPort as int = null,@SmtpAddress as nvarchar(200) = null,@SmtpUserName as nvarchar(200) = null,@SmtpPassword as nvarchar(200) = null,
 @GlobalIncomePercent as int = null,@Slogan as nvarchar(250)=null,@Dollar bigint=0,@Uro bigint=0,@Rial bigint=0,@Pond bigint=0 AS BEGIN 
  
        update [dbo].[Setting] SET Uro=@Uro,Dollar=@Dollar,Pond=@Pond,Rial=@Rial, Slogan=@Slogan, SiteTitle=@SiteTitle,SiteStatus=@SiteStatus,SiteDomain=@SiteDomain,SmtpPort=@SmtpPort,SmtpAddress=@SmtpAddress,SmtpUserName=@SmtpUserName,SmtpPassword=@SmtpPassword,GlobalIncomePercent=@GlobalIncomePercent
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Ticket]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Ticket]    @Id as bigint,@Subject as nvarchar(500) = null,@Status as int = null,@CustomerId as bigint = null,@UserId as int = null,@CreateDate as datetime = null,@StatusDate as date = null,@UnitId as int = null,@Priority as int = null AS BEGIN 
        update [dbo].[Ticket] SET Subject=@Subject,Status=@Status,CustomerId=@CustomerId,UserId=@UserId,CreateDate=@CreateDate,StatusDate=@StatusDate,UnitId=@UnitId,Priority=@Priority
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_TicketContent]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_TicketContent]    @Id as bigint,@TicketId as bigint = null,@TicketContent as nvarchar(2000) = null,@RegisterDate as datetime = null,@FileAddress as nvarchar(500) = null,@FileType as nvarchar(50) = null,@UserId as int = null,@CustomerId as bigint = null AS BEGIN 
        update [dbo].[TicketContent] SET TicketId=@TicketId,RegisterDate=@RegisterDate,FileAddress=@FileAddress,FileType=@FileType,UserId=@UserId,CustomerId=@CustomerId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_Token]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_Token]    @Id as bigint,@TokenTypeId as int = null,@TokenCode as nvarchar(50) = null,@CreateDate as date = null,@UserId as int = null,@Status as int = null,@CustomerId as bigint = null AS BEGIN 
        update [dbo].[Token] SET TokenTypeId=@TokenTypeId,TokenCode=@TokenCode,CreateDate=@CreateDate,UserId=@UserId,Status=@Status,CustomerId=@CustomerId
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_TokenTransfer]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_TokenTransfer]    @Id as bigint,@TokenId as int = null,@CustomerId as bigint = null,@TransferDate as date = null,@SystemIP as nvarchar(50) = null,@Description as nvarchar(500) = null,@TokenCode as nvarchar(50) = null,@UserId as int = null,@Status as int = null AS BEGIN 
        update [dbo].[TokenTransfer] SET TokenId=@TokenId,CustomerId=@CustomerId,TransferDate=@TransferDate,SystemIP=@SystemIP,Description=@Description,TokenCode=@TokenCode,UserId=@UserId,Status=@Status
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_TokenType]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_TokenType]    @Id as int,@Title as nvarchar(50) = null,@RealValue as bigint = null,@TomanValue as bigint = null,@Description as nvarchar(500) = null AS BEGIN 
        update [dbo].[TokenType] SET Title=@Title,RealValue=@RealValue,TomanValue=@TomanValue,Description=@Description
		 where Id=@Id END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserAccount]    Script Date: 12/25/2018 12:31:02 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[Update_UserAccount]    
 @Id as int,
 @FirstName as nvarchar(50) = null,
 @LastName as nvarchar(50) = null,@UserName as nvarchar(50) = null,
 @Password as nvarchar(50) = null,@RegisterDate as date = null,@Address as nvarchar(500) = null,
 @MobilePhone as nvarchar(50) = null,@Phone as nvarchar(50) = null,@Email as nvarchar(200) = null,
 @State int=null,@PasswordResetHash nvarchar(50)=null,@Permission nvarchar(250)=null
  AS BEGIN 
        update [dbo].[UserAccount] SET Permission=@Permission,FirstName=@FirstName,LastName=@LastName,UserName=@UserName,Password=@Password,RegisterDate=@RegisterDate,Address=@Address,MobilePhone=@MobilePhone,Phone=@Phone,Email=@Email,PasswordResetHash=@PasswordResetHash
		 where Id=@Id END
GO
USE [master]
GO
ALTER DATABASE [TokenShop] SET  READ_WRITE 
GO
