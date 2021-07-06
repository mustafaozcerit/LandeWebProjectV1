USE [master]
GO
/****** Object:  Database [test3]    Script Date: 10.03.2021 17:12:13 ******/
CREATE DATABASE [test3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test2', FILENAME = N'E:\SQLDATA\test3.mdf' , SIZE = 51388416KB , MAXSIZE = UNLIMITED, FILEGROWTH = 524288KB )
 LOG ON 
( NAME = N'test2_log', FILENAME = N'E:\SQLDATA\test3_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test3] SET ARITHABORT OFF 
GO
ALTER DATABASE [test3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test3] SET  MULTI_USER 
GO
ALTER DATABASE [test3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test3] SET QUERY_STORE = OFF
GO
USE [test3]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Street] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[StateProvince] [nvarchar](100) NULL,
	[ZipPostal] [nvarchar](100) NULL,
	[Country] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aksesuar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aksesuar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[AksesuarAdi] [nvarchar](100) NULL,
	[AksesuarKodu] [nvarchar](100) NULL,
	[yukseklik] [uniqueidentifier] NULL,
	[boyut] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[AksesuarGrubu] [uniqueidentifier] NULL,
	[Web] [bit] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Aciklama] [nvarchar](max) NULL,
	[EngAksesuarAdi] [nvarchar](100) NULL,
	[EngAciklama] [nvarchar](max) NULL,
	[EngWeb] [bit] NULL,
	[StokKodu] [nvarchar](100) NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[_AksesuarAdi] [nvarchar](100) NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Aksesuar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aksesuarDeger]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aksesuarDeger](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Deger] [nvarchar](100) NULL,
	[EngDeger] [nvarchar](100) NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[degerler] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_aksesuarDeger] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AksesuarGrubu]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AksesuarGrubu](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[AksesuarGrupAdi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Aciklama] [nvarchar](max) NULL,
	[fotograf] [varbinary](max) NULL,
	[EngAksesuarGrupAdi] [nvarchar](100) NULL,
	[EngAciklama] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_AksesuarGrubu] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DimensionPropertiesString] [nvarchar](max) NULL,
	[Name] [nvarchar](100) NULL,
	[Criteria] [nvarchar](max) NULL,
	[ObjectTypeName] [nvarchar](max) NULL,
	[ChartSettingsContent] [varbinary](max) NULL,
	[PivotGridSettingsContent] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDataItemPersistent](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[ModifiedOn] [datetime] NULL,
	[OperationType] [nvarchar](100) NULL,
	[Description] [nvarchar](2048) NULL,
	[AuditedObject] [uniqueidentifier] NULL,
	[OldObject] [uniqueidentifier] NULL,
	[NewObject] [uniqueidentifier] NULL,
	[OldValue] [nvarchar](1024) NULL,
	[NewValue] [nvarchar](1024) NULL,
	[PropertyName] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_AuditDataItemPersistent] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditedObjectWeakReference]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditedObjectWeakReference](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[GuidId] [uniqueidentifier] NULL,
	[IntId] [int] NULL,
	[DisplayName] [nvarchar](250) NULL,
 CONSTRAINT [PK_AuditedObjectWeakReference] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[UrunSerisi] [uniqueidentifier] NULL,
	[fotograf] [varbinary](max) NULL,
	[fotografENG] [varbinary](max) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasicUser]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasicUser](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsAdministrator] [bit] NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[Password] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_BasicUser] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boyut]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boyut](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Derinlik] [nvarchar](100) NULL,
	[Genislik] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Boyut] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneCode] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Currencies] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DashboardData]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardData](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Title] [nvarchar](100) NULL,
	[SynchronizeTitle] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_DashboardData] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Degerler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degerler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DegerAdi] [nvarchar](100) NULL,
	[Deger] [nvarchar](100) NULL,
	[DegerTipi] [uniqueidentifier] NULL,
	[ozellikler] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[urunler] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngDegerAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Degerler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DegerTipleri]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegerTipleri](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DegerTipi] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngDegerTipi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_DegerTipleri] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departmanlar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmanlar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DepartmanAdi] [nvarchar](100) NULL,
	[DepartmanMuduru] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Departmanlar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigerDokumanlar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
	[fotograf] [varbinary](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[DigerDokumanlarSayfasi] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_DigerDokumanlar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailListesi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailListesi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Aktif] [bit] NULL,
	[Pasif] [bit] NULL,
 CONSTRAINT [PK_EmailListesi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ResourceIds] [nvarchar](max) NULL,
	[RecurrencePattern] [uniqueidentifier] NULL,
	[Subject] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[StartOn] [datetime] NULL,
	[EndOn] [datetime] NULL,
	[AllDay] [bit] NULL,
	[Location] [nvarchar](100) NULL,
	[Label] [int] NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
	[RemindIn] [float] NULL,
	[ReminderInfoXml] [nvarchar](200) NULL,
	[AlarmTime] [datetime] NULL,
	[IsPostponed] [bit] NULL,
	[RecurrenceInfoXml] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtendedSecurityRole]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendedSecurityRole](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ExtendedSecurityRole] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileData]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileData](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[size] [int] NULL,
	[FileName] [nvarchar](260) NULL,
	[Content] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_FileData] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiyatListesi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[ListeFiyati] [float] NULL,
	[Currency] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[fileData] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FiyatListesi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fotograflar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[kapakOpsiyonlari] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[fotograf] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[File] [uniqueidentifier] NULL,
	[Content] [nvarchar](max) NULL,
	[EngWeb] [bit] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Fotograflar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Haberler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Haberler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[HaberBaslik] [nvarchar](100) NULL,
	[HaberAciklama] [nvarchar](max) NULL,
	[HaberTarih] [datetime] NULL,
	[HaberLink] [nvarchar](max) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[HaberFoto] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Web] [int] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Haberler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HCategory]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HCategory](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Parent] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_HCategory] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IDGeneratorTable]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDGeneratorTable](
	[ID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Type] [nvarchar](254) NULL,
	[Prefix] [nvarchar](100) NULL,
	[Oid] [int] NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_IDGeneratorTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaliteDokumanlari](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
	[conString] [nvarchar](100) NULL,
	[fotograf] [varbinary](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[GenelSayfadaGoster] [bit] NULL,
	[aksesuarGrubu] [uniqueidentifier] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_KaliteDokumanlari] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KapakOpsiyonDoc]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KapakOpsiyonDoc](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[KapakOpsiyonlari] [uniqueidentifier] NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[OcrText] [nvarchar](max) NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_KapakOpsiyonDoc] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KapakOpsiyonlari](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Opsiyon] [nvarchar](100) NULL,
	[OpsiyonKodu] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunler] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ENGOpsiyon] [nvarchar](100) NULL,
	[ENGWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_KapakOpsiyonlari] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kataloglar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[KatalogAdi] [nvarchar](100) NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[fotograf] [varbinary](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[LandeGenelKatalog] [bit] NULL,
	[EngLandeGenelKatalog] [bit] NULL,
	[KataloglarSayfasi] [bit] NULL,
	[index] [int] NULL,
	[kataloglarSayfa] [uniqueidentifier] NULL,
	[LKLK] [bit] NULL,
	[EngLKLK] [bit] NULL,
	[Aksesuar] [uniqueidentifier] NULL,
	[aksesuarGrubu] [uniqueidentifier] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Kataloglar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KataloglarSayfasi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KataloglarSayfasi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Baslik] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[BaslikEng] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[Index] [int] NULL,
	[Web] [bit] NULL,
	[EngWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_KataloglarSayfasi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KlasorDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KlasorDokumanlari](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[klasorler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
 CONSTRAINT [PK_KlasorDokumanlari] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klasorler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klasorler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KlasorAdi] [nvarchar](100) NULL,
	[KlasorKodu] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[klasorTipiEnum] [int] NULL,
	[parentKlasor] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ParentKlasorName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Klasorler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KpiDefinition]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiDefinition](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetObjectType] [nvarchar](max) NULL,
	[Changed] [datetime] NULL,
	[KpiInstance] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[Criteria] [nvarchar](max) NULL,
	[Expression] [nvarchar](max) NULL,
	[GreenZone] [float] NULL,
	[RedZone] [float] NULL,
	[Range] [nvarchar](100) NULL,
	[Compare] [bit] NULL,
	[RangeToCompare] [nvarchar](100) NULL,
	[MeasurementFrequency] [int] NULL,
	[MeasurementMode] [int] NULL,
	[Direction] [int] NULL,
	[ChangedOn] [datetime] NULL,
	[SuppressedSeries] [nvarchar](100) NULL,
	[EnableCustomizeRepresentation] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiDefinition] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KpiHistoryItem]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiHistoryItem](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KpiInstance] [uniqueidentifier] NULL,
	[RangeStart] [datetime] NULL,
	[RangeEnd] [datetime] NULL,
	[Value] [float] NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_KpiHistoryItem] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KpiInstance]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiInstance](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ForceMeasurementDateTime] [datetime] NULL,
	[KpiDefinition] [uniqueidentifier] NULL,
	[Settings] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiInstance] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KpiScorecard]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiScorecard](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiScorecard] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators](
	[Indicators] [uniqueidentifier] NULL,
	[Scorecards] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_KpiScorecardScorecards_KpiInstanceIndicators] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logolar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logolar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[kaliteDokumanlari] [uniqueidentifier] NULL,
	[LogoResmi] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Logolar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Malzeme] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaDataObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaDataObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[MediaData] [varbinary](max) NULL,
	[MediaDataKey] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_MediaDataObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelDifference]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelDifference](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserId] [nvarchar](100) NULL,
	[ContextId] [nvarchar](100) NULL,
	[Version] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ModelDifference] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelDifferenceAspect]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelDifferenceAspect](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Xml] [nvarchar](max) NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ModelDifferenceAspect] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MontajKlavuzlari](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[aksesuarGrubu] [uniqueidentifier] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_MontajKlavuzlari] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Author] [nvarchar](100) NULL,
	[DateTime] [datetime] NULL,
	[Text] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnayBekleyenDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnayBekleyenDokumanlar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[UserMid2] [uniqueidentifier] NULL,
	[red] [bit] NULL,
	[DokumanOlusturanKisi] [nvarchar](100) NULL,
	[DokumanOlusturulmaTarihi] [datetime] NULL,
	[DokumanOnaylanmaTarihi] [datetime] NULL,
	[FileOid] [uniqueidentifier] NULL,
	[onay] [bit] NULL,
	[ObjectType] [nvarchar](100) NULL,
	[yetkilendirme] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[urunAilesi] [nvarchar](100) NULL,
	[urunGrubu] [nvarchar](100) NULL,
	[urunSerisi] [nvarchar](100) NULL,
	[urunler] [nvarchar](100) NULL,
	[OcrText] [nvarchar](max) NULL,
 CONSTRAINT [PK_OnayBekleyenDokumanlar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Profile] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[WebSite] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtoKodTanim]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtoKodTanim](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[obje_adi] [nvarchar](100) NULL,
	[ObjectType] [nvarchar](100) NULL,
	[kod_on_tanim] [nvarchar](100) NULL,
	[uzunluk] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_OtoKodTanim] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ozellikler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ozellikler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OzellikAdi] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngOzellikAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Ozellikler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcalar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ParcaKodu] [nvarchar](100) NULL,
	[ParcaAdi] [nvarchar](100) NULL,
	[SeriKisaKodu] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Parcalar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Party]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Party](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Photo] [varbinary](max) NULL,
	[Address1] [uniqueidentifier] NULL,
	[Address2] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyMemberPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Members] [nvarchar](max) NULL,
	[ReadState] [int] NULL,
	[WriteState] [int] NULL,
	[Criteria] [nvarchar](max) NULL,
	[TypePermissionObject] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyMemberPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyNavigationPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyNavigationPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ItemPath] [nvarchar](max) NULL,
	[NavigateState] [int] NULL,
	[Role] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyNavigationPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyObjectPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Criteria] [nvarchar](max) NULL,
	[ReadState] [int] NULL,
	[WriteState] [int] NULL,
	[DeleteState] [int] NULL,
	[NavigateState] [int] NULL,
	[TypePermissionObject] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyObjectPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyRole]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyRole](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsAdministrative] [bit] NULL,
	[CanEditModel] [bit] NULL,
	[PermissionPolicy] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyRole] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyTypePermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Role] [uniqueidentifier] NULL,
	[TargetType] [nvarchar](max) NULL,
	[ReadState] [int] NULL,
	[WriteState] [int] NULL,
	[CreateState] [int] NULL,
	[DeleteState] [int] NULL,
	[NavigateState] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyTypePermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyUser]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyUser](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[StoredPassword] [nvarchar](max) NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyUser] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles](
	[Roles] [uniqueidentifier] NULL,
	[Users] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_PermissionPolicyUserUsers_PermissionPolicyRoleRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistentPermission]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistentPermission](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SerializedPermission] [nvarchar](4000) NULL,
	[Role] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PersistentPermission] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[Birthday] [datetime] NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumber]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumber](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Number] [nvarchar](100) NULL,
	[Party] [uniqueidentifier] NULL,
	[PhoneType] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyBag]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyBag](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PropertyBag] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyBagDescriptor]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyBagDescriptor](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PropertyBagDescriptor] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyDescriptor]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDescriptor](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Code] [nvarchar](4) NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PropertyDescriptor] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags](
	[PropertyBags] [uniqueidentifier] NULL,
	[PropertyDescriptors] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyValue]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyValue](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Descriptor] [uniqueidentifier] NULL,
	[Bag] [uniqueidentifier] NULL,
	[StrValue] [nvarchar](100) NULL,
	[WeakReference] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_PropertyValue] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklamlar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklamlar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Image] [varbinary](max) NULL,
	[Baslik] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Web] [int] NULL,
	[Aktif] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Reklamlar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renk]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renk](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[renk] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngRenk] [nvarchar](100) NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Renk] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportData]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportData](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ObjectTypeName] [nvarchar](512) NULL,
	[Content] [varbinary](max) NULL,
	[Name] [nvarchar](100) NULL,
	[IsInplaceReport] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ReportData] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportDataV2]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportDataV2](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ObjectTypeName] [nvarchar](512) NULL,
	[Content] [varbinary](max) NULL,
	[Name] [nvarchar](100) NULL,
	[ParametersObjectTypeName] [nvarchar](512) NULL,
	[IsInplaceReport] [bit] NULL,
	[PredefinedReportType] [nvarchar](512) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ReportDataV2] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Caption] [nvarchar](100) NULL,
	[Color] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceResources_EventEvents]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceResources_EventEvents](
	[Events] [uniqueidentifier] NULL,
	[Resources] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_ResourceResources_EventEvents] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revizeler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[teknikCizimler] [uniqueidentifier] NULL,
	[uretimDokumanlari] [uniqueidentifier] NULL,
	[fotograflar] [uniqueidentifier] NULL,
	[kaliteDokumanlari] [uniqueidentifier] NULL,
	[klasorDokumanlari] [uniqueidentifier] NULL,
	[RevizeEdenKisi] [nvarchar](100) NULL,
	[RevizeNedeni] [nvarchar](100) NULL,
	[RevizeDokuman] [uniqueidentifier] NULL,
	[YeniDokuman] [uniqueidentifier] NULL,
	[digerDokumanlar] [uniqueidentifier] NULL,
	[Web] [bit] NULL,
	[MontajKlavuzlari] [uniqueidentifier] NULL,
	[RevizeTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[RevizeNedenleri] [uniqueidentifier] NULL,
	[sertifikaDoc] [uniqueidentifier] NULL,
	[sertifikaDokumanlari] [uniqueidentifier] NULL,
	[MakineyeIslendi] [bit] NULL,
	[teknikSartname] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Revizeler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevizeNedenleri]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevizeNedenleri](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[RevizeNedeni] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_RevizeNedenleri] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RichTextMailMergeData]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RichTextMailMergeData](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DataType] [nvarchar](100) NULL,
	[Template] [varbinary](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_RichTextMailMergeData] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleBase]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleBase](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_RoleBase] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemMemberPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Members] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[Criteria] [nvarchar](max) NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SecuritySystemMemberPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemObjectPermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Criteria] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[AllowNavigate] [bit] NULL,
	[Owner] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SecuritySystemObjectPermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemRole]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRole](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[IsAdministrative] [bit] NULL,
	[CanEditModel] [bit] NULL,
 CONSTRAINT [PK_SecuritySystemRole] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles](
	[ChildRoles] [uniqueidentifier] NULL,
	[ParentRoles] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemTypePermissionsObject](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetType] [nvarchar](max) NULL,
	[AllowRead] [bit] NULL,
	[AllowWrite] [bit] NULL,
	[AllowCreate] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[AllowNavigate] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
	[Owner] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SecuritySystemTypePermissionsObject] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemUser]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUser](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[StoredPassword] [nvarchar](max) NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[UserName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_SecuritySystemUser] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles](
	[Roles] [uniqueidentifier] NULL,
	[Users] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_SecuritySystemUserUsers_SecuritySystemRoleRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sertifikalar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[OcrText] [nvarchar](max) NULL,
	[fotograf] [varbinary](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[GenelSayfadaGoster] [bit] NULL,
	[LKLK] [bit] NULL,
	[aksesuarGrubu] [uniqueidentifier] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sertifikalar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerPrefix]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerPrefix](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Prefix] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_ServerPrefix] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SimpleUser]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SimpleUser](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsAdministrator] [bit] NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[Password] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_SimpleUser] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ShortName] [nvarchar](100) NULL,
	[LongName] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taglar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taglar](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[teknikCizimler] [uniqueidentifier] NULL,
	[uretimDokumanlari] [uniqueidentifier] NULL,
	[fotograflar] [uniqueidentifier] NULL,
	[kaliteDokumanlari] [uniqueidentifier] NULL,
	[Tag] [nvarchar](100) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[digerDokumanlar] [uniqueidentifier] NULL,
	[kapakOpsiyonlari] [uniqueidentifier] NULL,
	[montajKlavuzlari] [uniqueidentifier] NULL,
	[klasorDokumanlari] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[sertifikaDoc] [uniqueidentifier] NULL,
	[sertifikaDokumanlari] [uniqueidentifier] NULL,
	[teknikSartname] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Taglar] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateCompleted] [datetime] NULL,
	[Subject] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[AssignedTo] [uniqueidentifier] NULL,
	[Status] [int] NULL,
	[PercentCompleted] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeknikCizimler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[aksesuarGrubu] [uniqueidentifier] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_TeknikCizimler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeknikSartname](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[OcrText] [nvarchar](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngWebDokumanAdi] [nvarchar](100) NULL,
	[GenelSayfadaGoster] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_TeknikSartname] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Update]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Update](
	[Update_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[AutoManual] [nvarchar](1) NULL,
 CONSTRAINT [PK_Update] PRIMARY KEY CLUSTERED 
(
	[Update_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UretimDokumanlari](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[File] [uniqueidentifier] NULL,
	[aksesuar] [uniqueidentifier] NULL,
	[parcalar] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[DokumanAdi] [nvarchar](100) NULL,
	[dokumanUzanti] [nvarchar](100) NULL,
	[DokumanType] [int] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[onay] [bit] NULL,
	[red] [bit] NULL,
	[OcrText] [nvarchar](max) NULL,
	[WebDokumanAdi] [nvarchar](100) NULL,
 CONSTRAINT [PK_UretimDokumanlari] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunAilesi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunAilesi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UrunAilesiAdi] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngUrunAilesiAdi] [nvarchar](100) NULL,
	[EngWeb] [bit] NULL,
	[EngAciklama] [nvarchar](max) NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_UrunAilesi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDegerler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDegerler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Deger] [nvarchar](100) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[urunler] [uniqueidentifier] NULL,
	[degerler] [uniqueidentifier] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngDeger] [nvarchar](100) NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_UrunDegerler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunGrubu]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunGrubu](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UrunGrubuAdi] [nvarchar](100) NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Web] [bit] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngUrunGrubuAdi] [nvarchar](100) NULL,
	[EngAciklama] [nvarchar](max) NULL,
	[EngWeb] [bit] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_UrunGrubu] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[boyut] [uniqueidentifier] NULL,
	[yukseklik] [uniqueidentifier] NULL,
	[renk] [uniqueidentifier] NULL,
	[StokKodu] [nvarchar](100) NULL,
	[StokAdi] [nvarchar](100) NULL,
	[KatalogKodu] [nvarchar](100) NULL,
	[IngStokAdi] [nvarchar](max) NULL,
	[Birim] [nvarchar](100) NULL,
	[Uretim] [int] NULL,
	[Satis] [int] NULL,
	[SatinAlma] [int] NULL,
	[AnaUrunGrubu] [nvarchar](100) NULL,
	[AltUrunTipi] [nvarchar](100) NULL,
	[SatisAnalizGrubu] [int] NULL,
	[AltUrunGrubu] [nvarchar](100) NULL,
	[UrunCinsi] [nvarchar](100) NULL,
	[UrunTuru] [nvarchar](100) NULL,
	[Barkod] [nvarchar](100) NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Web] [bit] NULL,
	[urunSerisi] [uniqueidentifier] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngAciklama] [nvarchar](max) NULL,
	[EngWeb] [bit] NULL,
	[ilkFoto] [bit] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunlerurunler_Aksesuaraksesuar]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunlerurunler_Aksesuaraksesuar](
	[aksesuar] [uniqueidentifier] NULL,
	[urunler] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_Urunlerurunler_Aksesuaraksesuar] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunSerisi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunSerisi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UrunSerisiAdi] [nvarchar](100) NULL,
	[urunAilesi] [uniqueidentifier] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Web] [bit] NULL,
	[urunGrubu] [uniqueidentifier] NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[EngUrunSerisiAdi] [nvarchar](100) NULL,
	[EngAciklama] [nvarchar](max) NULL,
	[EngWeb] [bit] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
	[WebUrl] [nvarchar](100) NULL,
	[EngWebUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_UrunSerisi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[StoredPassword] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[ChangePasswordOnFirstLogon] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMid2]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMid2](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[AdiSoyadi] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[telefon] [nvarchar](100) NULL,
	[departmanlar] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserMid2] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUsers_RoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUsers_RoleRoles](
	[Roles] [uniqueidentifier] NULL,
	[Users] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_UserUsers_RoleRoles] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideolarSayfasi]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideolarSayfasi](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[Baslik] [nvarchar](100) NULL,
	[BaslikEng] [nvarchar](100) NULL,
	[Index] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[Web] [bit] NULL,
	[EngWeb] [bit] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_VideolarSayfasi] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPObjectType]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPObjectType](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [nvarchar](254) NULL,
	[AssemblyName] [nvarchar](254) NULL,
 CONSTRAINT [PK_XPObjectType] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoInstanceKey]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoInstanceKey](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[KeyId] [uniqueidentifier] NULL,
	[InstanceId] [uniqueidentifier] NULL,
	[Properties] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoInstanceKey] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoRunningWorkflowInstanceInfo]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoRunningWorkflowInstanceInfo](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[WorkflowName] [nvarchar](255) NULL,
	[WorkflowUniqueId] [nvarchar](255) NULL,
	[TargetObjectHandle] [nvarchar](255) NULL,
	[ActivityInstanceId] [uniqueidentifier] NULL,
	[State] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoRunningWorkflowInstanceInfo] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoStartWorkflowRequest]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoStartWorkflowRequest](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetWorkflowUniqueId] [nvarchar](100) NULL,
	[TargetObjectKey] [nvarchar](100) NULL,
	[TargetObjectType] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoStartWorkflowRequest] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoState]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoState](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Caption] [nvarchar](100) NULL,
	[StateMachine] [uniqueidentifier] NULL,
	[MarkerValue] [nvarchar](max) NULL,
	[TargetObjectCriteria] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoState] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoStateAppearance]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoStateAppearance](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[State] [uniqueidentifier] NULL,
	[AppearanceItemType] [nvarchar](100) NULL,
	[Context] [nvarchar](100) NULL,
	[Criteria] [nvarchar](max) NULL,
	[Method] [nvarchar](100) NULL,
	[TargetItems] [nvarchar](100) NULL,
	[Priority] [int] NULL,
	[FontColor] [int] NULL,
	[BackColor] [int] NULL,
	[FontStyle] [int] NULL,
	[Enabled] [bit] NULL,
	[Visibility] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoStateAppearance] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoStateMachine]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoStateMachine](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[TargetObjectType] [nvarchar](100) NULL,
	[StatePropertyName] [nvarchar](100) NULL,
	[StartState] [uniqueidentifier] NULL,
	[ExpandActionsInDetailView] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoStateMachine] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoTrackingRecord]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoTrackingRecord](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InstanceId] [uniqueidentifier] NULL,
	[DateTime] [datetime] NULL,
	[Data] [nvarchar](max) NULL,
	[ActivityId] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoTrackingRecord] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoTransition]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoTransition](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Caption] [nvarchar](100) NULL,
	[SourceState] [uniqueidentifier] NULL,
	[TargetState] [uniqueidentifier] NULL,
	[Index] [int] NULL,
	[SaveAndCloseView] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoTransition] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoUserActivityVersion]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoUserActivityVersion](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[WorkflowUniqueId] [nvarchar](100) NULL,
	[Xaml] [nvarchar](max) NULL,
	[Version] [int] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoUserActivityVersion] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoWorkflowDefinition]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoWorkflowDefinition](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Xaml] [nvarchar](max) NULL,
	[TargetObjectType] [nvarchar](100) NULL,
	[Criteria] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[AutoStartWhenObjectIsCreated] [bit] NULL,
	[AutoStartWhenObjectFitsCriteria] [bit] NULL,
	[AllowMultipleRuns] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoWorkflowDefinition] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoWorkflowInstance]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoWorkflowInstance](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Owner] [nvarchar](100) NULL,
	[InstanceId] [uniqueidentifier] NULL,
	[Status] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[Metadata] [nvarchar](max) NULL,
	[ExpirationDateTime] [datetime] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoWorkflowInstance] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpoWorkflowInstanceControlCommandRequest]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpoWorkflowInstanceControlCommandRequest](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetWorkflowUniqueId] [nvarchar](100) NULL,
	[TargetActivityInstanceId] [uniqueidentifier] NULL,
	[Command] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Result] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XpoWorkflowInstanceControlCommandRequest] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPWeakReference]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPWeakReference](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetType] [int] NULL,
	[TargetKey] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_XPWeakReference] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XtraReportData]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XtraReportData](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ObjectTypeName] [nvarchar](512) NULL,
	[Content] [varbinary](max) NULL,
	[Name] [nvarchar](100) NULL,
	[ParametersObjectTypeName] [nvarchar](100) NULL,
	[IsInplaceReport] [bit] NULL,
	[PredefinedReportType] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_XtraReportData] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetkilendirme]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetkilendirme](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[departmanlar] [uniqueidentifier] NULL,
	[id] [int] NULL,
	[yetkili] [uniqueidentifier] NULL,
	[ObjectType] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_Yetkilendirme] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YoutubeVideo]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YoutubeVideo](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[link] [nvarchar](100) NULL,
	[aciklama] [nvarchar](max) NULL,
	[OlusturmaTarihi] [datetime] NULL,
	[OlusturanKisi] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ResimLinki] [nvarchar](100) NULL,
	[Value] [nvarchar](100) NULL,
	[AnasayfadaGoster] [bit] NULL,
	[EngAciklama] [nvarchar](100) NULL,
	[videolarSayfasi] [uniqueidentifier] NULL,
	[Index] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_YoutubeVideo] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yukseklik]    Script Date: 10.03.2021 17:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yukseklik](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Yuksek] [nvarchar](100) NULL,
	[Web] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[SonGuncellemeTarihi] [datetime] NULL,
 CONSTRAINT [PK_Yukseklik] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [iCountry_Address]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iCountry_Address] ON [dbo].[Address]
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Address]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Address] ON [dbo].[Address]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAksesuarGrubu_Aksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAksesuarGrubu_Aksesuar] ON [dbo].[Aksesuar]
(
	[AksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iboyut_Aksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iboyut_Aksesuar] ON [dbo].[Aksesuar]
(
	[boyut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Aksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Aksesuar] ON [dbo].[Aksesuar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iyukseklik_Aksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iyukseklik_Aksesuar] ON [dbo].[Aksesuar]
(
	[yukseklik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_aksesuarDeger]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_aksesuarDeger] ON [dbo].[aksesuarDeger]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idegerler_aksesuarDeger]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idegerler_aksesuarDeger] ON [dbo].[aksesuarDeger]
