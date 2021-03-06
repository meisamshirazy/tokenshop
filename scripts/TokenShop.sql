USE [master]
GO
/****** Object:  Database [TokenShop]    Script Date: 11/17/2018 2:26:49 PM ******/
CREATE DATABASE [TokenShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TokenShop', FILENAME = N'F:\Data Base\TokenShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TokenShop_log', FILENAME = N'F:\Data Base\TokenShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [TokenShop] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[AcctionLog]    Script Date: 11/17/2018 2:26:49 PM ******/
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
/****** Object:  Table [dbo].[BankReceipt]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankReceipt](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](50) NULL,
	[ReceiptNumber] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[ShabaNumber] [nvarchar](50) NULL,
	[Amount] [bigint] NULL,
	[PayDate] [date] NULL,
	[UserId] [int] NULL,
	[CustomerId] [bigint] NULL,
	[Statuse] [int] NULL,
	[ReciptType] [int] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_BankReceipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankTransactions]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ReciptionNumber] [nvarchar](50) NULL,
	[PayDate] [date] NULL,
	[Amount] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[TrackingCode] [nvarchar](50) NULL,
	[GatewayId] [int] NULL,
	[RefId] [nvarchar](50) NULL,
	[ReceptionNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_BankTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Name] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[Ip] [nvarchar](50) NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/17/2018 2:26:50 PM ******/
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
	[RegisterDate] [date] NULL,
	[BirthDate] [date] NULL,
	[Country] [int] NULL,
	[State] [int] NULL,
	[City] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[UserCode] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[WebAddress] [nvarchar](250) NULL,
	[ImageAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerToken]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerToken](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TokenId] [bigint] NULL,
	[Status] [int] NULL,
	[OrderId] [bigint] NULL,
	[CustomerId] [bigint] NULL,
 CONSTRAINT [PK_CustomerToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorType] [nvarchar](50) NULL,
	[ErrorDate] [date] NULL,
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
/****** Object:  Table [dbo].[ModuleAccess]    Script Date: 11/17/2018 2:26:50 PM ******/
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
/****** Object:  Table [dbo].[Modules]    Script Date: 11/17/2018 2:26:50 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint] NOT NULL,
	[CustomerId] [bigint] NULL,
	[CreateDate] [date] NULL,
	[ModifyDate] [date] NULL,
	[Amount] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 11/17/2018 2:26:50 PM ******/
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
	[CreateDate] [date] NULL,
	[ModifyDate] [date] NULL,
	[FriendlyUrl] [nvarchar](200) NULL,
	[Seen] [int] NULL,
	[UserId] [int] NULL,
	[ModifiUserId] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteTitle] [nvarchar](200) NULL,
	[SiteStatus] [int] NULL,
	[SiteDomain] [nvarchar](200) NULL,
	[SmtpPort] [int] NULL,
	[SmtpAddress] [nvarchar](200) NULL,
	[SmtpUserName] [nvarchar](200) NULL,
	[SmtpPassword] [nvarchar](200) NULL,
	[GloballncomePercent] [int] NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/17/2018 2:26:50 PM ******/
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
	[CreateDate] [date] NULL,
	[StatusDate] [date] NULL,
	[UnitId] [int] NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketContent]    Script Date: 11/17/2018 2:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketContent](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketId] [bigint] NULL,
	[TicketContent] [nvarchar](2000) NULL,
	[RegisterDate] [date] NULL,
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
/****** Object:  Table [dbo].[Token]    Script Date: 11/17/2018 2:26:50 PM ******/
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
/****** Object:  Table [dbo].[TokenTransfer]    Script Date: 11/17/2018 2:26:50 PM ******/
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
/****** Object:  Table [dbo].[TokenType]    Script Date: 11/17/2018 2:26:50 PM ******/
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
/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/17/2018 2:26:50 PM ******/
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
	[RegisterDate] [date] NULL,
	[Address] [nvarchar](500) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[procCreateInsertPro]    Script Date: 11/17/2018 2:26:50 PM ******/
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
		  if(@type='int' or @type='bigint' or @type='bit'  or @type='date'  or @type='float') 
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type));
			else
			set @varfields=(SELECT CONCAT(@varfields,',@'+@field+' as '+@type+'('+@len+')'));
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
        insert into dbo.'+@table +'('+
		@propert+')'
		+'  VALUES
           ('+@fields+')'+
        ' END'
		--print @sql
         exec(@sql)
		   SET @sqlUpdate = ' CREATE Procedure dbo.Update_'+@table +'  '+
			'  '+ @id+','+@varfields+
        ' AS BEGIN 
        update dbo.'+@table +
		' SET '+
		@updatefields + '
		 where Id=@Id '+
         'END'
		 	print @sqlUpdate
			exec(@sqlUpdate)
		SET @sqlDelete = ' CREATE Procedure dbo.Delete_'+@table +
			  '  '+ @id+
        ' AS BEGIN 
        Delete from dbo.'+@table +
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
/****** Object:  StoredProcedure [dbo].[proCreateSelectPro]    Script Date: 11/17/2018 2:26:50 PM ******/
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
        select '+@fields+' from dbo.' + @table +
        ' END'
		
            exec(@sql)
			 SET @sql = ' CREATE Procedure dbo.SelectOne_'+@table +
			 ' '+@id+
        ' AS BEGIN 
        select '+@fields+' from dbo.' + @table +
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
USE [master]
GO
ALTER DATABASE [TokenShop] SET  READ_WRITE 
GO
