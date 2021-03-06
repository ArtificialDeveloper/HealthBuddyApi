USE [master]
GO
/****** Object:  Database [DB_HealthBuddy]    Script Date: 2019/03/14 09:58:35 ******/
CREATE DATABASE [DB_HealthBuddy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HealthBuddy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DB_HealthBuddy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_HealthBuddy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DB_HealthBuddy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_HealthBuddy] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HealthBuddy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HealthBuddy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HealthBuddy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HealthBuddy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_HealthBuddy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HealthBuddy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_HealthBuddy] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HealthBuddy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HealthBuddy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HealthBuddy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HealthBuddy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_HealthBuddy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_HealthBuddy] SET QUERY_STORE = OFF
GO
USE [DB_HealthBuddy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DB_HealthBuddy]
GO
/****** Object:  User [receptionist]    Script Date: 2019/03/14 09:58:35 ******/
CREATE USER [receptionist] FOR LOGIN [hbuser_receptionist] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nurse]    Script Date: 2019/03/14 09:58:35 ******/
CREATE USER [nurse] FOR LOGIN [hbuser_nurse] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [matron]    Script Date: 2019/03/14 09:58:35 ******/
CREATE USER [matron] FOR LOGIN [hbuser_matron] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [hb_receptionist]    Script Date: 2019/03/14 09:58:35 ******/
CREATE ROLE [hb_receptionist]
GO
/****** Object:  DatabaseRole [hb_nurse]    Script Date: 2019/03/14 09:58:35 ******/
CREATE ROLE [hb_nurse]
GO
/****** Object:  DatabaseRole [hb_matron]    Script Date: 2019/03/14 09:58:35 ******/
CREATE ROLE [hb_matron]
GO
ALTER ROLE [hb_receptionist] ADD MEMBER [receptionist]
GO
ALTER ROLE [hb_nurse] ADD MEMBER [nurse]
GO
ALTER ROLE [hb_matron] ADD MEMBER [matron]
GO
/****** Object:  Table [dbo].[tbl_Allergy]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Allergy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AllergyName] [varchar](30) NOT NULL,
	[AllergyDescription] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Appointment]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[AppointmentTime] [time](7) NOT NULL,
	[AppointmentReason] [varchar](max) NOT NULL,
	[AppointmentStatus] [varchar](100) NOT NULL,
	[PatientId] [int] NULL,
	[StaffId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Disease]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Disease](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiseaseName] [varchar](50) NULL,
	[DiseaseDescription] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Drug]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Drug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [varchar](30) NOT NULL,
	[DrugType] [varchar](15) NOT NULL,
	[DrugDecription] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DrugHistory]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DrugHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugIF] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Reason] [varchar](30) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[BatchNumber] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GeneralLog]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GeneralLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogSource] [varchar](max) NOT NULL,
	[LogMessage] [varchar](max) NOT NULL,
	[LogStackTrace] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HealthReport]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HealthReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BP] [varchar](10) NOT NULL,
	[Weight] [varchar](10) NOT NULL,
	[Height] [varchar](10) NOT NULL,
	[BMI] [varchar](10) NOT NULL,
	[Cholesterol] [varchar](10) NOT NULL,
	[Glucose] [varchar](10) NOT NULL,
	[Acuity] [varchar](10) NOT NULL,
	[PSA] [varchar](10) NOT NULL,
	[Smoking] [varchar](10) NOT NULL,
	[Checkupdate] [varchar](10) NOT NULL,
	[StaffId] [int] NULL,
	[PatientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kin]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityNumber] [varchar](13) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[CellphoneNumber] [varchar](10) NOT NULL,
	[PhysicalAddress] [varchar](max) NOT NULL,
	[Relationship] [varchar](15) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MedicalAid]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MedicalAid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicalAidName] [varchar](30) NOT NULL,
	[MedicalAidNumber] [varchar](20) NOT NULL,
	[MedicalTelephone] [varchar](10) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Medication]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Medication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dosage] [int] NOT NULL,
	[NumberOfDays] [int] NOT NULL,
	[PerDay] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[TotalPills] [int] NOT NULL,
	[PrescriptionId] [int] NULL,
	[DrugId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PasswordRecover]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PasswordRecover](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Q1] [int] NULL,
	[A1] [varchar](max) NOT NULL,
	[Q2] [int] NULL,
	[A2] [varchar](max) NOT NULL,
	[Q3] [int] NULL,
	[A3] [varchar](max) NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PatientAllergy]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PatientAllergy](
	[AllergyId] [int] NULL,
	[PatientId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PatientSymptom]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PatientSymptom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionId] [int] NULL,
	[SymptomId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Prescription]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Prescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionId] [varchar](12) NOT NULL,
	[PrescriptionDate] [date] NOT NULL,
	[Comment] [varchar](max) NOT NULL,
	[PatientId] [int] NULL,
	[StaffId] [int] NULL,
	[DiseaseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Queue]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Queue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [varchar](30) NOT NULL,
	[PatientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RecoveryQuestion]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RecoveryQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RoomAlert]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoomAlert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[RoomStatus] [varchar](20) NOT NULL,
	[StaffId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Stock]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[BatchNumber] [varchar](10) NOT NULL,
	[Expiery_Date] [datetime] NOT NULL,
	[DrugId] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Symptom]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Symptom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SymptomName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TestingReport]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TestingReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestReason] [varchar](50) NOT NULL,
	[SexWith] [varchar](20) NOT NULL,
	[FirstTimeTest] [varchar](10) NOT NULL,
	[TBScreen] [varchar](50) NOT NULL,
	[STIScreen] [varchar](50) NOT NULL,
	[ProtectionPicked] [varchar](6) NOT NULL,
	[TestStatus] [varchar](20) NOT NULL,
	[ReferallMode] [varchar](20) NOT NULL,
	[ReffredWhere] [varchar](20) NOT NULL,
	[Date_ested] [date] NOT NULL,
	[PatientId] [int] NULL,
	[StaffId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 2019/03/14 09:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[IdentityNumber] [varchar](13) NOT NULL,
	[MaritalStatus] [varchar](15) NOT NULL,
	[CellphoneNumber] [varchar](10) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[HomeLanguage] [varchar](30) NOT NULL,
	[PhysicalAddress] [varchar](max) NOT NULL,
	[Occupation] [varchar](15) NOT NULL,
	[LoginCred] [varchar](15) NULL,
	[Username] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Appointment]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Appointment]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_DrugHistory]  WITH CHECK ADD FOREIGN KEY([BatchNumber])
REFERENCES [dbo].[tbl_Stock] ([BatchNumber])
GO
ALTER TABLE [dbo].[tbl_HealthReport]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_HealthReport]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Kin]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_MedicalAid]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Medication]  WITH CHECK ADD FOREIGN KEY([DrugId])
REFERENCES [dbo].[tbl_Drug] ([Id])
GO
ALTER TABLE [dbo].[tbl_Medication]  WITH CHECK ADD FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[tbl_Prescription] ([Id])
GO
ALTER TABLE [dbo].[tbl_PasswordRecover]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_PasswordRecover]  WITH CHECK ADD FOREIGN KEY([Q1])
REFERENCES [dbo].[tbl_RecoveryQuestion] ([Id])
GO
ALTER TABLE [dbo].[tbl_PasswordRecover]  WITH CHECK ADD FOREIGN KEY([Q2])
REFERENCES [dbo].[tbl_RecoveryQuestion] ([Id])
GO
ALTER TABLE [dbo].[tbl_PasswordRecover]  WITH CHECK ADD FOREIGN KEY([Q3])
REFERENCES [dbo].[tbl_RecoveryQuestion] ([Id])
GO
ALTER TABLE [dbo].[tbl_PatientAllergy]  WITH CHECK ADD FOREIGN KEY([AllergyId])
REFERENCES [dbo].[tbl_Allergy] ([Id])
GO
ALTER TABLE [dbo].[tbl_PatientAllergy]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_PatientSymptom]  WITH CHECK ADD FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[tbl_Prescription] ([Id])
GO
ALTER TABLE [dbo].[tbl_PatientSymptom]  WITH CHECK ADD FOREIGN KEY([SymptomId])
REFERENCES [dbo].[tbl_Symptom] ([Id])
GO
ALTER TABLE [dbo].[tbl_Prescription]  WITH CHECK ADD FOREIGN KEY([DiseaseId])
REFERENCES [dbo].[tbl_Disease] ([Id])
GO
ALTER TABLE [dbo].[tbl_Prescription]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Prescription]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Queue]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_RoomAlert]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[tbl_Room] ([Id])
GO
ALTER TABLE [dbo].[tbl_RoomAlert]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_Stock]  WITH CHECK ADD FOREIGN KEY([DrugId])
REFERENCES [dbo].[tbl_Drug] ([Id])
GO
ALTER TABLE [dbo].[tbl_TestingReport]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_TestingReport]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [DB_HealthBuddy] SET  READ_WRITE 
GO