(
	[degerler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_aksesuarDeger]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_aksesuarDeger] ON [dbo].[aksesuarDeger]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_AksesuarGrubu]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_AksesuarGrubu] ON [dbo].[AksesuarGrubu]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Analysis]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Analysis] ON [dbo].[Analysis]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAuditedObject_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAuditedObject_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[AuditedObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iModifiedOn_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iModifiedOn_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[ModifiedOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iNewObject_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iNewObject_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[NewObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOldObject_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOldObject_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[OldObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [iOperationType_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOperationType_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[OperationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [iUserName_AuditDataItemPersistent]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUserName_AuditDataItemPersistent] ON [dbo].[AuditDataItemPersistent]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Banner]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Banner] ON [dbo].[Banner]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUrunSerisi_Banner]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUrunSerisi_Banner] ON [dbo].[Banner]
(
	[UrunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_BasicUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_BasicUser] ON [dbo].[BasicUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Boyut]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Boyut] ON [dbo].[Boyut]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Country]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Country] ON [dbo].[Country]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Currency]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Currency] ON [dbo].[Currency]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_DashboardData]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_DashboardData] ON [dbo].[DashboardData]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iDegerTipi_Degerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iDegerTipi_Degerler] ON [dbo].[Degerler]
(
	[DegerTipi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Degerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Degerler] ON [dbo].[Degerler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iozellikler_Degerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iozellikler_Degerler] ON [dbo].[Degerler]
(
	[ozellikler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Degerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Degerler] ON [dbo].[Degerler]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_DegerTipleri]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_DegerTipleri] ON [dbo].[DegerTipleri]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iDepartmanMuduru_Departmanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iDepartmanMuduru_Departmanlar] ON [dbo].[Departmanlar]
