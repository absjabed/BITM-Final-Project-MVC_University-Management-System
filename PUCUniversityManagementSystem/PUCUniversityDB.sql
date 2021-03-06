USE [master]
GO
/****** Object:  Database [PUCUniversityManagementDB]    Script Date: 2017-03-21 01:13:04 PM ******/
CREATE DATABASE [PUCUniversityManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PUCUniversityManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PUCUniversityManagementDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PUCUniversityManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PUCUniversityManagementDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PUCUniversityManagementDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PUCUniversityManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PUCUniversityManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PUCUniversityManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PUCUniversityManagementDB', N'ON'
GO
USE [PUCUniversityManagementDB]
GO
/****** Object:  Table [dbo].[AllocateClassRoom]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [varchar](50) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	[AllocationStatus] [bit] NULL CONSTRAINT [DF_t_AllocateClassRoom_AllocationStatus]  DEFAULT ((1)),
 CONSTRAINT [PK_t_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Credit] [float] NOT NULL,
	[Descirption] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_t_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignToTeacher]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_t_CourseAssignToTeacher_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_t_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](7) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_t_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_t_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[RegisterationDate] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_t_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentEnrollInCourse]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollInCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [nvarchar](50) NOT NULL,
	[IsStudentActive] [bit] NULL CONSTRAINT [DF_t_StudentEnrollInCourse_IsStudentActive]  DEFAULT ((1)),
 CONSTRAINT [PK_t_StudentEnrollInCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResults]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [nvarchar](5) NOT NULL,
	[IsStudentActive] [bit] NULL CONSTRAINT [DF_t_StudentResult_IsStudentActive]  DEFAULT ((1)),
 CONSTRAINT [PK_t_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [float] NOT NULL,
	[CreditTaken] [float] NOT NULL,
 CONSTRAINT [PK_t_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[GetStudentResult]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GetStudentResult]
AS
SELECT en.StudentId, c.Code,c.Name,COALESCE(r.Grade,'Not Graded yet') as Grade,r.IsStudentActive FROM StudentResults r RIGHT OUTER JOIN ( SELECT e.Id,e.StudentId,e.CourseId FROM StudentEnrollInCourse e WHERE  e.IsStudentActive=1) en ON r.CourseId=en.CourseId AND r.StudentId=en.StudentId INNER JOIN Course c ON en.CourseId=c.Id









GO
/****** Object:  View [dbo].[ScheduleOfClass]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ScheduleOfClass]
AS
SELECT d.Id as DepartmentId,c.Id AS CourseId,c.Code,c.Name,COALESCE(Room.Name,'Not sheduled yet') AS Room_Name,COALESCE(Day.Name,'Not sheduled yet') as Day_Name,

case when r.StartTime IS NULL THEN '00:00:00.0000000'
else CONVERT(varchar, r.StartTime) end as StartTime,
case when r.EndTime IS NULL THEN '00:00:00.0000000'
else CONVERT(varchar, r.EndTime) end as EndTime,
COALESCE(AllocationStatus,0) AS AllocationStatus
FROM Course c  LEFT OUTER JOIN AllocateClassRoom r
ON r.CourseId=c.Id LEFT OUTER JOIN Room  
ON r.RoomId=Room.Id LEFT OUTER JOIN Day 
ON r.DayId=Day.Id LEFT OUTER JOIN Departments d ON c.DepartmentId=d.Id 










GO
/****** Object:  View [dbo].[StudentResult]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create VIEW [dbo].[StudentResult]
AS
SELECT c.Id,c.Code,c.Name,r.Grade FROM Course c INNER JOIN ( SELECT r.Id,r.StudentId,r.CourseId,r.Grade FROM StudentResults r WHERE StudentId=2 ) r  ON  c.Id=r.CourseId 










GO
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] ON 

INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (1, 1, 1, 1, 1, N'09:30 AM', N'10:30 AM', 0)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (2, 1, 2, 2, 2, N'09:30 AM', N'10:30 AM', 0)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (3, 2, 5, 5, 4, N'09:30 AM', N'10:30 AM', 0)
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (4, 1, 1, 1, 3, N'01:11 AM', N'01:11 AM', 0)
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (1, N'CSE101', N'Computer Fundamental', 3, N'Fundamental ', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (2, N'CSE401', N'Algorithm Design and Analysis ', 4, N'algorithm', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (3, N'CSE301', N'Database Management', 4, N'db', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (4, N'BBA101', N'Basic Accounting', 3, N'acc', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (5, N'BBA201', N'Human resource management', 4, N'hr', 2, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (6, N'CSE333', N'Digital Electronics', 5, N'ds', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (7, N'CSE111', N'C programming', 5, N'w', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (8, N'CSE2312', N'SPL', 5, N's', 1, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (9, N'CSE404', N'Artificial Intelligence', 4, N'ai', 1, 6)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (10, N'CSE222', N'Digital Electronics', 3.5, N'DE', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (11, N'PHY101', N'Fundamental Physics', 3.5, N'phy', 4, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descirption], [DepartmentId], [SemesterId]) VALUES (12, N'BBA105', N'Bangladesh Studies ', 3, N'bd', 2, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] ON 

INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (1, 1, 1, 8, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (2, 1, 1, 7, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (3, 1, 1, 6, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (4, 1, 1, 3, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (5, 1, 1, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (6, 2, 4, 4, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (7, 2, 3, 5, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (8, 4, 5, 11, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (9, 1, 2, 9, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (10, 2, 3, 12, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsActive]) VALUES (11, 1, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Name]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (5, N'Wednessday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (2, N'BBA', N'Bachelor of Business Administration ')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (3, N'ME', N'Mechanical Engineering')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (4, N'PHY', N'Physics Department')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Title]) VALUES (1, N'Professor')
INSERT [dbo].[Designation] ([Id], [Title]) VALUES (2, N'Assistent Professor')
INSERT [dbo].[Designation] ([Id], [Title]) VALUES (3, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Name]) VALUES (1, N'Room No:101')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (2, N'Room No:102')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (3, N'Room No:103')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (4, N'Room No:201')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (5, N'Room No:202')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (6, N'Room No:203')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (7, N'Room No:301')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (8, N'Room No:302')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (9, N'Room No:303')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (1, N'CSE-2017-001', N'Rubel', N'absjbd@gmail.com', N'12345', N'2017-03-11', N'aaa', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (2, N'CSE-2017-002', N'sazzad', N'asdas@gmail.com', N'3423', N'2017-03-11', N'sdf', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (3, N'CSE-2017-003', N'kalam', N'asdcz@gmail.com', N'332', N'2017-03-11', N'fd', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (4, N'CSE-2017-004', N'afafaf', N'gfvb@gmail.com', N'342', N'2017-03-11', N'aaa', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (5, N'BBA-2017-001', N'mika', N'fsadc@gmail.com', N'243', N'2017-03-11', N'vxcz', 2)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (6, N'BBA-2017-002', N'SaPLa', N'asasz@gmail.com', N'233', N'2017-03-11', N'zxc', 2)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (7, N'BBA-2017-003', N'ksdfj', N'fasfd@gmail.com', N'4532', N'2017-03-11', N'vf', 2)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (8, N'CSE-2017-005', N'Jamil', N'jamil@gmail.com', N'01444545784', N'Mar 14 2017 12:00AM', N'ctg', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (9, N'CSE-2017-006', N'Rubel', N'acnh@gmail.com', N'012454784', N'Mar 11 2017 12:00AM', N'ctg', 1)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (10, N'ME-2017-001', N'Monir', N'acn0h@gmail.com', N'1098765453', N'2017-03-16', N'''lk', 3)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (11, N'PHY-2017-001', N'kalam', N'khil@mail.com', N'9868954', N'2017-03-16', N'''lk', 4)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (12, N'PHY-2017-002', N'Ekram', N'gf6765hgj@gmail.com', N'1098765453', N'2017-03-16', N'''lk', 4)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (13, N'PHY-2017-003', N'Faisal Ahmed', N'faisal@mail.com', N'0124578565', N'2017-03-18', N'ctg', 4)
INSERT [dbo].[Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (14, N'CSE-2017-007', N'Mohona', N'mohona@jerin.com', N'012547856', N'2017-03-18', N'CTG', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentEnrollInCourse] ON 

INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (1, 1, 1, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (2, 1, 2, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (3, 1, 3, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (4, 2, 1, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (5, 2, 3, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (6, 4, 7, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (7, 3, 3, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (8, 2, 6, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (9, 6, 4, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (10, 7, 5, N'2017-03-11', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (11, 8, 9, N'2017-03-15', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (12, 9, 10, N'2017-03-15', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (13, 14, 7, N'2017-03-18', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (14, 14, 1, N'2017-03-18', 0)
INSERT [dbo].[StudentEnrollInCourse] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (15, 5, 4, N'2017-03-21', 1)
SET IDENTITY_INSERT [dbo].[StudentEnrollInCourse] OFF
SET IDENTITY_INSERT [dbo].[StudentResults] ON 

INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (1, 1, 1, N'A+', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (2, 1, 2, N'A', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (3, 1, 3, N'A-', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (4, 3, 3, N'A', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (5, 4, 7, N'A+', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (6, 6, 4, N'A+', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (7, 7, 5, N'A+', 0)
INSERT [dbo].[StudentResults] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (8, 14, 7, N'A+', 0)
SET IDENTITY_INSERT [dbo].[StudentResults] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (1, N'Mehdi hasan', N'ctg', N'mehdi@gmail.com', N'01676745452', 3, 1, 20, 4)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (2, N'Asif Iqbal', N'ctg', N'asif@gmail.com', N'123456', 2, 1, 20, 0)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (3, N'kabir', N'dfs', N'kabrbd@gmail.com', N'3214234', 2, 2, 20, 0)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (4, N'Malek', N'ss', N'abafa@gmail.com', N'2234', 1, 2, 20, 0)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (5, N'Ekramul Hoq', N'ctg', N'ekramul@gmail.com', N'1098765453', 1, 4, 20, 0)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Course]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Day]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Departments]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_t_AllocateClassRoom_t_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_t_AllocateClassRoom_t_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_t_Course_t_Semester] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_t_Course_t_Semester]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_t_Course_t_Semester1] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_t_Course_t_Semester1]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Course]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Departments]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_t_CourseAssignToTeacher_t_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_t_CourseAssignToTeacher_t_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_t_Student_t_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_t_Student_t_Departments]
GO
ALTER TABLE [dbo].[StudentEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentEnrollInCourse_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollInCourse] CHECK CONSTRAINT [FK_t_StudentEnrollInCourse_t_Course]
GO
ALTER TABLE [dbo].[StudentEnrollInCourse]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentEnrollInCourse_t_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollInCourse] CHECK CONSTRAINT [FK_t_StudentEnrollInCourse_t_Student]
GO
ALTER TABLE [dbo].[StudentResults]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentResult_t_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentResults] CHECK CONSTRAINT [FK_t_StudentResult_t_Course]
GO
ALTER TABLE [dbo].[StudentResults]  WITH CHECK ADD  CONSTRAINT [FK_t_StudentResult_t_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentResults] CHECK CONSTRAINT [FK_t_StudentResult_t_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_t_Teacher_t_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_t_Teacher_t_Designation]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_t_Teacher_t_Teacher] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_t_Teacher_t_Teacher]
GO
/****** Object:  StoredProcedure [dbo].[spAddCourse]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddCourse]
@Code nvarchar(50),
@Name nvarchar(50),
@Credit float,
@Description nvarchar(max),
@DepartmentId int,
@SemesterId int
AS
BEGIN
INSERT INTO Course VALUES(@Code,@Name,@Credit,@Description,@DepartmentId,@SemesterId);
END








GO
/****** Object:  StoredProcedure [dbo].[spAddStudent]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddStudent]
@Name nvarchar(50),
@RegNo nvarchar(20),
@Email nvarchar(50),
@ContactNo nvarchar(20),
@RegisterationDate datetime,
@Address nvarchar(50),
@DepartmentId int
AS
BEGIN
INSERT INTO Student VALUES(@Name,@RegNo,@Email,@ContactNo,@RegisterationDate,@Address,@DepartmentId);
END








GO
/****** Object:  StoredProcedure [dbo].[spAddTeacher]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddTeacher]
@Name nvarchar(50),
@Address nvarchar(Max),
@Email nvarchar(50),
@Contact nvarchar(50),
@DesignationId int,
@DepartmentId int,
@CreditTobeTaken float,
@RemainingCredit float
AS
BEGIN

INSERT INTO Teacher VALUES(@Name,@Address,@Email,@Contact, @DesignationId,@DepartmentId,@CreditTobeTaken,@RemainingCredit)
END









GO
/****** Object:  StoredProcedure [dbo].[spClassScheduleAndClassRoomAllocation]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spClassScheduleAndClassRoomAllocation]
AS
BEGIN
SELECT d.Id as DepartmentId,c.Code,c.Name,COALESCE(Room.Name,'Not sheduled yet') AS Room_Name,Day.Name as Day_Name,r.StartTime,r.EndTime as EndTime
FROM Course c  LEFT OUTER JOIN AllocateClassRoom r
ON r.CourseId=c.Id LEFT OUTER JOIN Room  
ON r.RoomId= Room.Id LEFT OUTER JOIN Day 
ON r.DayId= Day.Id LEFT OUTER JOIN Departments d ON c.DepartmentId=d.Id 
END








GO
/****** Object:  StoredProcedure [dbo].[spDepartmentInformationWithTeacher]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDepartmentInformationWithTeacher]
As
BEGIN
SELECT d.Id,d.Code,d.Name, COALESCE(t.Name,'Not Assign yet') as Teacher,t.Email,t.Contact FROM Departments d LEFT OUTER JOIN Teacher t ON d.Id=t.DepartmentId
END









GO
/****** Object:  StoredProcedure [dbo].[spGetCourseByStudentId]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCourseByStudentId]
@Id  int
AS
 BEGIN
Select C.Id,c.Code,c.Name,c.Credit,c.Descirption,c.DepartmentId,c.SemesterId FROM Departments d INNER JOIN Course c ON d.Id=c.DepartmentId AND d.Id=(SELECT s.DepartmentId FROM Student s WHERE s.Id=@Id)
END








GO
/****** Object:  StoredProcedure [dbo].[spGetCourseInformation]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCourseInformation]
AS
BEGIN
SELECT d.Id as DepartmentId,COALESCE(c.Code,'Not Assigned yet') AS Code,COALESCE(c.Name,'Not Assigned yet') AS Name,COALESCE(s.Name,'Not Assigned yet') as Semester,COALESCE(t.Name,'Not Assigned yet')  as Teacher FROM  Departments d  LEFT OUTER JOIN Course  c  ON d.Id=c.DepartmentId LEFT OUTER JOIN  Semester s ON c.SemesterId=s.Id  LEFT OUTER JOIN CourseAssignToTeacher Ct  ON (c.Id=Ct.CourseId AND Ct.IsActive=1) LEFT OUTER JOIN Teacher t ON t.Id=Ct.TeacherId ORDER BY c.Code
END








GO
/****** Object:  StoredProcedure [dbo].[spGetCoursesTakenByaStudent]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCoursesTakenByaStudent]
  @StudentId int
  AS
  BEGIN
  SELECT c.Id,c.Code,c.Name,c.Credit,c.Descirption,c.DepartmentId,c.SemesterId FROM Course c INNER JOIN StudentEnrollInCourse r ON (c.Id=r.CourseId AND r.StudentId=@StudentId AND r.IsStudentActive=1)
  END








GO
/****** Object:  StoredProcedure [dbo].[spGetStudentInformationById]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[spGetStudentInformationById]
  @Id int
  AS
  BEGIN

  SELECT s.Id,s.RegNo,s.Name,s.Email,s.ContactNo,s.RegisterationDate,s.Address,d.Name as Department FROM Student s INNER JOIN Departments d ON s.DepartmentId=d.Id AND s.Id=@Id
  END








GO
/****** Object:  StoredProcedure [dbo].[spGetStudentResult]    Script Date: 2017-03-21 01:13:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetStudentResult]
@studentId int
AS
BEGIN
SELECT en.StudentId, c.Code,c.Name,COALESCE(r.Grade,'Not Graded yet') as Grade FROM StudentResults r RIGHT OUTER JOIN ( SELECT e.Id,e.StudentId,e.CourseId FROM StudentEnrollInCourse e WHERE e.StudentId=@studentId AND e.IsStudentActive=1) en ON r.CourseId=en.CourseId AND r.StudentId=en.StudentId AND r.IsStudentActive=1 INNER JOIN Course c ON en.CourseId=c.Id
END








GO
USE [master]
GO
ALTER DATABASE [PUCUniversityManagementDB] SET  READ_WRITE 
GO