(
	[DepartmanMuduru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Departmanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Departmanlar] ON [dbo].[Departmanlar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_DigerDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_DigerDokumanlar] ON [dbo].[DigerDokumanlar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_EmailListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_EmailListesi] ON [dbo].[EmailListesi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iEndOn_Event]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iEndOn_Event] ON [dbo].[Event]
(
	[EndOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Event]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Event] ON [dbo].[Event]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRecurrencePattern_Event]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRecurrencePattern_Event] ON [dbo].[Event]
(
	[RecurrencePattern] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iStartOn_Event]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iStartOn_Event] ON [dbo].[Event]
(
	[StartOn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_FileData]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_FileData] ON [dbo].[FileData]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iCurrency_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iCurrency_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[Currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ifileData_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ifileData_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[fileData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_FiyatListesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_FiyatListesi] ON [dbo].[FiyatListesi]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_Fotograflar] ON [dbo].[Fotograflar]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_Fotograflar] ON [dbo].[Fotograflar]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Fotograflar] ON [dbo].[Fotograflar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikapakOpsiyonlari_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikapakOpsiyonlari_Fotograflar] ON [dbo].[Fotograflar]
(
	[kapakOpsiyonlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_Fotograflar] ON [dbo].[Fotograflar]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Fotograflar] ON [dbo].[Fotograflar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Fotograflar] ON [dbo].[Fotograflar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Fotograflar] ON [dbo].[Fotograflar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Fotograflar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Fotograflar] ON [dbo].[Fotograflar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Haberler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Haberler] ON [dbo].[Haberler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_HCategory]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_HCategory] ON [dbo].[HCategory]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iParent_HCategory]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iParent_HCategory] ON [dbo].[HCategory]
(
	[Parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarGrubu_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuarGrubu_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[aksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_KaliteDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_KaliteDokumanlari] ON [dbo].[KaliteDokumanlari]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_KapakOpsiyonDoc]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_KapakOpsiyonDoc] ON [dbo].[KapakOpsiyonDoc]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KapakOpsiyonDoc]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KapakOpsiyonDoc] ON [dbo].[KapakOpsiyonDoc]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKapakOpsiyonlari_KapakOpsiyonDoc]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iKapakOpsiyonlari_KapakOpsiyonDoc] ON [dbo].[KapakOpsiyonDoc]
(
	[KapakOpsiyonlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KapakOpsiyonlari] ON [dbo].[KapakOpsiyonlari]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_KapakOpsiyonlari] ON [dbo].[KapakOpsiyonlari]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_KapakOpsiyonlari] ON [dbo].[KapakOpsiyonlari]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_KapakOpsiyonlari] ON [dbo].[KapakOpsiyonlari]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_KapakOpsiyonlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_KapakOpsiyonlari] ON [dbo].[KapakOpsiyonlari]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAksesuar_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAksesuar_Kataloglar] ON [dbo].[Kataloglar]
(
	[Aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarGrubu_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuarGrubu_Kataloglar] ON [dbo].[Kataloglar]
(
	[aksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_Kataloglar] ON [dbo].[Kataloglar]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Kataloglar] ON [dbo].[Kataloglar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikataloglarSayfa_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikataloglarSayfa_Kataloglar] ON [dbo].[Kataloglar]
(
	[kataloglarSayfa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Kataloglar] ON [dbo].[Kataloglar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Kataloglar] ON [dbo].[Kataloglar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Kataloglar] ON [dbo].[Kataloglar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Kataloglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Kataloglar] ON [dbo].[Kataloglar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KataloglarSayfasi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KataloglarSayfasi] ON [dbo].[KataloglarSayfasi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_KlasorDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_KlasorDokumanlari] ON [dbo].[KlasorDokumanlari]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KlasorDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KlasorDokumanlari] ON [dbo].[KlasorDokumanlari]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iklasorler_KlasorDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iklasorler_KlasorDokumanlari] ON [dbo].[KlasorDokumanlari]
(
	[klasorler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Klasorler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Klasorler] ON [dbo].[Klasorler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparentKlasor_Klasorler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparentKlasor_Klasorler] ON [dbo].[Klasorler]
(
	[parentKlasor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KpiDefinition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KpiDefinition] ON [dbo].[KpiDefinition]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKpiInstance_KpiDefinition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iKpiInstance_KpiDefinition] ON [dbo].[KpiDefinition]
(
	[KpiInstance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKpiInstance_KpiHistoryItem]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iKpiInstance_KpiHistoryItem] ON [dbo].[KpiHistoryItem]
(
	[KpiInstance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KpiInstance]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KpiInstance] ON [dbo].[KpiInstance]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iKpiDefinition_KpiInstance]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iKpiDefinition_KpiInstance] ON [dbo].[KpiInstance]
(
	[KpiDefinition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_KpiScorecard]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_KpiScorecard] ON [dbo].[KpiScorecard]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iIndicators_KpiScorecardScorecards_KpiInstanceIndicators]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iIndicators_KpiScorecardScorecards_KpiInstanceIndicators] ON [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]
(
	[Indicators] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iIndicatorsScorecards_KpiScorecardScorecards_KpiInstanceIndicators]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iIndicatorsScorecards_KpiScorecardScorecards_KpiInstanceIndicators] ON [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]
(
	[Indicators] ASC,
	[Scorecards] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iScorecards_KpiScorecardScorecards_KpiInstanceIndicators]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iScorecards_KpiScorecardScorecards_KpiInstanceIndicators] ON [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]
(
	[Scorecards] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Logolar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Logolar] ON [dbo].[Logolar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikaliteDokumanlari_Logolar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikaliteDokumanlari_Logolar] ON [dbo].[Logolar]
(
	[kaliteDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Material]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Material] ON [dbo].[Material]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_MediaDataObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_MediaDataObject] ON [dbo].[MediaDataObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ModelDifference]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ModelDifference] ON [dbo].[ModelDifference]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ModelDifferenceAspect]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ModelDifferenceAspect] ON [dbo].[ModelDifferenceAspect]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_ModelDifferenceAspect]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOwner_ModelDifferenceAspect] ON [dbo].[ModelDifferenceAspect]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarGrubu_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuarGrubu_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[aksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_MontajKlavuzlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_MontajKlavuzlari] ON [dbo].[MontajKlavuzlari]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Note]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Note] ON [dbo].[Note]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_OnayBekleyenDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_OnayBekleyenDokumanlar] ON [dbo].[OnayBekleyenDokumanlar]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_OnayBekleyenDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_OnayBekleyenDokumanlar] ON [dbo].[OnayBekleyenDokumanlar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUserMid2_OnayBekleyenDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUserMid2_OnayBekleyenDokumanlar] ON [dbo].[OnayBekleyenDokumanlar]
(
	[UserMid2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iyetkilendirme_OnayBekleyenDokumanlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iyetkilendirme_OnayBekleyenDokumanlar] ON [dbo].[OnayBekleyenDokumanlar]
(
	[yetkilendirme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_OtoKodTanim]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_OtoKodTanim] ON [dbo].[OtoKodTanim]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Ozellikler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Ozellikler] ON [dbo].[Ozellikler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Parcalar] ON [dbo].[Parcalar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Parcalar] ON [dbo].[Parcalar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Parcalar] ON [dbo].[Parcalar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Parcalar] ON [dbo].[Parcalar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Parcalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Parcalar] ON [dbo].[Parcalar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAddress1_Party]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAddress1_Party] ON [dbo].[Party]
(
	[Address1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAddress2_Party]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAddress2_Party] ON [dbo].[Party]
(
	[Address2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Party]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Party] ON [dbo].[Party]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_Party]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_Party] ON [dbo].[Party]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyMemberPermissionsObject] ON [dbo].[PermissionPolicyMemberPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iTypePermissionObject_PermissionPolicyMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iTypePermissionObject_PermissionPolicyMemberPermissionsObject] ON [dbo].[PermissionPolicyMemberPermissionsObject]
(
	[TypePermissionObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyNavigationPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyNavigationPermissionsObject] ON [dbo].[PermissionPolicyNavigationPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRole_PermissionPolicyNavigationPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRole_PermissionPolicyNavigationPermissionsObject] ON [dbo].[PermissionPolicyNavigationPermissionsObject]
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyObjectPermissionsObject] ON [dbo].[PermissionPolicyObjectPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iTypePermissionObject_PermissionPolicyObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iTypePermissionObject_PermissionPolicyObjectPermissionsObject] ON [dbo].[PermissionPolicyObjectPermissionsObject]
(
	[TypePermissionObject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyRole]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyRole] ON [dbo].[PermissionPolicyRole]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_PermissionPolicyRole]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_PermissionPolicyRole] ON [dbo].[PermissionPolicyRole]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyTypePermissionsObject] ON [dbo].[PermissionPolicyTypePermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRole_PermissionPolicyTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRole_PermissionPolicyTypePermissionsObject] ON [dbo].[PermissionPolicyTypePermissionsObject]
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PermissionPolicyUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PermissionPolicyUser] ON [dbo].[PermissionPolicyUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_PermissionPolicyUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_PermissionPolicyUser] ON [dbo].[PermissionPolicyUser]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRoles_PermissionPolicyUserUsers_PermissionPolicyRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRoles_PermissionPolicyUserUsers_PermissionPolicyRoleRoles] ON [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]
(
	[Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRolesUsers_PermissionPolicyUserUsers_PermissionPolicyRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iRolesUsers_PermissionPolicyUserUsers_PermissionPolicyRoleRoles] ON [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]
(
	[Roles] ASC,
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUsers_PermissionPolicyUserUsers_PermissionPolicyRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUsers_PermissionPolicyUserUsers_PermissionPolicyRoleRoles] ON [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PersistentPermission]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PersistentPermission] ON [dbo].[PersistentPermission]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRole_PersistentPermission]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRole_PersistentPermission] ON [dbo].[PersistentPermission]
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PhoneNumber]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PhoneNumber] ON [dbo].[PhoneNumber]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iParty_PhoneNumber]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iParty_PhoneNumber] ON [dbo].[PhoneNumber]
(
	[Party] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PhoneType]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PhoneType] ON [dbo].[PhoneType]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PropertyBag]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PropertyBag] ON [dbo].[PropertyBag]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PropertyBagDescriptor]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PropertyBagDescriptor] ON [dbo].[PropertyBagDescriptor]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [iCode_PropertyDescriptor]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iCode_PropertyDescriptor] ON [dbo].[PropertyDescriptor]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PropertyDescriptor]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PropertyDescriptor] ON [dbo].[PropertyDescriptor]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iPropertyBags_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iPropertyBags_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] ON [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]
(
	[PropertyBags] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iPropertyBagsPropertyDescriptors_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iPropertyBagsPropertyDescriptors_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] ON [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]
(
	[PropertyBags] ASC,
	[PropertyDescriptors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iPropertyDescriptors_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iPropertyDescriptors_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] ON [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]
(
	[PropertyDescriptors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iBag_PropertyValue]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iBag_PropertyValue] ON [dbo].[PropertyValue]
(
	[Bag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iDescriptor_PropertyValue]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iDescriptor_PropertyValue] ON [dbo].[PropertyValue]
(
	[Descriptor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_PropertyValue]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_PropertyValue] ON [dbo].[PropertyValue]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iWeakReference_PropertyValue]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iWeakReference_PropertyValue] ON [dbo].[PropertyValue]
(
	[WeakReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Reklamlar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Reklamlar] ON [dbo].[Reklamlar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Renk]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Renk] ON [dbo].[Renk]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ReportData]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ReportData] ON [dbo].[ReportData]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ReportDataV2]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ReportDataV2] ON [dbo].[ReportDataV2]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Resource]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Resource] ON [dbo].[Resource]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iEvents_ResourceResources_EventEvents]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iEvents_ResourceResources_EventEvents] ON [dbo].[ResourceResources_EventEvents]
(
	[Events] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iEventsResources_ResourceResources_EventEvents]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iEventsResources_ResourceResources_EventEvents] ON [dbo].[ResourceResources_EventEvents]
(
	[Events] ASC,
	[Resources] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iResources_ResourceResources_EventEvents]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iResources_ResourceResources_EventEvents] ON [dbo].[ResourceResources_EventEvents]
(
	[Resources] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idigerDokumanlar_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idigerDokumanlar_Revizeler] ON [dbo].[Revizeler]
(
	[digerDokumanlar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ifotograflar_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ifotograflar_Revizeler] ON [dbo].[Revizeler]
(
	[fotograflar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Revizeler] ON [dbo].[Revizeler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikaliteDokumanlari_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikaliteDokumanlari_Revizeler] ON [dbo].[Revizeler]
(
	[kaliteDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iklasorDokumanlari_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iklasorDokumanlari_Revizeler] ON [dbo].[Revizeler]
(
	[klasorDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iMontajKlavuzlari_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iMontajKlavuzlari_Revizeler] ON [dbo].[Revizeler]
(
	[MontajKlavuzlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRevizeDokuman_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRevizeDokuman_Revizeler] ON [dbo].[Revizeler]
(
	[RevizeDokuman] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRevizeNedenleri_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRevizeNedenleri_Revizeler] ON [dbo].[Revizeler]
(
	[RevizeNedenleri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [isertifikaDoc_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [isertifikaDoc_Revizeler] ON [dbo].[Revizeler]
(
	[sertifikaDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [isertifikaDokumanlari_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [isertifikaDokumanlari_Revizeler] ON [dbo].[Revizeler]
(
	[sertifikaDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iteknikCizimler_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iteknikCizimler_Revizeler] ON [dbo].[Revizeler]
(
	[teknikCizimler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iteknikSartname_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iteknikSartname_Revizeler] ON [dbo].[Revizeler]
(
	[teknikSartname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iuretimDokumanlari_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iuretimDokumanlari_Revizeler] ON [dbo].[Revizeler]
(
	[uretimDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iYeniDokuman_Revizeler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iYeniDokuman_Revizeler] ON [dbo].[Revizeler]
(
	[YeniDokuman] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_RevizeNedenleri]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_RevizeNedenleri] ON [dbo].[RevizeNedenleri]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_RichTextMailMergeData]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_RichTextMailMergeData] ON [dbo].[RichTextMailMergeData]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_RoleBase]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_RoleBase] ON [dbo].[RoleBase]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_RoleBase]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_RoleBase] ON [dbo].[RoleBase]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemMemberPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemMemberPermissionsObject] ON [dbo].[SecuritySystemMemberPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemObjectPermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemObjectPermissionsObject] ON [dbo].[SecuritySystemObjectPermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemRole]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemRole]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemRole] ON [dbo].[SecuritySystemRole]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iChildRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iChildRolesParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ChildRoles] ASC,
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iParentRoles_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] ON [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]
(
	[ParentRoles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iOwner_SecuritySystemTypePermissionsObject]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iOwner_SecuritySystemTypePermissionsObject] ON [dbo].[SecuritySystemTypePermissionsObject]
(
	[Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SecuritySystemUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_SecuritySystemUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_SecuritySystemUser] ON [dbo].[SecuritySystemUser]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRoles_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iRolesUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Roles] ASC,
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUsers_SecuritySystemUserUsers_SecuritySystemRoleRoles] ON [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarGrubu_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuarGrubu_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[aksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Sertifikalar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Sertifikalar] ON [dbo].[Sertifikalar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_ServerPrefix]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_ServerPrefix] ON [dbo].[ServerPrefix]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_SimpleUser]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_SimpleUser] ON [dbo].[SimpleUser]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_State]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_State] ON [dbo].[State]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_Taglar] ON [dbo].[Taglar]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idigerDokumanlar_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idigerDokumanlar_Taglar] ON [dbo].[Taglar]
(
	[digerDokumanlar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ifotograflar_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ifotograflar_Taglar] ON [dbo].[Taglar]
(
	[fotograflar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Taglar] ON [dbo].[Taglar]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikaliteDokumanlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikaliteDokumanlari_Taglar] ON [dbo].[Taglar]
(
	[kaliteDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ikapakOpsiyonlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ikapakOpsiyonlari_Taglar] ON [dbo].[Taglar]
(
	[kapakOpsiyonlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iklasorDokumanlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iklasorDokumanlari_Taglar] ON [dbo].[Taglar]
(
	[klasorDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [imontajKlavuzlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [imontajKlavuzlari_Taglar] ON [dbo].[Taglar]
(
	[montajKlavuzlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_Taglar] ON [dbo].[Taglar]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [isertifikaDoc_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [isertifikaDoc_Taglar] ON [dbo].[Taglar]
(
	[sertifikaDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [isertifikaDokumanlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [isertifikaDokumanlari_Taglar] ON [dbo].[Taglar]
(
	[sertifikaDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iteknikCizimler_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iteknikCizimler_Taglar] ON [dbo].[Taglar]
(
	[teknikCizimler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iteknikSartname_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iteknikSartname_Taglar] ON [dbo].[Taglar]
(
	[teknikSartname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iuretimDokumanlari_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iuretimDokumanlari_Taglar] ON [dbo].[Taglar]
(
	[uretimDokumanlari] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Taglar] ON [dbo].[Taglar]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Taglar] ON [dbo].[Taglar]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Taglar] ON [dbo].[Taglar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Taglar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Taglar] ON [dbo].[Taglar]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iAssignedTo_Task]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iAssignedTo_Task] ON [dbo].[Task]
(
	[AssignedTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Task]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Task] ON [dbo].[Task]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarGrubu_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuarGrubu_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[aksesuarGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_TeknikCizimler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_TeknikCizimler] ON [dbo].[TeknikCizimler]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_TeknikSartname]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_TeknikSartname] ON [dbo].[TeknikSartname]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iFile_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iFile_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[File] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iparcalar_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iparcalar_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[parcalar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_UretimDokumanlari]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_UretimDokumanlari] ON [dbo].[UretimDokumanlari]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_UrunAilesi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_UrunAilesi] ON [dbo].[UrunAilesi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idegerler_UrunDegerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idegerler_UrunDegerler] ON [dbo].[UrunDegerler]
(
	[degerler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_UrunDegerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_UrunDegerler] ON [dbo].[UrunDegerler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_UrunDegerler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_UrunDegerler] ON [dbo].[UrunDegerler]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_UrunGrubu]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_UrunGrubu] ON [dbo].[UrunGrubu]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_UrunGrubu]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_UrunGrubu] ON [dbo].[UrunGrubu]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iboyut_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iboyut_Urunler] ON [dbo].[Urunler]
(
	[boyut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Urunler] ON [dbo].[Urunler]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [irenk_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [irenk_Urunler] ON [dbo].[Urunler]
(
	[renk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_Urunler] ON [dbo].[Urunler]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_Urunler] ON [dbo].[Urunler]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunSerisi_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunSerisi_Urunler] ON [dbo].[Urunler]
(
	[urunSerisi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iyukseklik_Urunler]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iyukseklik_Urunler] ON [dbo].[Urunler]
(
	[yukseklik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuar_Urunlerurunler_Aksesuaraksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iaksesuar_Urunlerurunler_Aksesuaraksesuar] ON [dbo].[Urunlerurunler_Aksesuaraksesuar]
(
	[aksesuar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iaksesuarurunler_Urunlerurunler_Aksesuaraksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iaksesuarurunler_Urunlerurunler_Aksesuaraksesuar] ON [dbo].[Urunlerurunler_Aksesuaraksesuar]
(
	[aksesuar] ASC,
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunler_Urunlerurunler_Aksesuaraksesuar]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunler_Urunlerurunler_Aksesuaraksesuar] ON [dbo].[Urunlerurunler_Aksesuaraksesuar]
(
	[urunler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_UrunSerisi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_UrunSerisi] ON [dbo].[UrunSerisi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunAilesi_UrunSerisi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunAilesi_UrunSerisi] ON [dbo].[UrunSerisi]
(
	[urunAilesi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iurunGrubu_UrunSerisi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iurunGrubu_UrunSerisi] ON [dbo].[UrunSerisi]
(
	[urunGrubu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idepartmanlar_UserMid2]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idepartmanlar_UserMid2] ON [dbo].[UserMid2]
(
	[departmanlar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRoles_UserUsers_RoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iRoles_UserUsers_RoleRoles] ON [dbo].[UserUsers_RoleRoles]
(
	[Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iRolesUsers_UserUsers_RoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iRolesUsers_UserUsers_RoleRoles] ON [dbo].[UserUsers_RoleRoles]
(
	[Roles] ASC,
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iUsers_UserUsers_RoleRoles]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iUsers_UserUsers_RoleRoles] ON [dbo].[UserUsers_RoleRoles]
(
	[Users] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_VideolarSayfasi]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_VideolarSayfasi] ON [dbo].[VideolarSayfasi]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [iTypeName_XPObjectType]    Script Date: 10.03.2021 17:12:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [iTypeName_XPObjectType] ON [dbo].[XPObjectType]
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoInstanceKey]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoInstanceKey] ON [dbo].[XpoInstanceKey]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoRunningWorkflowInstanceInfo]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoRunningWorkflowInstanceInfo] ON [dbo].[XpoRunningWorkflowInstanceInfo]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoStartWorkflowRequest]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoStartWorkflowRequest] ON [dbo].[XpoStartWorkflowRequest]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoState]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoState] ON [dbo].[XpoState]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iStateMachine_XpoState]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iStateMachine_XpoState] ON [dbo].[XpoState]
(
	[StateMachine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoStateAppearance]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoStateAppearance] ON [dbo].[XpoStateAppearance]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iState_XpoStateAppearance]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iState_XpoStateAppearance] ON [dbo].[XpoStateAppearance]
(
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoStateMachine]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoStateMachine] ON [dbo].[XpoStateMachine]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iStartState_XpoStateMachine]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iStartState_XpoStateMachine] ON [dbo].[XpoStateMachine]
(
	[StartState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoTrackingRecord]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoTrackingRecord] ON [dbo].[XpoTrackingRecord]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoTransition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoTransition] ON [dbo].[XpoTransition]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iSourceState_XpoTransition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iSourceState_XpoTransition] ON [dbo].[XpoTransition]
(
	[SourceState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iTargetState_XpoTransition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iTargetState_XpoTransition] ON [dbo].[XpoTransition]
(
	[TargetState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoUserActivityVersion]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoUserActivityVersion] ON [dbo].[XpoUserActivityVersion]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoWorkflowDefinition]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoWorkflowDefinition] ON [dbo].[XpoWorkflowDefinition]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoWorkflowInstance]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoWorkflowInstance] ON [dbo].[XpoWorkflowInstance]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XpoWorkflowInstanceControlCommandRequest]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XpoWorkflowInstanceControlCommandRequest] ON [dbo].[XpoWorkflowInstanceControlCommandRequest]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XPWeakReference]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XPWeakReference] ON [dbo].[XPWeakReference]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iObjectType_XPWeakReference]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iObjectType_XPWeakReference] ON [dbo].[XPWeakReference]
(
	[ObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iTargetType_XPWeakReference]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iTargetType_XPWeakReference] ON [dbo].[XPWeakReference]
(
	[TargetType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_XtraReportData]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_XtraReportData] ON [dbo].[XtraReportData]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idepartmanlar_Yetkilendirme]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [idepartmanlar_Yetkilendirme] ON [dbo].[Yetkilendirme]
(
	[departmanlar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Yetkilendirme]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Yetkilendirme] ON [dbo].[Yetkilendirme]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iyetkili_Yetkilendirme]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iyetkili_Yetkilendirme] ON [dbo].[Yetkilendirme]
(
	[yetkili] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_YoutubeVideo]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_YoutubeVideo] ON [dbo].[YoutubeVideo]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ivideolarSayfasi_YoutubeVideo]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [ivideolarSayfasi_YoutubeVideo] ON [dbo].[YoutubeVideo]
(
	[videolarSayfasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [iGCRecord_Yukseklik]    Script Date: 10.03.2021 17:12:14 ******/
CREATE NONCLUSTERED INDEX [iGCRecord_Yukseklik] ON [dbo].[Yukseklik]
(
	[GCRecord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH NOCHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_AksesuarGrubu] FOREIGN KEY([AksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_AksesuarGrubu]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_boyut] FOREIGN KEY([boyut])
REFERENCES [dbo].[Boyut] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_boyut]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_urunAilesi]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_urunGrubu]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_urunler]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_urunSerisi]
GO
ALTER TABLE [dbo].[Aksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Aksesuar_yukseklik] FOREIGN KEY([yukseklik])
REFERENCES [dbo].[Yukseklik] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Aksesuar] CHECK CONSTRAINT [FK_Aksesuar_yukseklik]
GO
ALTER TABLE [dbo].[aksesuarDeger]  WITH NOCHECK ADD  CONSTRAINT [FK_aksesuarDeger_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aksesuarDeger] CHECK CONSTRAINT [FK_aksesuarDeger_aksesuar]
GO
ALTER TABLE [dbo].[aksesuarDeger]  WITH NOCHECK ADD  CONSTRAINT [FK_aksesuarDeger_degerler] FOREIGN KEY([degerler])
REFERENCES [dbo].[Degerler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[aksesuarDeger] CHECK CONSTRAINT [FK_aksesuarDeger_degerler]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_AuditedObject] FOREIGN KEY([AuditedObject])
REFERENCES [dbo].[AuditedObjectWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_AuditedObject]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_NewObject] FOREIGN KEY([NewObject])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_NewObject]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_OldObject] FOREIGN KEY([OldObject])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_OldObject]
GO
ALTER TABLE [dbo].[AuditedObjectWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditedObjectWeakReference_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditedObjectWeakReference] CHECK CONSTRAINT [FK_AuditedObjectWeakReference_Oid]
GO
ALTER TABLE [dbo].[Banner]  WITH NOCHECK ADD  CONSTRAINT [FK_Banner_UrunSerisi] FOREIGN KEY([UrunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_UrunSerisi]
GO
ALTER TABLE [dbo].[Degerler]  WITH NOCHECK ADD  CONSTRAINT [FK_Degerler_DegerTipi] FOREIGN KEY([DegerTipi])
REFERENCES [dbo].[DegerTipleri] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Degerler] CHECK CONSTRAINT [FK_Degerler_DegerTipi]
GO
ALTER TABLE [dbo].[Degerler]  WITH NOCHECK ADD  CONSTRAINT [FK_Degerler_ozellikler] FOREIGN KEY([ozellikler])
REFERENCES [dbo].[Ozellikler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Degerler] CHECK CONSTRAINT [FK_Degerler_ozellikler]
GO
ALTER TABLE [dbo].[Degerler]  WITH NOCHECK ADD  CONSTRAINT [FK_Degerler_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Degerler] CHECK CONSTRAINT [FK_Degerler_urunler]
GO
ALTER TABLE [dbo].[Departmanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_Departmanlar_DepartmanMuduru] FOREIGN KEY([DepartmanMuduru])
REFERENCES [dbo].[UserMid2] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Departmanlar] CHECK CONSTRAINT [FK_Departmanlar_DepartmanMuduru]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_aksesuar]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_File]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_parcalar]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_urunAilesi]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_urunGrubu]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_urunler]
GO
ALTER TABLE [dbo].[DigerDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_DigerDokumanlar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[DigerDokumanlar] CHECK CONSTRAINT [FK_DigerDokumanlar_urunSerisi]
GO
ALTER TABLE [dbo].[Event]  WITH NOCHECK ADD  CONSTRAINT [FK_Event_RecurrencePattern] FOREIGN KEY([RecurrencePattern])
REFERENCES [dbo].[Event] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_RecurrencePattern]
GO
ALTER TABLE [dbo].[ExtendedSecurityRole]  WITH NOCHECK ADD  CONSTRAINT [FK_ExtendedSecurityRole_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[PermissionPolicyRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ExtendedSecurityRole] CHECK CONSTRAINT [FK_ExtendedSecurityRole_Oid]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_aksesuar]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_Currency] FOREIGN KEY([Currency])
REFERENCES [dbo].[Currency] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_Currency]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_File]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_fileData] FOREIGN KEY([fileData])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_fileData]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_parcalar]
GO
ALTER TABLE [dbo].[FiyatListesi]  WITH NOCHECK ADD  CONSTRAINT [FK_FiyatListesi_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[FiyatListesi] CHECK CONSTRAINT [FK_FiyatListesi_urunler]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_aksesuar]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_File]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_kapakOpsiyonlari] FOREIGN KEY([kapakOpsiyonlari])
REFERENCES [dbo].[KapakOpsiyonlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_kapakOpsiyonlari]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_parcalar]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_urunAilesi]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_urunGrubu]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_urunler]
GO
ALTER TABLE [dbo].[Fotograflar]  WITH NOCHECK ADD  CONSTRAINT [FK_Fotograflar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Fotograflar] CHECK CONSTRAINT [FK_Fotograflar_urunSerisi]
GO
ALTER TABLE [dbo].[HCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_HCategory_Parent] FOREIGN KEY([Parent])
REFERENCES [dbo].[HCategory] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[HCategory] CHECK CONSTRAINT [FK_HCategory_Parent]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_aksesuar]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_aksesuarGrubu] FOREIGN KEY([aksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_aksesuarGrubu]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_File]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_parcalar]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_urunAilesi]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_urunGrubu]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_urunler]
GO
ALTER TABLE [dbo].[KaliteDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KaliteDokumanlari_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KaliteDokumanlari] CHECK CONSTRAINT [FK_KaliteDokumanlari_urunSerisi]
GO
ALTER TABLE [dbo].[KapakOpsiyonDoc]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonDoc_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonDoc] CHECK CONSTRAINT [FK_KapakOpsiyonDoc_File]
GO
ALTER TABLE [dbo].[KapakOpsiyonDoc]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonDoc_KapakOpsiyonlari] FOREIGN KEY([KapakOpsiyonlari])
REFERENCES [dbo].[KapakOpsiyonlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonDoc] CHECK CONSTRAINT [FK_KapakOpsiyonDoc_KapakOpsiyonlari]
GO
ALTER TABLE [dbo].[KapakOpsiyonlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonlari_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonlari] CHECK CONSTRAINT [FK_KapakOpsiyonlari_urunAilesi]
GO
ALTER TABLE [dbo].[KapakOpsiyonlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonlari_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonlari] CHECK CONSTRAINT [FK_KapakOpsiyonlari_urunGrubu]
GO
ALTER TABLE [dbo].[KapakOpsiyonlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonlari_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonlari] CHECK CONSTRAINT [FK_KapakOpsiyonlari_urunler]
GO
ALTER TABLE [dbo].[KapakOpsiyonlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KapakOpsiyonlari_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KapakOpsiyonlari] CHECK CONSTRAINT [FK_KapakOpsiyonlari_urunSerisi]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_Aksesuar] FOREIGN KEY([Aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_Aksesuar]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_aksesuarGrubu] FOREIGN KEY([aksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_aksesuarGrubu]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_File]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_kataloglarSayfa] FOREIGN KEY([kataloglarSayfa])
REFERENCES [dbo].[KataloglarSayfasi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_kataloglarSayfa]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_urunAilesi]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_urunGrubu]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_urunler]
GO
ALTER TABLE [dbo].[Kataloglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Kataloglar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Kataloglar] CHECK CONSTRAINT [FK_Kataloglar_urunSerisi]
GO
ALTER TABLE [dbo].[KlasorDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KlasorDokumanlari_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KlasorDokumanlari] CHECK CONSTRAINT [FK_KlasorDokumanlari_File]
GO
ALTER TABLE [dbo].[KlasorDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_KlasorDokumanlari_klasorler] FOREIGN KEY([klasorler])
REFERENCES [dbo].[Klasorler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KlasorDokumanlari] CHECK CONSTRAINT [FK_KlasorDokumanlari_klasorler]
GO
ALTER TABLE [dbo].[Klasorler]  WITH NOCHECK ADD  CONSTRAINT [FK_Klasorler_parentKlasor] FOREIGN KEY([parentKlasor])
REFERENCES [dbo].[Klasorler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Klasorler] CHECK CONSTRAINT [FK_Klasorler_parentKlasor]
GO
ALTER TABLE [dbo].[KpiDefinition]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiDefinition_KpiInstance] FOREIGN KEY([KpiInstance])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiDefinition] CHECK CONSTRAINT [FK_KpiDefinition_KpiInstance]
GO
ALTER TABLE [dbo].[KpiHistoryItem]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiHistoryItem_KpiInstance] FOREIGN KEY([KpiInstance])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiHistoryItem] CHECK CONSTRAINT [FK_KpiHistoryItem_KpiInstance]
GO
ALTER TABLE [dbo].[KpiInstance]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiInstance_KpiDefinition] FOREIGN KEY([KpiDefinition])
REFERENCES [dbo].[KpiDefinition] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiInstance] CHECK CONSTRAINT [FK_KpiInstance_KpiDefinition]
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Indicators] FOREIGN KEY([Indicators])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators] CHECK CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Indicators]
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Scorecards] FOREIGN KEY([Scorecards])
REFERENCES [dbo].[KpiScorecard] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators] CHECK CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Scorecards]
GO
ALTER TABLE [dbo].[Logolar]  WITH NOCHECK ADD  CONSTRAINT [FK_Logolar_kaliteDokumanlari] FOREIGN KEY([kaliteDokumanlari])
REFERENCES [dbo].[KaliteDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Logolar] CHECK CONSTRAINT [FK_Logolar_kaliteDokumanlari]
GO
ALTER TABLE [dbo].[ModelDifferenceAspect]  WITH NOCHECK ADD  CONSTRAINT [FK_ModelDifferenceAspect_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[ModelDifference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ModelDifferenceAspect] CHECK CONSTRAINT [FK_ModelDifferenceAspect_Owner]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_aksesuar]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_aksesuarGrubu] FOREIGN KEY([aksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_aksesuarGrubu]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_File]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_parcalar]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_urunAilesi]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_urunGrubu]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_urunler]
GO
ALTER TABLE [dbo].[MontajKlavuzlari]  WITH NOCHECK ADD  CONSTRAINT [FK_MontajKlavuzlari_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[MontajKlavuzlari] CHECK CONSTRAINT [FK_MontajKlavuzlari_urunSerisi]
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_OnayBekleyenDokumanlar_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar] CHECK CONSTRAINT [FK_OnayBekleyenDokumanlar_File]
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_OnayBekleyenDokumanlar_UserMid2] FOREIGN KEY([UserMid2])
REFERENCES [dbo].[UserMid2] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar] CHECK CONSTRAINT [FK_OnayBekleyenDokumanlar_UserMid2]
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_OnayBekleyenDokumanlar_yetkilendirme] FOREIGN KEY([yetkilendirme])
REFERENCES [dbo].[Yetkilendirme] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[OnayBekleyenDokumanlar] CHECK CONSTRAINT [FK_OnayBekleyenDokumanlar_yetkilendirme]
GO
ALTER TABLE [dbo].[Organization]  WITH NOCHECK ADD  CONSTRAINT [FK_Organization_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[Party] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_Oid]
GO
ALTER TABLE [dbo].[Parcalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Parcalar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Parcalar] CHECK CONSTRAINT [FK_Parcalar_urunAilesi]
GO
ALTER TABLE [dbo].[Parcalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Parcalar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Parcalar] CHECK CONSTRAINT [FK_Parcalar_urunGrubu]
GO
ALTER TABLE [dbo].[Parcalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Parcalar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Parcalar] CHECK CONSTRAINT [FK_Parcalar_urunler]
GO
ALTER TABLE [dbo].[Parcalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Parcalar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Parcalar] CHECK CONSTRAINT [FK_Parcalar_urunSerisi]
GO
ALTER TABLE [dbo].[Party]  WITH NOCHECK ADD  CONSTRAINT [FK_Party_Address1] FOREIGN KEY([Address1])
REFERENCES [dbo].[Address] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Party] CHECK CONSTRAINT [FK_Party_Address1]
GO
ALTER TABLE [dbo].[Party]  WITH NOCHECK ADD  CONSTRAINT [FK_Party_Address2] FOREIGN KEY([Address2])
REFERENCES [dbo].[Address] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Party] CHECK CONSTRAINT [FK_Party_Address2]
GO
ALTER TABLE [dbo].[Party]  WITH NOCHECK ADD  CONSTRAINT [FK_Party_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Party] CHECK CONSTRAINT [FK_Party_ObjectType]
GO
ALTER TABLE [dbo].[PermissionPolicyMemberPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyMemberPermissionsObject_TypePermissionObject] FOREIGN KEY([TypePermissionObject])
REFERENCES [dbo].[PermissionPolicyTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyMemberPermissionsObject] CHECK CONSTRAINT [FK_PermissionPolicyMemberPermissionsObject_TypePermissionObject]
GO
ALTER TABLE [dbo].[PermissionPolicyNavigationPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyNavigationPermissionsObject_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[PermissionPolicyRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyNavigationPermissionsObject] CHECK CONSTRAINT [FK_PermissionPolicyNavigationPermissionsObject_Role]
GO
ALTER TABLE [dbo].[PermissionPolicyObjectPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyObjectPermissionsObject_TypePermissionObject] FOREIGN KEY([TypePermissionObject])
REFERENCES [dbo].[PermissionPolicyTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyObjectPermissionsObject] CHECK CONSTRAINT [FK_PermissionPolicyObjectPermissionsObject_TypePermissionObject]
GO
ALTER TABLE [dbo].[PermissionPolicyRole]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyRole_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyRole] CHECK CONSTRAINT [FK_PermissionPolicyRole_ObjectType]
GO
ALTER TABLE [dbo].[PermissionPolicyTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyTypePermissionsObject_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[PermissionPolicyRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyTypePermissionsObject] CHECK CONSTRAINT [FK_PermissionPolicyTypePermissionsObject_Role]
GO
ALTER TABLE [dbo].[PermissionPolicyUser]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyUser_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyUser] CHECK CONSTRAINT [FK_PermissionPolicyUser_ObjectType]
GO
ALTER TABLE [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyUserUsers_PermissionPolicyRoleRoles_Roles] FOREIGN KEY([Roles])
REFERENCES [dbo].[PermissionPolicyRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles] CHECK CONSTRAINT [FK_PermissionPolicyUserUsers_PermissionPolicyRoleRoles_Roles]
GO
ALTER TABLE [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_PermissionPolicyUserUsers_PermissionPolicyRoleRoles_Users] FOREIGN KEY([Users])
REFERENCES [dbo].[PermissionPolicyUser] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PermissionPolicyUserUsers_PermissionPolicyRoleRoles] CHECK CONSTRAINT [FK_PermissionPolicyUserUsers_PermissionPolicyRoleRoles_Users]
GO
ALTER TABLE [dbo].[PersistentPermission]  WITH NOCHECK ADD  CONSTRAINT [FK_PersistentPermission_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[RoleBase] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PersistentPermission] CHECK CONSTRAINT [FK_PersistentPermission_Role]
GO
ALTER TABLE [dbo].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_Person_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[Party] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Oid]
GO
ALTER TABLE [dbo].[PhoneNumber]  WITH NOCHECK ADD  CONSTRAINT [FK_PhoneNumber_Party] FOREIGN KEY([Party])
REFERENCES [dbo].[Party] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_Party]
GO
ALTER TABLE [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags_PropertyBags] FOREIGN KEY([PropertyBags])
REFERENCES [dbo].[PropertyBagDescriptor] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] CHECK CONSTRAINT [FK_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags_PropertyBags]
GO
ALTER TABLE [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags_PropertyDescriptors] FOREIGN KEY([PropertyDescriptors])
REFERENCES [dbo].[PropertyDescriptor] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags] CHECK CONSTRAINT [FK_PropertyDescriptorPropertyDescriptors_PropertyBagDescriptorPropertyBags_PropertyDescriptors]
GO
ALTER TABLE [dbo].[PropertyValue]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyValue_Bag] FOREIGN KEY([Bag])
REFERENCES [dbo].[PropertyBag] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PropertyValue] CHECK CONSTRAINT [FK_PropertyValue_Bag]
GO
ALTER TABLE [dbo].[PropertyValue]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyValue_Descriptor] FOREIGN KEY([Descriptor])
REFERENCES [dbo].[PropertyDescriptor] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PropertyValue] CHECK CONSTRAINT [FK_PropertyValue_Descriptor]
GO
ALTER TABLE [dbo].[PropertyValue]  WITH NOCHECK ADD  CONSTRAINT [FK_PropertyValue_WeakReference] FOREIGN KEY([WeakReference])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[PropertyValue] CHECK CONSTRAINT [FK_PropertyValue_WeakReference]
GO
ALTER TABLE [dbo].[ResourceResources_EventEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ResourceResources_EventEvents_Events] FOREIGN KEY([Events])
REFERENCES [dbo].[Event] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ResourceResources_EventEvents] CHECK CONSTRAINT [FK_ResourceResources_EventEvents_Events]
GO
ALTER TABLE [dbo].[ResourceResources_EventEvents]  WITH NOCHECK ADD  CONSTRAINT [FK_ResourceResources_EventEvents_Resources] FOREIGN KEY([Resources])
REFERENCES [dbo].[Resource] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ResourceResources_EventEvents] CHECK CONSTRAINT [FK_ResourceResources_EventEvents_Resources]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_digerDokumanlar] FOREIGN KEY([digerDokumanlar])
REFERENCES [dbo].[DigerDokumanlar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_digerDokumanlar]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_fotograflar] FOREIGN KEY([fotograflar])
REFERENCES [dbo].[Fotograflar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_fotograflar]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_kaliteDokumanlari] FOREIGN KEY([kaliteDokumanlari])
REFERENCES [dbo].[KaliteDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_kaliteDokumanlari]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_klasorDokumanlari] FOREIGN KEY([klasorDokumanlari])
REFERENCES [dbo].[KlasorDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_klasorDokumanlari]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_MontajKlavuzlari] FOREIGN KEY([MontajKlavuzlari])
REFERENCES [dbo].[MontajKlavuzlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_MontajKlavuzlari]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_RevizeDokuman] FOREIGN KEY([RevizeDokuman])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_RevizeDokuman]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_RevizeNedenleri] FOREIGN KEY([RevizeNedenleri])
REFERENCES [dbo].[RevizeNedenleri] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_RevizeNedenleri]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_sertifikaDokumanlari] FOREIGN KEY([sertifikaDokumanlari])
REFERENCES [dbo].[Sertifikalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_sertifikaDokumanlari]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_teknikCizimler] FOREIGN KEY([teknikCizimler])
REFERENCES [dbo].[TeknikCizimler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_teknikCizimler]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_teknikSartname] FOREIGN KEY([teknikSartname])
REFERENCES [dbo].[TeknikSartname] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_teknikSartname]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_uretimDokumanlari] FOREIGN KEY([uretimDokumanlari])
REFERENCES [dbo].[UretimDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_uretimDokumanlari]
GO
ALTER TABLE [dbo].[Revizeler]  WITH NOCHECK ADD  CONSTRAINT [FK_Revizeler_YeniDokuman] FOREIGN KEY([YeniDokuman])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Revizeler] CHECK CONSTRAINT [FK_Revizeler_YeniDokuman]
GO
ALTER TABLE [dbo].[Role]  WITH NOCHECK ADD  CONSTRAINT [FK_Role_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[RoleBase] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Oid]
GO
ALTER TABLE [dbo].[RoleBase]  WITH NOCHECK ADD  CONSTRAINT [FK_RoleBase_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[RoleBase] CHECK CONSTRAINT [FK_RoleBase_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemMemberPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemMemberPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemTypePermissionsObject] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemObjectPermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemObjectPermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemRole]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRole_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRole] CHECK CONSTRAINT [FK_SecuritySystemRole_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles] FOREIGN KEY([ChildRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ChildRoles]
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles] FOREIGN KEY([ParentRoles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles] CHECK CONSTRAINT [FK_SecuritySystemRoleParentRoles_SecuritySystemRoleChildRoles_ParentRoles]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner] FOREIGN KEY([Owner])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemTypePermissionsObject] CHECK CONSTRAINT [FK_SecuritySystemTypePermissionsObject_Owner]
GO
ALTER TABLE [dbo].[SecuritySystemUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUser_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUser] CHECK CONSTRAINT [FK_SecuritySystemUser_ObjectType]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles] FOREIGN KEY([Roles])
REFERENCES [dbo].[SecuritySystemRole] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Roles]
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users] FOREIGN KEY([Users])
REFERENCES [dbo].[SecuritySystemUser] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SecuritySystemUserUsers_SecuritySystemRoleRoles] CHECK CONSTRAINT [FK_SecuritySystemUserUsers_SecuritySystemRoleRoles_Users]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_aksesuar]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_aksesuarGrubu] FOREIGN KEY([aksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_aksesuarGrubu]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_File]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_parcalar]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_urunAilesi]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_urunGrubu]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_urunler]
GO
ALTER TABLE [dbo].[Sertifikalar]  WITH NOCHECK ADD  CONSTRAINT [FK_Sertifikalar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sertifikalar] CHECK CONSTRAINT [FK_Sertifikalar_urunSerisi]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_aksesuar]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_digerDokumanlar] FOREIGN KEY([digerDokumanlar])
REFERENCES [dbo].[DigerDokumanlar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_digerDokumanlar]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_fotograflar] FOREIGN KEY([fotograflar])
REFERENCES [dbo].[Fotograflar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_fotograflar]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_kaliteDokumanlari] FOREIGN KEY([kaliteDokumanlari])
REFERENCES [dbo].[KaliteDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_kaliteDokumanlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_kapakOpsiyonlari] FOREIGN KEY([kapakOpsiyonlari])
REFERENCES [dbo].[KapakOpsiyonlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_kapakOpsiyonlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_klasorDokumanlari] FOREIGN KEY([klasorDokumanlari])
REFERENCES [dbo].[KlasorDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_klasorDokumanlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_montajKlavuzlari] FOREIGN KEY([montajKlavuzlari])
REFERENCES [dbo].[MontajKlavuzlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_montajKlavuzlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_parcalar]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_sertifikaDokumanlari] FOREIGN KEY([sertifikaDokumanlari])
REFERENCES [dbo].[Sertifikalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_sertifikaDokumanlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_teknikCizimler] FOREIGN KEY([teknikCizimler])
REFERENCES [dbo].[TeknikCizimler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_teknikCizimler]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_teknikSartname] FOREIGN KEY([teknikSartname])
REFERENCES [dbo].[TeknikSartname] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_teknikSartname]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_uretimDokumanlari] FOREIGN KEY([uretimDokumanlari])
REFERENCES [dbo].[UretimDokumanlari] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_uretimDokumanlari]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_urunAilesi]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_urunGrubu]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_urunler]
GO
ALTER TABLE [dbo].[Taglar]  WITH NOCHECK ADD  CONSTRAINT [FK_Taglar_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Taglar] CHECK CONSTRAINT [FK_Taglar_urunSerisi]
GO
ALTER TABLE [dbo].[Task]  WITH NOCHECK ADD  CONSTRAINT [FK_Task_AssignedTo] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[Party] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_AssignedTo]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_aksesuar]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_aksesuarGrubu] FOREIGN KEY([aksesuarGrubu])
REFERENCES [dbo].[AksesuarGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_aksesuarGrubu]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_File]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_parcalar]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_urunAilesi]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_urunGrubu]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_urunler]
GO
ALTER TABLE [dbo].[TeknikCizimler]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikCizimler_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikCizimler] CHECK CONSTRAINT [FK_TeknikCizimler_urunSerisi]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_aksesuar]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_File]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_urunAilesi]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_urunGrubu]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_urunler]
GO
ALTER TABLE [dbo].[TeknikSartname]  WITH NOCHECK ADD  CONSTRAINT [FK_TeknikSartname_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TeknikSartname] CHECK CONSTRAINT [FK_TeknikSartname_urunSerisi]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_aksesuar]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_File] FOREIGN KEY([File])
REFERENCES [dbo].[FileData] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_File]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_parcalar] FOREIGN KEY([parcalar])
REFERENCES [dbo].[Parcalar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_parcalar]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_urunAilesi]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_urunGrubu]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_urunler]
GO
ALTER TABLE [dbo].[UretimDokumanlari]  WITH NOCHECK ADD  CONSTRAINT [FK_UretimDokumanlari_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UretimDokumanlari] CHECK CONSTRAINT [FK_UretimDokumanlari_urunSerisi]
GO
ALTER TABLE [dbo].[UrunDegerler]  WITH NOCHECK ADD  CONSTRAINT [FK_UrunDegerler_degerler] FOREIGN KEY([degerler])
REFERENCES [dbo].[Degerler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UrunDegerler] CHECK CONSTRAINT [FK_UrunDegerler_degerler]
GO
ALTER TABLE [dbo].[UrunDegerler]  WITH NOCHECK ADD  CONSTRAINT [FK_UrunDegerler_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UrunDegerler] CHECK CONSTRAINT [FK_UrunDegerler_urunler]
GO
ALTER TABLE [dbo].[UrunGrubu]  WITH NOCHECK ADD  CONSTRAINT [FK_UrunGrubu_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UrunGrubu] CHECK CONSTRAINT [FK_UrunGrubu_urunAilesi]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_boyut] FOREIGN KEY([boyut])
REFERENCES [dbo].[Boyut] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_boyut]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_renk] FOREIGN KEY([renk])
REFERENCES [dbo].[Renk] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_renk]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_urunAilesi]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_urunGrubu]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_urunSerisi] FOREIGN KEY([urunSerisi])
REFERENCES [dbo].[UrunSerisi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_urunSerisi]
GO
ALTER TABLE [dbo].[Urunler]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunler_yukseklik] FOREIGN KEY([yukseklik])
REFERENCES [dbo].[Yukseklik] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_yukseklik]
GO
ALTER TABLE [dbo].[Urunlerurunler_Aksesuaraksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunlerurunler_Aksesuaraksesuar_aksesuar] FOREIGN KEY([aksesuar])
REFERENCES [dbo].[Aksesuar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunlerurunler_Aksesuaraksesuar] CHECK CONSTRAINT [FK_Urunlerurunler_Aksesuaraksesuar_aksesuar]
GO
ALTER TABLE [dbo].[Urunlerurunler_Aksesuaraksesuar]  WITH NOCHECK ADD  CONSTRAINT [FK_Urunlerurunler_Aksesuaraksesuar_urunler] FOREIGN KEY([urunler])
REFERENCES [dbo].[Urunler] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Urunlerurunler_Aksesuaraksesuar] CHECK CONSTRAINT [FK_Urunlerurunler_Aksesuaraksesuar_urunler]
GO
ALTER TABLE [dbo].[UrunSerisi]  WITH NOCHECK ADD  CONSTRAINT [FK_UrunSerisi_urunAilesi] FOREIGN KEY([urunAilesi])
REFERENCES [dbo].[UrunAilesi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UrunSerisi] CHECK CONSTRAINT [FK_UrunSerisi_urunAilesi]
GO
ALTER TABLE [dbo].[UrunSerisi]  WITH NOCHECK ADD  CONSTRAINT [FK_UrunSerisi_urunGrubu] FOREIGN KEY([urunGrubu])
REFERENCES [dbo].[UrunGrubu] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UrunSerisi] CHECK CONSTRAINT [FK_UrunSerisi_urunGrubu]
GO
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[Person] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Oid]
GO
ALTER TABLE [dbo].[UserMid2]  WITH NOCHECK ADD  CONSTRAINT [FK_UserMid2_departmanlar] FOREIGN KEY([departmanlar])
REFERENCES [dbo].[Departmanlar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UserMid2] CHECK CONSTRAINT [FK_UserMid2_departmanlar]
GO
ALTER TABLE [dbo].[UserMid2]  WITH NOCHECK ADD  CONSTRAINT [FK_UserMid2_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[PermissionPolicyUser] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UserMid2] CHECK CONSTRAINT [FK_UserMid2_Oid]
GO
ALTER TABLE [dbo].[UserUsers_RoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserUsers_RoleRoles_Roles] FOREIGN KEY([Roles])
REFERENCES [dbo].[Role] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UserUsers_RoleRoles] CHECK CONSTRAINT [FK_UserUsers_RoleRoles_Roles]
GO
ALTER TABLE [dbo].[UserUsers_RoleRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_UserUsers_RoleRoles_Users] FOREIGN KEY([Users])
REFERENCES [dbo].[User] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[UserUsers_RoleRoles] CHECK CONSTRAINT [FK_UserUsers_RoleRoles_Users]
GO
ALTER TABLE [dbo].[XpoState]  WITH NOCHECK ADD  CONSTRAINT [FK_XpoState_StateMachine] FOREIGN KEY([StateMachine])
REFERENCES [dbo].[XpoStateMachine] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XpoState] CHECK CONSTRAINT [FK_XpoState_StateMachine]
GO
ALTER TABLE [dbo].[XpoStateAppearance]  WITH NOCHECK ADD  CONSTRAINT [FK_XpoStateAppearance_State] FOREIGN KEY([State])
REFERENCES [dbo].[XpoState] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XpoStateAppearance] CHECK CONSTRAINT [FK_XpoStateAppearance_State]
GO
ALTER TABLE [dbo].[XpoStateMachine]  WITH NOCHECK ADD  CONSTRAINT [FK_XpoStateMachine_StartState] FOREIGN KEY([StartState])
REFERENCES [dbo].[XpoState] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XpoStateMachine] CHECK CONSTRAINT [FK_XpoStateMachine_StartState]
GO
ALTER TABLE [dbo].[XpoTransition]  WITH NOCHECK ADD  CONSTRAINT [FK_XpoTransition_SourceState] FOREIGN KEY([SourceState])
REFERENCES [dbo].[XpoState] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XpoTransition] CHECK CONSTRAINT [FK_XpoTransition_SourceState]
GO
ALTER TABLE [dbo].[XpoTransition]  WITH NOCHECK ADD  CONSTRAINT [FK_XpoTransition_TargetState] FOREIGN KEY([TargetState])
REFERENCES [dbo].[XpoState] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XpoTransition] CHECK CONSTRAINT [FK_XpoTransition_TargetState]
GO
ALTER TABLE [dbo].[XPWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_XPWeakReference_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XPWeakReference] CHECK CONSTRAINT [FK_XPWeakReference_ObjectType]
GO
ALTER TABLE [dbo].[XPWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_XPWeakReference_TargetType] FOREIGN KEY([TargetType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XPWeakReference] CHECK CONSTRAINT [FK_XPWeakReference_TargetType]
GO
ALTER TABLE [dbo].[Yetkilendirme]  WITH NOCHECK ADD  CONSTRAINT [FK_Yetkilendirme_departmanlar] FOREIGN KEY([departmanlar])
REFERENCES [dbo].[Departmanlar] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Yetkilendirme] CHECK CONSTRAINT [FK_Yetkilendirme_departmanlar]
GO
ALTER TABLE [dbo].[Yetkilendirme]  WITH NOCHECK ADD  CONSTRAINT [FK_Yetkilendirme_yetkili] FOREIGN KEY([yetkili])
REFERENCES [dbo].[UserMid2] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Yetkilendirme] CHECK CONSTRAINT [FK_Yetkilendirme_yetkili]
GO
ALTER TABLE [dbo].[YoutubeVideo]  WITH NOCHECK ADD  CONSTRAINT [FK_YoutubeVideo_videolarSayfasi] FOREIGN KEY([videolarSayfasi])
REFERENCES [dbo].[VideolarSayfasi] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[YoutubeVideo] CHECK CONSTRAINT [FK_YoutubeVideo_videolarSayfasi]
GO
USE [master]
GO
ALTER DATABASE [test3] SET  READ_WRITE 
GO
