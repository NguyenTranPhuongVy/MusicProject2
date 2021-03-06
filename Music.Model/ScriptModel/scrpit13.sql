USE [master]
GO
/****** Object:  Database [MusicProjectData]    Script Date: 05/13/2021 03:13:46 PM ******/
CREATE DATABASE [MusicProjectData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicProjectData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\MusicProjectData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicProjectData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\MusicProjectData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MusicProjectData] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicProjectData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicProjectData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicProjectData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicProjectData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicProjectData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicProjectData] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicProjectData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicProjectData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicProjectData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicProjectData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicProjectData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicProjectData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicProjectData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicProjectData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicProjectData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicProjectData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicProjectData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicProjectData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicProjectData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicProjectData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicProjectData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicProjectData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicProjectData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicProjectData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicProjectData] SET  MULTI_USER 
GO
ALTER DATABASE [MusicProjectData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicProjectData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicProjectData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicProjectData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MusicProjectData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicProjectData] SET QUERY_STORE = OFF
GO
USE [MusicProjectData]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[album_id] [int] IDENTITY(1,1) NOT NULL,
	[album_name] [nvarchar](200) NULL,
	[album_datecreate] [date] NULL,
	[album_dateedit] [date] NULL,
	[album_view] [int] NULL,
	[album_favorite] [int] NULL,
	[album_active] [bit] NULL,
	[album_bin] [bit] NULL,
	[album_note] [nvarchar](max) NULL,
	[album_img] [nvarchar](max) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[author_name] [nvarchar](200) NULL,
	[author_active] [bit] NULL,
	[author_bin] [bit] NULL,
	[author_note] [nvarchar](max) NULL,
	[author_datecreate] [datetime] NULL,
	[author_dateupdate] [datetime] NULL,
	[author_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](200) NULL,
	[category_active] [bit] NULL,
	[category_bin] [bit] NULL,
	[category_note] [nvarchar](max) NULL,
	[category_view] [int] NULL,
	[user_id] [int] NULL,
	[category_datecreate] [datetime] NULL,
	[category_dateupdate] [datetime] NULL,
	[category_img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_content] [nvarchar](max) NULL,
	[comment_datecreate] [datetime] NULL,
	[comment_dateupdate] [datetime] NULL,
	[comment_active] [bit] NULL,
	[user_id] [int] NULL,
	[music_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[genres_id] [int] IDENTITY(1,1) NOT NULL,
	[genres_name] [nvarchar](50) NULL,
	[genres_datecreate] [datetime] NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[genres_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[music_id] [int] NULL,
	[singer_id] [int] NULL,
	[category_id] [int] NULL,
	[group_datecreate] [datetime] NULL,
	[group_item] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historys]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historys](
	[his_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[his_datecreate] [datetime] NULL,
	[his_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Historys] PRIMARY KEY CLUSTERED 
(
	[his_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[music_id] [int] IDENTITY(1,1) NOT NULL,
	[music_name] [nvarchar](300) NULL,
	[music_img] [nvarchar](max) NULL,
	[music_lyric] [nvarchar](max) NULL,
	[music_time] [nvarchar](30) NULL,
	[music_view] [int] NULL,
	[music_dowload] [int] NULL,
	[user_id] [int] NULL,
	[music_linkdow] [nvarchar](max) NULL,
	[music_datecreate] [date] NULL,
	[music_dateedit] [date] NULL,
	[music_active] [bit] NULL,
	[music_bin] [bit] NULL,
	[music_option] [bit] NULL,
	[nation_id] [int] NULL,
	[music_video] [nvarchar](max) NULL,
	[genres_id] [int] NULL,
	[author_id] [int] NULL,
	[album_id] [int] NULL,
	[music_vip] [bit] NULL,
	[music_avgrate] [float] NULL,
	[music_vote] [int] NULL,
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[music_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[National]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[National](
	[nation_id] [int] IDENTITY(1,1) NOT NULL,
	[nation_name] [nvarchar](200) NULL,
	[nation_active] [bit] NULL,
	[nation_bin] [bit] NULL,
	[nation_datecreate] [datetime] NULL,
	[nation_dateupdate] [datetime] NULL,
	[nation_option] [bit] NULL,
 CONSTRAINT [PK_National] PRIMARY KEY CLUSTERED 
(
	[nation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[package_id] [int] IDENTITY(1,1) NOT NULL,
	[package_name] [nvarchar](200) NULL,
	[package_money] [money] NULL,
	[package_content] [nvarchar](300) NULL,
	[package_datecreate] [datetime] NULL,
	[package_active] [bit] NULL,
	[package_bin] [bit] NULL,
	[pakage_price] [int] NULL,
	[pakege_deadline] [datetime] NULL,
	[package_option] [bit] NULL,
	[package_month] [int] NULL,
	[package_type] [int] NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[pay_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[pakage_id] [int] NULL,
	[pay_datecreate] [datetime] NULL,
	[pay_dateexpiration] [datetime] NULL,
	[pay_summoney] [money] NULL,
	[pay_active] [datetime] NULL,
	[pay_status] [bit] NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[pay_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayList](
	[playlist_id] [int] IDENTITY(1,1) NOT NULL,
	[albums_id] [int] NULL,
	[music_id] [int] NULL,
	[playlist_datecreate] [datetime] NULL,
 CONSTRAINT [PK_PlayList] PRIMARY KEY CLUSTERED 
(
	[playlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quest]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest](
	[quest_id] [int] IDENTITY(1,1) NOT NULL,
	[quest_limit] [int] NULL,
	[quest_datecreate] [datetime] NULL,
	[quest_dateend] [datetime] NULL,
	[quest_active] [bit] NULL,
	[quest_category] [int] NULL,
	[quest_national] [int] NULL,
	[quest_singer] [int] NULL,
	[quest_title] [nvarchar](255) NULL,
	[quest_top1] [int] NULL,
	[quest_top2] [int] NULL,
	[quest_top3] [int] NULL,
	[quest_gift] [int] NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[quest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestGroup]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestGroup](
	[qg_id] [int] IDENTITY(1,1) NOT NULL,
	[quest_id] [int] NULL,
	[user_id] [int] NULL,
	[qg_datecreate] [datetime] NULL,
	[qg_status] [bit] NULL,
	[qg_top] [int] NULL,
	[qg_progress] [int] NULL,
 CONSTRAINT [PK_QuestGroup] PRIMARY KEY CLUSTERED 
(
	[qg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[rep_id] [int] IDENTITY(1,1) NOT NULL,
	[rep_content] [nvarchar](max) NULL,
	[rep_active] [bit] NULL,
	[rep_datecreate] [datetime] NULL,
	[rep_dateupdate] [datetime] NULL,
	[comment_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[rep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Singers]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Singers](
	[singer_id] [int] IDENTITY(1,1) NOT NULL,
	[singer_name] [nvarchar](200) NULL,
	[singer_active] [bit] NULL,
	[singer_bin] [bit] NULL,
	[singer_note] [nvarchar](max) NULL,
	[singer_img] [nvarchar](max) NULL,
	[singer_datecreate] [datetime] NULL,
	[singer_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_Singers] PRIMARY KEY CLUSTERED 
(
	[singer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[slider_id] [int] IDENTITY(1,1) NOT NULL,
	[slider_img] [nvarchar](max) NULL,
	[slider_name] [nvarchar](200) NULL,
	[slider_link] [nvarchar](max) NULL,
	[slider_datecreate] [datetime] NULL,
	[slider_active] [bit] NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[slider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/13/2021 03:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_img] [nvarchar](max) NULL,
	[user_email] [varchar](200) NULL,
	[user_pass] [nvarchar](max) NULL,
	[user_token] [nvarchar](max) NULL,
	[user_datecreate] [datetime] NULL,
	[user_datelogin] [datetime] NULL,
	[user_active] [bit] NULL,
	[user_option] [bit] NULL,
	[user_bin] [bit] NULL,
	[user_code] [nvarchar](200) NULL,
	[user_point] [int] NULL,
	[user_deadline] [datetime] NULL,
	[user_birth] [datetime] NULL,
	[user_phone] [varchar](12) NULL,
	[user_note] [nvarchar](max) NULL,
	[user_address] [nvarchar](max) NULL,
	[user_vip] [bit] NULL,
	[user_datevip] [datetime] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (1, N'Tổng Hợp Nhạc Việt', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-17' AS Date), 5, NULL, 1, 0, N'Tổng Hợp Các Bản Nhạc Hay Nhất Việt Nam', N'0029147d-7ee6-43db-bc7c-12e7304589dfAlbumViet.jpg', 11)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (2, N'V-POP  Mới Nhất', CAST(N'2021-05-10' AS Date), NULL, 25, 0, 1, 0, N'Không', N'3386d397-4a64-49f9-8a1e-764797a2215e1512556174027.jpg', 11)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (3, N'K-POP 2021', CAST(N'2021-05-10' AS Date), NULL, 1, 0, 1, 0, N'Không', N'a225818a-039a-41b9-bc62-d5e87ae195f5k-pop.jpg', 11)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (4, N'Tuyển Tập Bài Hát C-POP', CAST(N'2021-05-10' AS Date), NULL, 10, 0, 1, 0, N'Không', N'22157596-b7ac-47a3-8f89-4850306b58a91545618526441.jpg', 11)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (5, N'Tổng Hợp Nhạc Phim Hay Nhất', CAST(N'2021-05-10' AS Date), NULL, 0, 1, 1, 0, N'Không', N'c2724659-d197-432c-96be-94da4967d599NhacPhim.jpg', 11)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (6, N'Nhạc Hay', CAST(N'2021-05-11' AS Date), NULL, 1, 1, 1, 0, NULL, N'0b78c198-3b64-47c0-a17e-af92f4cb2144BTS-IDOL-2.jpg', 2)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (7, N'Nhạc noo', CAST(N'2021-05-11' AS Date), NULL, 1, 1, 1, 0, NULL, N'4d12e9bb-6d4f-479e-bd91-2ad90ba0c244loi-bai-hat-tinh-ban-dieu-ky-amee-x-ricky-star-x-lang-ld-kem-hop-am.jpg', 12)
INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (8, N'Nhạc noo', CAST(N'2021-05-11' AS Date), NULL, 1, 1, 1, 0, NULL, N'bf48e0b5-bb8d-41f0-bffe-1c19c481d668Rdfa5c7e82246daf7d77062c8b4a4ebb4.jfif', 14)
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (1, N'Không Rõ', 1, 0, N'Không', CAST(N'2021-03-16T15:20:48.000' AS DateTime), NULL, N'12bdc550-0bda-40a9-a975-1c70de31784fUserimg.png')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (2, N'Mr. Siro', 1, 0, N'Không', CAST(N'2021-05-10T13:04:57.000' AS DateTime), NULL, N'abd418c7-14c7-4a70-bd87-fe9e3a8c8972Siro.jpg')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (3, N'Hứa Kim Tuyền', 1, 0, N'Không', CAST(N'2021-05-10T13:05:21.000' AS DateTime), NULL, N'76551c08-0a2d-4b9c-87a8-90184fb2f141Hkt.jpg')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (4, N'Vương Anh Tú', 1, 0, N'Không', CAST(N'2021-05-10T14:30:02.000' AS DateTime), NULL, N'0c0e32f9-9419-425b-8719-09bfed7ad73fvuongAnhTu.jpg')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (1, N'Nhạc Việt', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:17:09.917' AS DateTime), N'Viet.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (2, N'Nhạc Trữ Tình', 1, 0, N'Không có', 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:29:44.137' AS DateTime), N'TruTinh.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (3, N'Nhạc Trung', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:16:57.823' AS DateTime), N'NhacHoa.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (4, N'Nhạc Trẻ', 1, 0, N'Không Có', 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-16T10:18:21.177' AS DateTime), N'NhacTre.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (5, N'Nhạc Hàn', 1, 0, N'Không Có', 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-16T10:18:21.177' AS DateTime), N'Han.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [comment_content], [comment_datecreate], [comment_dateupdate], [comment_active], [user_id], [music_id]) VALUES (6, N'hay', CAST(N'2021-05-11T22:38:48.937' AS DateTime), NULL, NULL, 13, 32)
INSERT [dbo].[Comment] ([comment_id], [comment_content], [comment_datecreate], [comment_dateupdate], [comment_active], [user_id], [music_id]) VALUES (7, N'nhạc hay', CAST(N'2021-05-11T22:46:23.773' AS DateTime), NULL, NULL, 14, 27)
INSERT [dbo].[Comment] ([comment_id], [comment_content], [comment_datecreate], [comment_dateupdate], [comment_active], [user_id], [music_id]) VALUES (8, N'nhạc rất hay', CAST(N'2021-05-11T22:46:29.647' AS DateTime), NULL, NULL, 14, 27)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([genres_id], [genres_name], [genres_datecreate]) VALUES (1, N'MP3', NULL)
INSERT [dbo].[Genres] ([genres_id], [genres_name], [genres_datecreate]) VALUES (2, N'BEAT', NULL)
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (46, 23, NULL, 1, CAST(N'2021-05-11T11:40:43.463' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (47, 23, NULL, 4, CAST(N'2021-05-11T11:40:43.497' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (48, 23, 12, NULL, CAST(N'2021-05-11T11:40:43.500' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (52, 24, NULL, 1, CAST(N'2021-05-11T11:46:54.513' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (53, 24, NULL, 4, CAST(N'2021-05-11T11:46:54.523' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (54, 24, 6, NULL, CAST(N'2021-05-11T11:46:54.533' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (55, 27, NULL, 1, CAST(N'2021-05-11T11:51:43.043' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (56, 27, NULL, 4, CAST(N'2021-05-11T11:51:43.047' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (57, 27, 13, NULL, CAST(N'2021-05-11T11:51:43.050' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (58, 26, NULL, 1, CAST(N'2021-05-11T11:51:55.867' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (59, 26, NULL, 4, CAST(N'2021-05-11T11:51:55.870' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (60, 26, 11, NULL, CAST(N'2021-05-11T11:51:55.870' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (61, 28, NULL, 1, CAST(N'2021-05-11T11:52:06.920' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (62, 28, NULL, 4, CAST(N'2021-05-11T11:52:06.923' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (63, 28, 13, NULL, CAST(N'2021-05-11T11:52:06.927' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (64, 29, NULL, 1, CAST(N'2021-05-11T12:08:41.967' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (65, 29, NULL, 4, CAST(N'2021-05-11T12:08:42.103' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (66, 29, 13, NULL, CAST(N'2021-05-11T12:08:42.133' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (67, 30, NULL, 1, CAST(N'2021-05-11T12:10:46.807' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (68, 30, NULL, 4, CAST(N'2021-05-11T12:10:46.827' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (69, 30, 13, NULL, CAST(N'2021-05-11T12:10:46.827' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (70, 30, NULL, 1, CAST(N'2021-05-11T12:12:45.957' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (71, 30, NULL, 4, CAST(N'2021-05-11T12:12:45.973' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (73, 31, NULL, 1, CAST(N'2021-05-11T12:13:15.443' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (74, 31, NULL, 4, CAST(N'2021-05-11T12:13:15.450' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (75, 31, 13, NULL, CAST(N'2021-05-11T12:13:15.450' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (76, 32, NULL, 5, CAST(N'2021-05-11T13:43:31.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (77, 32, 14, NULL, CAST(N'2021-05-11T13:43:31.313' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (78, 33, NULL, 5, CAST(N'2021-05-11T13:50:05.020' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (81, 33, 14, NULL, CAST(N'2021-05-11T13:52:00.970' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (87, 37, 15, NULL, CAST(N'2021-05-11T14:40:21.793' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (97, 31, NULL, NULL, CAST(N'2021-05-11T22:22:50.127' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (98, 33, NULL, NULL, CAST(N'2021-05-11T17:57:25.467' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (99, 28, NULL, NULL, CAST(N'2021-05-11T18:41:06.917' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (100, 23, NULL, NULL, CAST(N'2021-05-11T18:42:11.827' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (101, 21, NULL, NULL, CAST(N'2021-05-11T18:51:14.370' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (102, 27, NULL, NULL, CAST(N'2021-05-11T18:54:02.127' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (103, 35, NULL, NULL, CAST(N'2021-05-11T19:28:36.743' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (104, 29, NULL, NULL, CAST(N'2021-05-11T19:28:40.743' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (105, 37, NULL, NULL, CAST(N'2021-05-11T19:34:41.983' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (106, 32, NULL, NULL, CAST(N'2021-05-11T22:21:47.930' AS DateTime), 4, 2)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (108, 30, NULL, NULL, CAST(N'2021-05-11T22:29:38.557' AS DateTime), 4, 12)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (109, 35, NULL, NULL, CAST(N'2021-05-11T22:32:35.697' AS DateTime), 4, 12)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (110, 27, NULL, NULL, CAST(N'2021-05-11T22:35:30.767' AS DateTime), 4, 12)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (111, 28, NULL, NULL, CAST(N'2021-05-11T22:36:42.603' AS DateTime), 4, 12)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (112, 32, NULL, NULL, CAST(N'2021-05-11T22:38:45.653' AS DateTime), 4, 13)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (113, 31, NULL, NULL, CAST(N'2021-05-11T22:41:20.320' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (114, 35, NULL, NULL, CAST(N'2021-05-11T22:41:41.227' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (115, 27, NULL, NULL, CAST(N'2021-05-11T23:02:47.233' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (116, 28, NULL, NULL, CAST(N'2021-05-11T22:47:41.547' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (117, 30, NULL, NULL, CAST(N'2021-05-11T22:50:25.407' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (118, 38, NULL, NULL, CAST(N'2021-05-11T22:54:30.753' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (119, 26, NULL, NULL, CAST(N'2021-05-11T23:04:12.520' AS DateTime), 4, 14)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (120, 34, NULL, NULL, CAST(N'2021-05-13T12:18:14.250' AS DateTime), 4, 6)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (121, 34, NULL, 5, CAST(N'2021-05-13T11:42:23.640' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (122, 34, 14, NULL, CAST(N'2021-05-13T11:42:23.673' AS DateTime), NULL, NULL)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (123, 30, NULL, NULL, CAST(N'2021-05-13T12:34:49.847' AS DateTime), 4, 6)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (124, 32, NULL, NULL, CAST(N'2021-05-13T12:50:54.733' AS DateTime), 4, 6)
INSERT [dbo].[Group] ([group_id], [music_id], [singer_id], [category_id], [group_datecreate], [group_item], [user_id]) VALUES (125, 38, NULL, NULL, CAST(N'2021-05-13T12:50:47.370' AS DateTime), 4, 6)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Historys] ON 

INSERT [dbo].[Historys] ([his_id], [user_id], [his_datecreate], [his_content]) VALUES (1, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Bạn')
INSERT [dbo].[Historys] ([his_id], [user_id], [his_datecreate], [his_content]) VALUES (2, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Bạn')
INSERT [dbo].[Historys] ([his_id], [user_id], [his_datecreate], [his_content]) VALUES (3, 1, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Bạn')
SET IDENTITY_INSERT [dbo].[Historys] OFF
GO
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (21, N'Laylalay', N'2e35ccdf-8997-4a92-a834-6a0c4019350djack-va-nhung-thay-doi-trong-mv-laylalay-b54d12eb.jpg', NULL, N'03:52', 1, 100, 8, N'dea2bf52-aa35-453d-8b31-7de8d19f0375Laylalay-JackG5R-7003742.mp3', CAST(N'2021-05-04' AS Date), CAST(N'2021-05-10' AS Date), 1, 0, 1, 2, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (22, N'Tình Bạn Diệu Kỳ', N'5d0e2698-a35a-40ad-9271-1724022b020bloi-bai-hat-tinh-ban-dieu-ky-amee-x-ricky-star-x-lang-ld-kem-hop-am.jpg', N'[Amee]
Ta đã ở bên nhau, những năm tháng nhọc nhằn
You make me feel like, I got everything
Dù mai có ra sao ta vẫn sẽ tự hào
Vì đã luôn bên nhau
We do everything
Đưa tay lên nào, mãi bên nhau bạn nhớ
Bên ngoài thế giới trời cao đất dày
Ở trong team có anh em chất đầy
Đưa tay lên nào, mãi bên nhau bạn nhớ
Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy

[Ricky Star]
Trôi đi trôi đi trôi đi trôi dòng thời gian
Đã nuôi ta khôn lớn lên đôi khi không được bình an yeah yeah
Bạn ơi tôi sẽ mãi thật lòng
Sau mưa thì sẽ có cầu vồng
Tuổi trẻ thường háo thắng
Vẫn giữ màu áo trắng
Đôi khi ta bí lối cùng đường
Vẫn có homie luôn cùng đường
Đi qua ngày mưa ngày nắng
Ăn chung vị cay vị đắng
Từ mặt trời chuyển thành mặt trăng
Tấm lòng vẫn luôn ngay ngắn
Bụi phấn cùng với quả chò bay
Tan trường cùng những quyển truyện hay
Quấy phá giáo viên bắt đứng phạt
Nhưng bạn bè thì không bỏ một ai

[Amee]
Ta đã ở bên nhau, những năm tháng nhọc nhằn
You make me feel like, I got everything
Dù mai có ra sao ta vẫn sẽ tự hào
Vì đã luôn bên nhau
We do everything
Đưa tay lên nào, mãi bên nhau bạn nhớ
Bên ngoài thế giới trời cao đất dày
Ở trong team có anh em chất đầy
Đưa tay lên nào, mãi bên nhau bạn nhớ
Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy

[Lăng LD]
What''s up!
That''s break boy, 2009
Tuổi thơ gắn bó, anh em Tiền Giang
Nhảy bboy, chạy show đám cưới
Tập ngoài công viên, mặc đồ second hand
Khu lao động đó, những ngày bình yên lộng gió
Tiếng đồng lúa phát ra từ giọng nó
Cám ơn vì đã trân trọng nó
Cùng ôm một giấc mộng khó
Yeah! Và mic cầm cứng tay
Like a Travis Scott, ước gì mày đứng đây
Cùng tận hưởng khoảnh khắc này, nà ní
Chưa dịp tái ngộ, còn nhờ là quý
OTD for life
Những đứa con xứ ruộng thẳng cánh cò bay
Vượt cùng ải khó trò hay
Chung tay bẻ lái hướng đò ngay
Ey
Câu từ này là bạn hiền
Là đồng minh ở bên cạnh dù cạn tiền
Là lòng tin cho tâm hồn mình lên tiếng
Nên hiến vì đam mê không nên tiếc
Nên viết trước khi thời gian dập tắt ý chí nah
Nhìn lại thanh xuân bằng cặp mắt quyến luyến
Cái đập tay không phân biệt chiến tuyến
Ta luôn biết nhận sai và lắng nghe lời chí lý

[Amee]
I know we won''t stop
I know we won''t
Vì chúng ta sinh ra là để bước đi mà
I know we can''t stop
I know we can''t
Let it be
Ta đã ở bên nhau, những năm tháng nhọc nhằn
You make me feel like, I got everything
Dù mai có ra sao ta vẫn sẽ tự hào
Vì đã luôn bên nhau
We do everything', N'03:08', 1, 0, 8, N'7afaf272-2994-4c72-8841-70d42f545a1aTinhBanDieuKy-AMeeRickyStarLangLD-6927558.mp3', CAST(N'2021-05-04' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (23, N'Gặp Nhưng Không Ở Lại', N'8d5d150b-ab0b-4d94-8ecd-164ad724201fgnkol.png', N'Chẳng là gì cả đã là gì đâu
Nếu từng đậm sâu thì cũng phai màu
Tổn thương quá nên chẳng còn đau
Buồn rầu thấy anh thương người sau
Giờ ở trước nhau để anh nói ra câu là ta chẳng còn gì bấy lâu
Em cũng buồn lắm chứ
Với ngần ấy câu từ
Nước mắt rơi vì ngày mai em chẳng thể nguôi ngoai
Trời ban mỗi chữ duyên mình đừng nên bỏ lỡ
Phải cố giữ nhau thì mới có nợ
Ở trên đời
Để may mắn tìm
Một người mình thương chưa chắc cả đời đã có được
Chuyện tình cảm chúng ta đừng nên nói trước
Vì phía trước biết đâu mọi thứ đảo ngược
Trái tim em đầy tổn thương
Phủ đầy mù sương
Cơ duyên gặp nhau cũng chẳng đủ nợ để ở lại
Chẳng là gì cả đã là gì đâu
Nếu từng đậm sâu thì cũng phai màu
Tổn thương quá nên chẳng còn đau
Buồn rầu thấy anh thương người sau
Giờ ở trước nhau để anh nói ra câu…', N'04:37', 1, 0, 11, N'e737a7eb-e295-4831-bf0f-f6dcb57ad4baGap Nhung Khong O Lai - Hien Ho.mp3', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (24, N'Sài Gòn Đau Lòng Quá', N'92e9f833-03f7-4867-9ee6-45518eda2ee8137965.jpg', N'Cầm tấm vé trên tay
Em bay đến nơi xa
Sài Gòn đau lòng quá
Toàn kỷ niệm chúng ta
Phải đi xa đến đâu?
Thời gian quên mất bao lâu?
Để trái tim em bình yên như ngày đầu tiên
Mình đã từng hứa, bên nhau hết tháng năm dài
Yêu đến khi ngừng hơi thở, đến khi ngừng mơ
Nắm chặt tay, đi hết nhân thế này
Chân trời hằn chân ta
Vô tận là chúng ta
Mình đã từng hứa đi qua hết bao thăng trầm
Cho dẫu mai này xa rời vẫn không hề đổi dời
Có ngờ đâu, đã sắp vỡ tan tành
Nhặt từng mảnh vỡ xếp vào va li
Cứ càng yêu, cứ càng đau
Cứ càng quên rồi lại muốn đi thật nhiều
Tokyo hay Seoul, Paris hay New York
Đi càng xa, càng không thể quên
Cầm tấm vé trên tay
Em bay đến nơi xa
Sài Gòn đau lòng quá
Toàn kỷ niệm chúng ta
Phải đi xa đến đâu?
Thời gian quên mất bao lâu?
Để trái tim em bình yên như…', N'05:09', 16, 0, 11, N'2b788bea-bdbb-42bd-8011-de0938220a67SaiGonDauLongQua-HuaKimTuyenHoangDuyen-6992977.mp3', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 3, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (26, N'Đừng Chờ Anh Nữa', N'13ca92f1-fdd5-469e-b6c7-dfedb98161941506658205311_640.jpg', N'Xin lỗi em bao nhiêu ngày đã qua
Xin lỗi em về chuyện tình hai ta
Vì mình không thể cố chấp tin rằng
Tình yêu một mai sẽ lớn lên bằng
Những tháng năm tim chưa từng rung động
Xin lỗi em anh đã lừa dối em
Nói với em sẽ mãi ở bên em
Chẳng ai sẽ chết nếu thiếu vắng một người
Nhỏ bé giữa cuộc đời
Trái đất vẫn cứ xoay khi ta lạc mất tay
Mình rời xa nhé hãy tin anh
Hãy sống vì mình
Anh mong ai đến sau
Sẽ yêu em nhiều hơn anh
Đừng chờ anh nữa hãy quên anh
Năm tháng nhạt nhoà
Chuyện mình rồi cũng sẽ qua
Xin lỗi em bao nhiêu ngày đã qua
Xin lỗi em về chuyện tình hai ta
Vì mình không thể cố chấp tin rằng
Tình yêu một mai sẽ lớn lên bằng
Những tháng năm tim chưa từng rung động
Xin lỗi em anh đã lừa dối em
Nói với em sẽ mãi ở bên em
Chẳng ai sẽ chết nếu thiếu vắng một người
Nhỏ bé giữa cuộc đời
Trái đất vẫn cứ xoay khi ta lạc mất tay
Mình rời xa nhé hãy tin anh
Hãy sống vì mình
Anh mong ai đến sau
Sẽ yêu em nhiều hơn anh
Đừng chờ anh nữa hãy quên anh
Năm tháng nhạt nhoà
Chuyện mình rồi cũng sẽ qua
Mình rời xa nhé hãy tin anh
Hãy sống vì mình
Anh mong ai đến sau
Sẽ yêu em nhiều hơn anh
Đừng chờ anh nữa hãy quên anh
Năm tháng nhạt nhoà
Chuyện mình rồi cũng sẽ qua
(... rồi cũng sẽ qua)', N'03:45', 1, 50, 11, N'6d3e4a69-759c-403f-a444-a80cacde58b1DungChoAnhNua-TangPhuc-5187612.mp3', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 2, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (27, N'Giả Từ Trong Cơn Mưa', N'466352d7-ecab-4b46-b110-f8112b5f5ce8unnamed.png', N'Khoảnh khắc khi đôi mình giã từ trong cơn mưa
Đã hẹn quay về như lúc xưa
Khoảng khắc khi anh nhìn em chờ sau cơn mưa
Mãi còn vẹn nguyên đến bây giờ
Rồi một mai khi đôi chân cất bước quay trở lại
Vẫn đó cơn mưa trên con đường xưa
Vẫn đó góc phố, vẫn đó nỗi nhớ
Vẫn đó những ngày đã qua
Anh ra đi và lời hứa một mai sẽ quay trở về
Và em nói sẽ giữ mãi câu ước thề
Vậy mà sao giờ đây chẳng còn những yêu thương đắm say
Anh lang thang tìm lại em trong những tiếng mưa miên man
Rồi lại thấy chơ vơ giấc mơ vụt tan
Cơn mưa phai màu
Anh cố đi qua nỗi đau
Bỏ lại tiếng mưa đan vào nhau
Khoảnh khắc khi đôi mình giã từ trong cơn mưa
Đã hẹn quay về như lúc xưa
Khoảng khắc khi anh nhìn em chờ sau cơn mưa
Mãi còn vẹn nguyên đến bây giờ
Rồi một mai khi đôi chân cất bước quay trở lại
Vẫn đó cơn mưa trên con đường xưa
Vẫn đó góc phố, vẫn đó nỗi nhớ
Vẫn đó như ngày em đến
Anh ra đi và lời hứa một mai sẽ quay trở về
Và em nói sẽ giữ mãi câu ước thề
Vậy mà sao giờ đây chẳng còn những yêu thương đắm say
Anh lang thang tìm lại em trong những tiếng mưa miên man
Rồi lại thấy chơ vơ giấc mơ vụt tan
Cơn mưa phai màu
Anh cố đi qua nỗi đau
Bỏ lại tiếng mưa đan vào nhau
Anh ra đi và lời hứa một mai sẽ quay trở về (Rồi anh ra đi, anh hứa sẽ quay trở về)
Và em nói sẽ giữ mãi câu ước thề
Vậy mà sao giờ đây chẳng còn những yêu thương đắm say (ooh-oh)
Anh lang thang tìm lại em trong những tiếng mưa miên man (Tìm lại trong những tiếng mưa)
Rồi lại thấy chơ vơ giấc mơ vụt tan (chơ vơ giấc vụt tan)
Cơn mưa phai màu
Anh cố đi qua nỗi đau (ooh)
Bỏ lại tiếng mưa đan vào nhau', N'04:12', 1, 0, 11, N'2314cb90-6246-4d07-8977-4d5bba8f8355GiaTuTrongConMua-NooPhuocThinh-5893816.mp3', CAST(N'2021-05-11' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 1, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (28, N'Giá Như', N'00493d39-cfe2-41ac-bdf5-49dc5fc407fesddefault.jpg', N'Em sao em không nắm tay anh
Trên phố đông như em từng nắm
Em sao em không nói anh nghe
Những yêu thương như em đã bao lần

Hay là từ lâu bên em đã có người
Che chở em mỗi khi gió về
Hay là từ lâu bên em đã có người
Nắm tay em trên phố ngược xuôi

Em sao em không hỏi anh xem
Anh đã ở đâu khi nào bên ai
Em sao em không thấy anh đau
Thấy anh thức trắng bao đêm dài

Là vì giờ đây trong em luôn có người
Để em quan tâm để em nhớ về
Là vì giờ đây em đã quên mất rồi
Ngay cạnh em vẫn là anh

Giá như có thể khóc anh sẽ khóc thật lâu
Giá như có thể nói cho em biết rằng anh đang rất đau
Giá như có thể mãi không dối gian nhau
Thì giờ đây giờ đây đã khác

Giá như có thể bước hai đứa về hai phương trời
Giá như em hiểu thấu bao cay đắng hằn trong tim tôi
Giá như có thể sống thiếu em trong đời
Và giá như chưa bao giờ yêu người', N'04:39', 1, 0, 11, N'fa390f96-aa64-4f73-b4da-937f04941af0GiaNhu-NooPhuocThinh-5893818.mp3', CAST(N'2021-05-11' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 1, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (29, N'Thương Em Là Điều Anh Không Thể Ngờ', N'dfc327be-840c-41da-84bf-0347af00dd76a010fc02b546843867f35fd7a23e3952.jpg', N'Yêu em... dù là đơn phương thế thôi
Sao chẳng thế nói ra trước đôi môi kia
Thương em... là điều anh không thể ngờ
Ngăn nỗi nhớ cũng không thể ngăn trái tim

Ngần ngại chôn sâu yêu thương
Anh giấu đi tâm sự mỗi khi bên cạnh nhau
Chỉ biết lặng thinh ngắm nhìn
Một ngôi sao nhỏ bé làm tim anh mãi mãi mong chờ

[ĐK:]
Là anh cố chấp yêu em
Dù không thể nói thành lời
Vì dại khờ anh thu mình trong suy tư của em
Dù muộn sầu hay thương nhớ anh xin một mình mang hết
Chỉ mong bờ mi em không vương chút buồn
Và nụ cười em luôn trên bờ môi

[Bridge:]
Trọn yêu thương này trao cho em
Trọn tâm tư này anh giữ lấy
Sẽ bên cạnh em dẫu cho ngày mai
Người rời xa anh mãi', N'05:09', 80, 200, 11, N'0dd71532-50b5-4583-8a9d-f803027929ceThuongEmLaDieuAnhKhongTheNgo-NooPhuocThinh-5827347.mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (30, N'Yêu Một Người Sao Buồn Đến Thế', N'd8c300ab-32df-4019-bd09-b9d7d674a7a83934_hqdefault.jpg', N'Đã đến lúc cần được giải thoát
Cố níu kéo cũng chỉ vỡ tan
Như hoa kia chẳng còn thơm ngát
Cố giữ lấy cũng lụi tàn
Nước mắt rơi giữa đời ngổn ngang
Ưu tư mang cả trời ký ức
Càng day dứt,
Càng không cách nào nguôi
Bơ vơ theo dòng người vô hướng,
Cứ vấn vương rồi lại tổn thương,
Nhớ không được mà
Quên cũng chẳng được
Yêu một người sao buồn đến thế?
Thương một người sao đau đến thế?
Nhớ không được mà
Quên cũng không được
Có nhau là điều may mắn
Cớ sao không giữ lấy
Nếu buông tay chẳng thể quay lại
Dẫu ai đã từng gây bao
Nhớ thương ngàn lần vương vấn
Nắng mưa trên đầu
Làm sao có ai biết thấu
Yêu một người sẽ buồn bao lâu?
Trách ai bây giờ
Chỉ biết trách ta vội vàng
Bơ vơ theo dòng người vô hướng;
Cứ vấn vương rồi lại tổn thương,
Nhớ không được mà
Quên cũng chẳng được
Yêu một người sao buồn đến thế?
Thương một người sao đau đến thế?
Nhớ không được mà
Quên cũng không được
Có nhau là điều may mắn
Cớ sao không giữ lấy
Nếu buông tay chẳng thể quay lại
Dẫu ai đã từng gây bao
Nhớ thương ngàn lần vương vấn
Nắng mưa trên đầu
Làm sao có ai biết thấu,
Yêu một người sẽ buồn bao lâu
Trách ai bây giờ
Chỉ biết trách ta vội vàng
Vì yêu là đau là thương thế đấy
Vì yêu là say là bao đắng cay
Vì ai đổi thay? Vì ai? Vì ai?
Có nhau là điều may mắn
Cớ sao không giữ lấy
Nếu buông tay chẳng thể quay lại
Dẫu ai đã từng gây bao
Nhớ thương ngàn lần vấn vương
Nắng mưa trên đầu
Làm sao có ai biết thấu,
Yêu một người sẽ buồn bao lâu?
Trách ai bây giờ
Chỉ biết trách ta vội vàng
Trách ai bây giờ
Chỉ biết trách ta... vội vàng', N'04:59', 1, 0, 11, N'd1a71ff7-7ac2-47b0-abfc-a8902eeaa87dYeuMotNguoiSaoBuonDenThe1-NooPhuocThinh-6759303.mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (31, N'Em Đã Thương Người Ta Hơn Anh', N'1c5d855a-b5bb-4613-bd14-2d004c6a137c127211.jpg', N'Tại sao em không nói
Là em thay đổi
Để tận giờ mới thấy là cạnh em đã có một người mới

Em đang đợi ai tới
Để đón em phải không
Vậy thôi để anh đi trước em đỡ phiền lòng

Thở dài không nói là không phải không biết gì
Nhiều khi tại anh cứ mải chạy theo em thấy chúng ta vô vị
Thế nhưng rồi em cũng cũng quyết tâm làm điều anh thấy đúng
Ở trong lòng em mọi điều toan tính theo anh là chẳng cần chứng minh

Chẳng ai dại muốn trao hết tình cảm chân thành
Phải bớt lại chút say đắm để dành
Để lỡ người kia đi mất không buồn giống anh

Mới yêu luôn dành nhiều lời có cánh
Dẫu trời mưa cũng hoá trong xanh
Giờ nhận ra chẳng đẹp như trong sách dứt nhau mọi cách

Lúc anh tìm thấy em lấy cuộc sống trao tặng
Vì nghĩ em quan trọng chẳng ai bằng
Vẫn thương dù em thay đổi, bao người cản ngăn

Để như bây giờ thì anh chắc chắn
Em đã thương người ta hơn anh
Một người như anh chẳng ai cảm thấy có anh may mắn

Đừng gọi tên anh khi mà chưa chắc chắn
Sẽ đi hết cùng nhau đến bạc mái đầu
Bén duyên ở bên một ai có mọi thứ chứ đừng dại

Ở trên đời tình yêu phải đặt đúng nơi
Thở dài không nói là không phải không biết gì
Nhiều khi tại anh cứ mải chạy theo em thấy chúng ta vô vị

Thế nhưng rồi em cũng, cũng quyết tâm làm điều anh thấy đúng
Ở trong lòng em mọi điều toan tính theo anh là chẳng cần chứng minh
Chẳng ai dại muốn trao hết tình cảm chân thành

Phải bớt lại chút say đắm để dành
Để lỡ người kia đi mất không buồn giống anh
Mới yêu luôn dành nhiều lời có cánh

Dẫu trời mưa cũng hoá trong xanh
Giờ nhận ra chẳng đẹp như trong sách dứt nhau mọi cách
Lúc anh tìm thấy em lấy cuộc sống trao tặng

Vì nghĩ em quan trọng chẳng ai bằng
Vẫn thương dù em thay đổi, bao người cản ngăn
Để như bây giờ thì anh chắc chắn

Em đã thương người ta hơn anh
Một người như anh chẳng ai cảm thấy có anh may mắn
Chẳng ai ở kề bên nghĩ có anh may mắn!', N'04:52', 1, 50, 11, N'd71801d8-3315-4c52-a539-849b667f05d2EmDaThuongNguoiTaHonAnh-NooPhuocThinh-6607401.mp3', CAST(N'2021-05-11' AS Date), CAST(N'2021-05-11' AS Date), 1, 0, 1, 2, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (32, N'Stay', N'e5c61dc4-78ef-43e9-bab4-afdabdc17db2hqdefault.jpg', N'Kkum-ieoss-eulkka
Neol bon geos gat-a
Nuntteumyeon dasi
Amudo eobsneun bang

Gamanhi nan jumun-eul geol-eo
Geu eoneu ttaeboda keuge ttwineun heart
I sungan uli eonjelado eodi issdaedo
Together, wherever yeah
(Wherever yeah)

Banbogdo bog-in geos gat-a
Nado moleugess-eo naui sog-eul
Neol bol sun eobs-eulkka
Gamanhi moabone du son-eul
Byeonhaji anhneun naeil
Michinnomcheoleom I keep sayin’
Wherever you are
I know you always stay

Jeo guleum-i jinagan jalie
Stay
Maleun ibsullo neoege malhae
Stay, stay, stay, stay...
(Always)

Yeah I know you always stay
Yeah I know you always stay
Yeah I know you always stay

Chanlanhan oneul-ui
Geu moduleul wihae
Oh every night and day
Yeah I know you always stay

Balo jigeum nan neol saeng-gaghae
Niga eodie issdeonji
Geuge mwoga jung-yohae
We connect to 7G
It ain’t the end of the world
The present, it shine like a pearl
Igeon myeoch padong-e bulgwa
Hajiman naega neol bakkwonoh-eul geoya

Gamanhi nan jumun-eul geol-eo
Geu eoneu ttaeboda balg-ge boineun star
I sungan ulin eonjelado eodi issdaedo
Wherever you are
I know you always stay

Jeo balam-i jinagan bada-e
Stay
Gud-eun ibsullo nege mal-eul hae
Stay, stay, stay, stay...
(Always)

Yeah I know you always stay
Yeah I know you always stay
Yeah I know you always stay

Chanlanhan oneul-ui
Geu moduleul wihae
Oh every night and day
Yeah I know you always stay

Chanbalam-i bul-eowa
Son naemil-eo ne sumgyeol-eul neukkyeo
Nun gam-eun eoneusae
Ulin hamkkein geol', N'03:25', 25, 0, 11, N'673cc7a0-bc98-498a-b9b3-ffe490fbe6eaStay - BTS (NhacPro.net).mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 4, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (33, N'Dynamite', N'0d211f80-db21-4d2b-a37f-3b2ba88a3d2cbts-dynamite-2.jpg', N'[Intro: Jungkook]
''Cause I, I, I''m in the stars tonight
So watch me bring the fire and set the night alight

[Verse 1: Jungkook]
Shoes on, get up in the morn''
Cup of milk, let''s rock and roll
King Kong, kick the drum, rolling on like a Rolling Stone
Sing song when I''m walking home
Jump up to the top, LeBron
Ding-dong, call me on my phone
Ice tea and a game of ping pong

[Verse 2: RM, j-hope]
This is getting heavy
Can you hear the bass boom? I''m ready
Life is sweet as honey
Yeah, this beat cha-ching like money
Disco overload, I''m into that, I''m good to go
I''m diamond, you know I glow up
Hey, so let''s go

[Chorus: Jungkook, Jimin]
''Cause I, I, I''m in the stars tonight
So watch me bring the fire and set the night alight (Hey)
Shining through the city with a little funk and soul
So I''ma light it up like dynamite, woah

[Verse 3: V, RM]
Bring a friend, join the crowd, whoever wanna come along
Word up, talk the talk, just move like we off the wall
Day or night, the sky’s alight, so we dance to the break of dawn
Ladies and gentlemen, I got the medicine so you should keep ya eyes on the ball, huh

[Verse 4: Suga, Jimin, RM]
This is getting heavy, can you hear the bass boom? I''m ready (Woo-hoo)
Life is sweet as honey, yeah, this beat cha-ching like money
Disco overload, I''m into that, I''m good to go
I''m diamond and you know I glow up
Let’s go

[Chorus]
''Cause I, I, I''m in the stars tonight
So watch me bring the fire and set the night alight (Hey)
Shining through the city with a little funk and soul
So I''ma light it up like dynamite, woah

[Post-Chorus]
Dynnnnnanana, life is dynamite
Dynnnnnanana, life is dynamite
Shining through the city with a little funk and soul
So I''ma light it up like dynamite, woah

[Bridge]
Dynnnnnanana, ayy
Dynnnnnanana, ayy
Dynnnnnanana, ayy
Light it up like dynamite
Dynnnnnanana, ayy
Dynnnnnanana, ayy
Dynnnnnanana, ayy
Light it up like dynamite

[Chorus]
''Cause I, I, I''m in the stars tonight
So watch me bring the fire and set the night alight
Shining through the city with a little funk and soul
So I''ma light it up like dynamite
(This is ah) I''m in the stars tonight
So watch me bring the fire and set the night alight
Shining through the city with a little funk and soul
So I''ma light it up like dynamite, woah (Light it up like dynamite)

[Post-Chorus]
Dynnnnnanana, life is dynamite (Life is dynamite)
Dynnnnnanana, life is dynamite
Shining through the city with a little funk and soul
So I''ma light it up like dynamite, woah', N'03:19', 1, 600, 11, N'a5d0eeaf-6fac-41be-b407-763172271d75Dynamite - BTS (NhacPro.net).mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 4, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (34, N'On', N'c06b8842-646d-4404-a41a-b80b400f6d4369491d6f5371581741eb869383901338.jpg', N'[Verse 1: Jimin, V]
I can''t understand what people are sayin''
Eoneu jangdane majchwoya doelji
Han baljagug ttemyeon han baljagug keojineun shadow
Jameseo nuneul tteun yeogin tto eodi
Eojjeom seoul tto New York or Paris
Ileonani hwicheongineun mom

[Verse 2: RM]
Look at my feet, look down
Nal dalmeun geulimja
Heundeullineun geon inominga
Animyeon nae jageun balkkeutinga
Dulyeobjanheul li eobsjanha
Da gwaenchanheul li eobsjanha
Geulaedo I know
Seotulge I flow
Jeo kkaman balamgwa hamkke nala

[Pre-Chorus: Jimin, Jungkook, Jin]
Hey na-na-na
Michiji anheulyeomyeon michyeoya hae
Hey na-na-na
Naleul da deonjyeo i du jjog sesange
Hey na-na-na
Can''t hold me down ''cuz you know I''m a fighter
Je ballo deuleoon aleumdaun gamog
Find me and I''m gonna live with ya

[Chorus: Sia, (All)]
(Eh-oh)
I''m alright, bring the pain on, yeah
(Eh-oh)
I''ma fight, bring the pain on, yeah
Rain be pourin''
Sky keep fallin''
Everyday oh na-na-na
(Eh-oh)
I''m alright, bring the pain on, yeah

[Verse 3: jhope]
Bring the pain
Modu nae piwa sali doegessji
Bring the pain
No fear, bangbeobeul algesseuni
Jageun geose breathe
Geugeon eodum sog nae sansowa bich
Naega naige haneun geosdeului him
Neomeojyeodo dasi ileona scream

[Verse 4: Suga]
Neomeojyeodo dasi ileona scream
Eonjena ulin geulaesseuni
Seollyeong nae muleupi ttange daheuljieonjeong
Pamudhiji anhneun isang
Geujeo geuleon haepeuningjjeum doel geolan geol
Win no matter what
Win no matter what
Win no matter what
Nega mwoladeon nuga mwoladeon
I don''t give a uhh
I don''t give a uhh
I don''t give a uhh yeah

[Pre-Chorus: Jimin, V]
Hey na-na-na
Michiji anheulyeomyeon michyeoya hae
Hey na-na-na
Naleul da deonjyeo i du jjog sesange
Hey na-na-na
Can''t hold me down ''cuz you know I''m a fighter
Je ballo deuleoon aleumdaun gamog
Find me and I''m gonna live with ya

[Chorus: All]
(Eh-oh)
I''m alright, bring the pain on, yeah
(Eh-oh)
I''ma fight, bring the pain on, yeah
Rain be pourin''
Sky keep fallin''
Everyday oh na-na-na
(Eh-oh)
I''m alright, bring the pain on, yeah

[Bridge: Jungkook, Jimin]
Naui gotongi issneun gose
Naega sum swige hasoseo
My everythin''
My blood and tears
Got no fears
I''m singin'' ohhhhh
Oh I''m takin'' over
You should know yeah
Can''t hold me down ''cuz you know I''m a fighter
Kkamkkamhan simyeon sog gikkeoi jamgyeo
Find me and I''m gonna bleed with ya

[Chorus: Sia, Jimin, Jin, (All)]
(Eh-oh)
I''m alright, bring the pain on, yeah
(Eh-oh)
I''ma fight, bring the pain on, yeah
Rain be pourin''
Sky keep fallin''
Everyday oh na-na-na
(Eh-oh)
Find me and I''m gonna bleed with ya

[Outro: All, Jungkook]
(Eh-oh)
I''m alright, bring the pain on, yeah
(Eh-oh)
I''ma fight, bring the pain on, yeah
All that I know is just goin'' on & on & on & on
(Eh-oh)
I''m alright, bring the pain on, yeah', N'04:07', 15, 0, 11, N'216c6578-3773-4d60-bd83-7f41be16bffbON - BTS Sia (NhacPro.net).mp3', CAST(N'2021-05-11' AS Date), CAST(N'2021-05-13' AS Date), 1, 0, 1, 4, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (35, N'Life Goes On', N'24f7b8db-500d-4304-8367-92f339af2e8dmaxresdefault.jpg', N'[Verse 1: Jung Kook, Jimin]
Eoneu nal sesangi meomchwosseo
Amureon yegodo hana eopsi
Bomeun gidarimeul mollaseo
Nunchi eopsi wabeoryeosseo
Baljagugi jiwojin geori
Yeogi neomeojyeoinneun na
Honja gane sigani
Mianhae maldo eopsi, yeah

[Verse 2: RM]
Oneuldo biga naeril geot gata
Heumppeok jeojeobeoryeonne
Ajikdo meomchujil ana
Jeo meokgureumboda ppalli dallyeoga
Geureom doel jul arannеunde
Na gyeou saraminga bwa
Mopsi apeunе
Sesangiran nomi jun gamgi
Deokbune nulleoboneun meonji ssain doegamgi
Neomeojin chae cheonghaneun eotbakjaui chum
Gyeouri omyeon naeswija
Deo tteugeoun sum

[Pre-Chorus: V, Jung Kook]
Kkeuchi boiji ana
Chulguga itgin halkka
Bari ttejijil ana ana oh
Jamsi du nuneul gama
Yeogi nae soneul jaba
Jeo miraero daranaja

[Chorus: Jung Kook & Jimin]
Like an echo in the forest
Haruga doraogetji
Amu ildo eopdan deusi
Yeah, life goes on
Like an arrow in the blue sky
Tto haru deo naragaji
On my pillow, on my table
Yeah, life goes on
Like this again

[Verse 3: SUGA]
I eumageul billyeo neoege na jeonhalge (Ay)
Saramdeureun marhae sesangi da byeonhaetdae (No)
Mh-hm-hm-hm
Dahaenghido uri saineun
Ajik yeotae an byeonhaenne

[Verse 4: j-hope, Jung Kook]
Neul hadeon sijakgwa kkeut ‘annyeong’iran mallo
Oneulgwa naeireul tto hamkke ieobojago (Ooh, ooh, ooh, oh-woah)
Ooh Meomchwoitjiman eodume sumji ma
Bicheun tto tteooreunikkan

[Pre-Chorus: V & Jung Kook, Jin]
Kkeuchi boiji ana
Chulguga itgin halkka
Bari ttejijil ana ana oh
Jamsi du nuneul gama (Gama)
Yeogi nae soneul jaba (Jaba)
Jeo miraero daranaja (Oh, oh, oh)

[Chorus: All, Jimin]
Like an echo in the forest
Haruga doraogetji
Amu ildo eopdan deusi
Yeah, life goes on (Oh, woah)
Like an arrow in the blue sky
Tto haru deo naragaji (Naragaji)
On my pillow, on my table
Yeah, life goes on
Like this again

[Outro: Jimin & V]
I remember
I, I, I remember
Ah, ah
I remember
I, I, I remember
Ah, ah', N'03:28', 1, 800, 11, N'bcdc1ecc-a8da-4cdd-aa07-5d42a322d2a0Life Goes On - BTS (NhacPro.net).mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 4, NULL, 1, 1, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (36, N'Idol', N'2d0f6234-9f31-479e-8b21-7cb01fd64270BTS-IDOL-2.jpg', N'You can call me artist
You can call me idol
Anim eotteon daleun mwola haedo
I don''t care
I''m proud of it
Nan jayulobne
No more irony
Naneun hangsang nayeossgie

Songalagjil hae, naneun jeonhyeo singyeong sseuji anhne
Naleul yoghaneun neoui geu iyuga mwodeun gan-e
I know what I am
I know what I want
I never gon'' change
I never gon'' trade
(Trade off)

Mwol eojjeogo jeojjeogo tteodeul-eodaesyeo
I do what I do, geunikka neon neona jalhasyeo
You can''t stop me lovin'' myself

Eolssu johda
You can''t stop me lovin'' myself
Jihwaja johda
You can''t stop me lovin'' myself

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu

Face off machi ousam, ay
Top star with that spotlight, ay
Ttaelon syupeohieologa dwae
Dollyeodae neoui Anpanman
24sigan-i jeogji
Hesgallim, naegen sachi
I do my thang
I love myself

I love myself, I love my fans
Love my dance and my what
Nae sog-an-en myeoch sib myeoch baegmyeong-ui naega iss-eo
Oneul tto daleun nal maj-ihae
Eochapi jeonbu da naigie
Gominbodaneun gyang dalline
Runnin'' man
Runnin'' man
Runnin'' man

Mwol eojjeogo jeojjeogo tteodeul-eodaesyeo
I do what I do, geunikka neon neona jalhasyeo
You can''t stop me lovin'' myself

Eolssu johda
You can''t stop me lovin'' myself
Jihwaja johda
You can''t stop me lovin'' myself

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu

I''m so fine wherever I go
Gakkeum meolli dol-agado
It''s okay, I''m in love with my-my myself
It''s okay, nan i sungan haengboghae

Eolssu johda
You can''t stop me lovin'' myself
Jihwaja johda
You can''t stop me lovin'' myself

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu

OHOHOHOH
OHOHOHOHOHOH
OHOHOHOH
Deong-gideog kungdeoleoleo
Eolssu', N'04:20', 1, 0, 11, N'471a4022-f7ba-40ab-9918-0da0832dc0c7IDOL - BTS (NhacPro.net).mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 4, NULL, 1, 1, NULL, 0, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (37, N'How You Like That', N'e0cb3184-8677-48f0-b4a0-8b596ac12a9ahylt-poster-1592784840060717374470-15929037318401929119192.jpeg', N'[Intro: All]
(Lovesick girls)
(Lovesick girls)

[Verse 1: Jennie, All]
Yeong wonhan bam
Changmun eobsneun bange uril gadun love (Love)
What can we say?
Maebeon apado oechineun love (Love)

[Verse 2: Lisa]
Dachigo manggajyeodo na
Mwol midgo beotineun geoya
Eochapi tteonamyeon sangcheotuseongin chaelo miwohage doegreol
Kkeutjangeul bogi jeon kkeutnael sun eobseo
Iapeumeul gidalin geoscheoleom

[Pre-Chorus: Jisoo, Rosé]
Ama da jamkkan iljido molla
Ulin mueol chajaseo hemaeneun geolkka
But I don''t care I''ll do it over and over
Nae sesang sogen neoman isseumyeon dwae

[Chorus: All]
We are the lovesick girls
Ne meosdaelo nae salangeul kkeutnaelsun eobseo
We are the lovesick girls
Iapeum eobsin nan amu uimiga eobseo

[Post-Chorus: All]
But we were born to be alone
Yeah, we were born to be alone
Yeah, we were born to be alone
But why we still looking for love?

[Verse 3: Lisa, Jennie]
No love letters, no X and O''s
No love, never, my exes know
No diamond rings, that set in stone
To the left, better left alone
Didn''t wanna be a princess, I''m priceless
A prince not even on my list
Love is a drug that I quit
No doctor could help when I''m lovesick

[Pre-Chorus: Rosé, Jisoo]
Ama da jamkkan iljido molla
Urin mueol chajaseo hemaeneun geolkka
Buranhan nae nunbich soge neol dama
Apeudeolado neoman isseumyeon dwae

[Chorus: All]
We are the lovesick girls
Ne meosdaelo nae salangeul kkeutnael sun eobseo
We are the lovesick girls
Iapeum eobsin nan amu uimiga eobseo

[Post-Chorus: Rosé & Jennie]
But we were born to be alone
Yeah, we were born to be alone
Yeah, we were born to be alone
But why we still looking for love

[Bridge: Rosé, Jisoo]
Salangeun slippin'' and fallin''
Salangeun killin'' your darlin''
Apeuda amulmyeontto chajaoneun i geob eobsneun tteollim
Deulliji anha what you say
Iapeumi nan haengbokhae
Naleul bulssanghae haneun nega nae nunen deo bulssanghae

[Chorus: All]
We are the lovesick girls
Ne meosdaelo nae salangeul kkeutnael sun eobseo
We are the lovesick girls
Iapeumeobsin nan amu uimiga eobseo

[Spoken: Lisa]
One, two

[Outro: All, Rosé, Jennie]
(Lovesick girls) Modu gyeolgug tteonagago
(Lovesick girls) Nae nunmuli mudyeojyeodo
(Lovesick girls) Apeugotto apado
(Lovesick girls)
But we''re still looking for love', N'03:01', 100, 0, 11, N'4030ea67-e760-412e-9b8d-e36595491b98HowYouLikeThat-BLACKPINK-6720100.mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 4, NULL, 1, 1, NULL, 1, 0, 0)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id], [music_vip], [music_avgrate], [music_vote]) VALUES (38, N'Nàng thơ', N'93fb4434-ee92-482c-8c6c-2c1edbc41724Rdfa5c7e82246daf7d77062c8b4a4ebb4.jfif', N'Em không là ca sỹ', N'3', 1, 0, 14, N'22437574-7a16-4aa9-ab6f-e64e850debd5NangTho-HoangDung-6413381.mp3', CAST(N'2021-05-11' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Musics] OFF
GO
SET IDENTITY_INSERT [dbo].[National] ON 

INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (2, N'Việt Nam', 1, 0, CAST(N'2021-03-17T13:48:44.427' AS DateTime), CAST(N'2021-03-17T13:48:44.427' AS DateTime), 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (3, N'Âu Mỹ', 1, 0, CAST(N'2021-03-18T09:46:35.997' AS DateTime), CAST(N'2021-03-18T09:46:35.997' AS DateTime), 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (4, N'Hàn Quốc', 1, 0, CAST(N'2021-05-10T14:28:28.920' AS DateTime), NULL, 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (5, N'Trung Quốc', 1, 0, CAST(N'2021-05-10T14:29:08.193' AS DateTime), NULL, 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (6, N'Nhật Bản', 1, 0, CAST(N'2021-05-10T14:29:20.040' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[National] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 

INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month], [package_type]) VALUES (2, N'1 THÁNG', 45000.0000, N'Gói Miễn Phí', CAST(N'2021-03-19T08:52:36.903' AS DateTime), 1, 0, 45000, NULL, 1, 1, NULL)
INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month], [package_type]) VALUES (4, N'1 NĂM', 5000000.0000, N'Gói  Vip 1 năm', NULL, 1, 0, 500000, NULL, 1, 12, NULL)
INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month], [package_type]) VALUES (5, N'2 NĂM', 900000.0000, N'Gói  Vip 2 năm', NULL, 1, 0, 900000, NULL, 1, 24, NULL)
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (3, 8, 5, CAST(N'2021-05-04T15:42:06.817' AS DateTime), NULL, 900000.0000, NULL, 1)
INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (4, 12, 2, CAST(N'2021-05-11T22:35:21.340' AS DateTime), NULL, 450000.0000, NULL, 1)
INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (5, 12, 2, CAST(N'2021-05-11T22:35:21.843' AS DateTime), NULL, 450000.0000, NULL, 1)
INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (6, 14, 2, CAST(N'2021-05-11T22:46:09.477' AS DateTime), NULL, 450000.0000, NULL, 1)
INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (7, 14, 2, CAST(N'2021-05-11T22:46:09.987' AS DateTime), NULL, 450000.0000, NULL, 1)
INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (8, 13, 4, CAST(N'2021-05-13T11:19:21.993' AS DateTime), NULL, 500000.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[Pays] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayList] ON 

INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (1, 1, 21, CAST(N'2021-05-10T14:06:21.603' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (2, 2, 21, CAST(N'2021-05-10T14:06:21.743' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (22, 1, 23, CAST(N'2021-05-11T11:40:43.507' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (23, 2, 23, CAST(N'2021-05-11T11:40:43.513' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (27, 1, 24, CAST(N'2021-05-11T11:46:54.540' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (28, 2, 24, CAST(N'2021-05-11T11:46:54.547' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (29, 1, 27, CAST(N'2021-05-11T11:51:43.053' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (30, 2, 27, CAST(N'2021-05-11T11:51:43.057' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (31, 1, 26, CAST(N'2021-05-11T11:51:55.873' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (32, 2, 26, CAST(N'2021-05-11T11:51:55.877' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (33, 1, 28, CAST(N'2021-05-11T11:52:06.930' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (34, 2, 28, CAST(N'2021-05-11T11:52:06.937' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (35, 1, 29, CAST(N'2021-05-11T12:08:42.160' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (36, 2, 29, CAST(N'2021-05-11T12:08:42.207' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (37, 2, 30, CAST(N'2021-05-11T12:10:46.833' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (38, 2, 30, CAST(N'2021-05-11T12:12:45.983' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (39, 1, 31, CAST(N'2021-05-11T12:13:15.453' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (40, 3, 32, CAST(N'2021-05-11T13:43:31.320' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (41, 3, 33, CAST(N'2021-05-11T13:50:05.080' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (43, 3, 35, CAST(N'2021-05-11T13:55:52.933' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (44, 3, 36, CAST(N'2021-05-11T13:59:26.017' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (45, 3, 37, CAST(N'2021-05-11T14:40:21.800' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (46, 7, 28, CAST(N'2021-05-11T22:36:42.573' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (47, 8, 28, CAST(N'2021-05-11T22:47:41.523' AS DateTime))
INSERT [dbo].[PlayList] ([playlist_id], [albums_id], [music_id], [playlist_datecreate]) VALUES (48, 3, 34, CAST(N'2021-05-13T11:42:23.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[PlayList] OFF
GO
SET IDENTITY_INSERT [dbo].[Quest] ON 

INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (1, 10, CAST(N'2021-03-30T00:00:00.000' AS DateTime), CAST(N'2021-05-30T00:00:00.000' AS DateTime), 1, 1, NULL, 1, N'Người Việt Nghe Nhạc Việt', 300, 250, 200, 100)
INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (2, 10, CAST(N'2021-05-03T16:52:00.000' AS DateTime), CAST(N'2021-05-30T16:53:00.000' AS DateTime), 1, 4, NULL, 1, N'Nghe Nhạc Cùng Erik', 200, 150, 100, 50)
INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (3, 10, CAST(N'2021-05-11T18:36:00.000' AS DateTime), CAST(N'2021-05-15T18:36:00.000' AS DateTime), 1, 4, NULL, 8, N'Cùng Sky Cày View Cho Sơn Tùng', 5000, 3000, 2000, 1000)
INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (4, 1, CAST(N'2021-05-11T22:32:00.000' AS DateTime), CAST(N'2021-05-30T22:32:00.000' AS DateTime), 1, 1, NULL, 13, N'Nghe Nhạc Ballad  ', 600000, 500000, 400000, 600000)
SET IDENTITY_INSERT [dbo].[Quest] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestGroup] ON 

INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (1, 2, 2, CAST(N'2021-05-03T22:16:12.427' AS DateTime), 1, 1, 10)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (2, 1, 10, CAST(N'2021-05-03T22:16:12.427' AS DateTime), 1, 1, 0)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (3, 2, 8, CAST(N'2021-05-11T14:52:25.447' AS DateTime), 0, NULL, 7)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (4, 3, 2, CAST(N'2021-05-11T18:37:47.583' AS DateTime), 0, NULL, 3)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (5, 3, 12, CAST(N'2021-05-11T22:29:27.043' AS DateTime), 0, NULL, 2)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (6, 3, 14, CAST(N'2021-05-11T22:41:30.760' AS DateTime), 0, NULL, 4)
INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (7, 1, 6, CAST(N'2021-05-13T12:17:05.633' AS DateTime), 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[QuestGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Người Dùng')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Singers] ON 

INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (1, N'Erik', 1, 0, N'Lê Trung Thành, thường được biết đến với nghệ danh Erik là một nam ca sĩ kiêm vũ công người Việt Nam. Anh từng tham gia chương trình Giọng hát Việt nhí năm 2013 và sau đó trở thành thành viên nhóm nhạc Monstar.', N'3c074b08-39a5-4e88-90be-dd7a4a753bf6erik.jpg', CAST(N'2021-03-16T15:20:48.000' AS DateTime), CAST(N'2021-05-11T16:46:58.143' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (2, N'Hoà Minzy', 1, 0, N'Nguyễn Thị Hòa thường được biết đến với nghệ danh Hoà Minzy, là một nữ ca sĩ, người dẫn chương trình kiêm diễn viên điện ảnh & diễn viên truyền hình người Việt Nam. Cô là quán quân Học viện Ngôi sao mùa đầu tiên 2014.', N'b2ac5925-f11d-43bf-be27-8acb94614642HoaMinzy.jpg', CAST(N'2021-05-10T12:59:36.000' AS DateTime), CAST(N'2021-05-11T16:47:22.020' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (3, N'Đức Phúc', 1, 0, N'Nguyễn Đức Phúc là một nam ca sĩ người Việt Nam được biết đến rộng rãi với tư cách quán quân của The Voice Vietnam 2015.', N'885cb19b-8920-40fc-b5cd-db9ea63ab1e9DucPhuc.jpg', CAST(N'2021-05-10T12:59:51.000' AS DateTime), CAST(N'2021-05-11T16:47:44.130' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (4, N'Bùi Anh Tuấn', 1, 0, N'Bùi Anh Tuấn là một nam ca sĩ người Việt Nam. Anh bắt đầu được biết đến khi giành lần lượt giải nhất cuộc thi Coca-Cola Music Award và Ngôi Sao Tiếng Hát Truyền Hình năm 2011, và trở nên nổi tiếng trong giới trẻ kể từ khi tham gia The Voice Vietnam 2012 với ca khúc Nơi Tình Yêu Bắt Đầu của nhạc sĩ Phùng Tiến Minh.', N'8366680a-26fd-44f3-b40f-a3045c326114BuiAnhTuan.jpg', CAST(N'2021-05-10T13:00:09.000' AS DateTime), CAST(N'2021-05-11T16:48:05.787' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (5, N'Hoàng Dũng', 1, 0, N'Nguyễn Hoàng Dũng, hay còn được biết đến với nghệ danh Hoàng Dũng, là một nam ca sĩ, nhạc sĩ tại Việt Nam. Anh từng đạt danh hiệu Á quân cuộc thi Giọng Hát Việt năm 2015 và lọt top 10 Bài hát hay nhất năm 2016. ', N'59c73cb8-a65b-4b1b-8fef-71fe59127d7f1220288382927313716859573645095604654491688n-16101031804831454318129.jpg', CAST(N'2021-05-10T13:00:27.000' AS DateTime), CAST(N'2021-05-11T16:48:57.397' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (6, N'Hứa Kim Tuyền', 1, 0, N'Hứa Kim Tuyền, là một nam nhạc sĩ, nhà sản xuất âm nhạc của St.319 Entertainment. Anh bắt đầu được biết đến qua cuộc thi Sing My Song - Bài Hát Hay Nhất, thu hút sự chú ý của khán giả với ca khúc "Tình Lãng Phí", "Cupid Học Yêu". ', N'8be6f8d7-9250-4d6b-954c-8db78600ca61dinh-dung-10-16152844410591760877811.png', CAST(N'2021-05-10T13:00:49.000' AS DateTime), CAST(N'2021-05-11T16:50:11.430' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (7, N'Mr.Siro', 1, 0, N'Vương Quốc Tuân, thường được biết đến với nghệ danh Mr. Siro, sinh ngày 14 tháng 11 năm 1981 tại Thành phố Hồ Chí Minh, là một nhạc sĩ và ca sĩ người Việt Nam. ', N'411687a6-38c6-427c-b005-b309287753f0Siro.jpg', CAST(N'2021-05-10T13:01:44.000' AS DateTime), CAST(N'2021-05-11T16:50:31.873' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (8, N'Sơn Tùng MTP', 1, 0, N'Nguyễn Thanh Tùng, thường được biết đến với nghệ danh Sơn Tùng M-TP, là một nam ca sĩ kiêm sáng tác nhạc, rapper và diễn viên người Việt Nam. Sinh ra ở thành phố Thái Bình, thời thơ ấu, Tùng thường đi hát ở Cung văn hoá thiếu nhi tỉnh Thái Bình và học chơi đàn organ.', N'b6627f92-04db-460d-8e12-7eada9206270MTP.jpg', CAST(N'2021-05-10T13:02:02.000' AS DateTime), CAST(N'2021-05-11T16:50:55.320' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (9, N'Jack', 1, 0, N'Trịnh Trần Phương Tuấn, thường được biết đến với nghệ danh Jack là một nam ca sĩ kiêm sáng tác nhạc, rapper người Việt Nam. Jack bắt đầu được biết đến khi hoạt động trong nhóm nhạc G5R và phát hành bài hát "Hồng nhan". ', N'6dec211f-53c3-452d-86a1-5981710fc4ebJack.jpg', CAST(N'2021-05-10T13:02:20.000' AS DateTime), CAST(N'2021-05-11T16:51:12.837' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (10, N'Quân AP', 1, 0, N'Ngày/nơi sinh: 24 tháng 1, 1997 (24 tuổi), Hà Nội Tên đầy đủ: Phạm Anh Quân Quốc tịch: Việt Nam Đề cử: Giải Làn Sóng Xanh cho Gương mặt mới xuất sắc, Giải Làn Sóng Xanh cho Ca sĩ đột phá', N'49177b0c-1c39-49e6-886b-4d1670972b4dQuanAP.jpg', CAST(N'2021-05-10T13:02:36.000' AS DateTime), CAST(N'2021-05-11T16:51:36.607' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (11, N'Tăng Phúc', 1, 0, N'Tăng Phúc (tên thật là Tăng Vũ Minh Phúc, sinh ngày 22/05/1993 tại Sóc Trăng), là nam ca sĩ trẻ người Việt Nam. Khi còn là sinh viên, Tăng Phúc thử sức với vai trò người mẫu khi tham gia một cuộc thi người mẫu dành cho tuổi teen.', N'49a7d3dc-04e8-4352-ad29-5d41532dadd6tang-phuc-hoang-tu-tinh-ca-cua-da-lat-006f244d.jpg', CAST(N'2021-05-10T13:04:24.000' AS DateTime), CAST(N'2021-05-11T16:52:21.937' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (12, N'Hiền Hồ', 1, 0, N'Hiền Hồ là nữ ca sĩ giành giải Á quân chương trình Giọng hát Việt khi mới 20 tuổi, cô theo đuổi dòng nhạc Ballad với giai điệu trữ tình cùng ca từ sâu sắc khiến hàng triệu trái tim xao xuyến.', N'e2a770e2-611f-412c-bac7-ce5cf30bed81HienHo.jpg', CAST(N'2021-05-10T13:55:38.000' AS DateTime), CAST(N'2021-05-11T16:52:44.967' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (13, N'Noo Phước Thịnh', 1, 0, N'Nguyễn Phước Thịnh hay còn được biết đến với nghệ danh Noo Phước Thịnh là một ca sĩ người Việt Nam. Anh là quán quân của The Remix mùa thứ 2 và là huấn luyện viên của các cuộc thi Giọng hát Việt nhí mùa 4, Giọng hát Việt mùa 4 và Giọng Hát Việt mùa 5. ', N'58de5d27-0af3-43ae-99f8-b0984954e706noo.jpg', CAST(N'2021-05-11T10:12:53.000' AS DateTime), CAST(N'2021-05-11T16:53:05.093' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (14, N'BTS', 1, 0, N'BTS, hay còn được gọi là Bangtan Boys, là một nhóm nhạc nam Hàn Quốc được thành lập bởi Big Hit Entertainment vào năm 2010 và ra mắt vào năm 2013. Nhóm bao gồm 7 thành viên Jin, Suga, J-Hope, RM, Jimin, V và Jungkook. Các thành viên đồng sáng tác và tự sản xuất phần lớn các sản phẩm âm nhạc của riêng họ.', N'84a802a0-9155-4289-af02-da68cf79e53evuitton01-1620187833714431535253.jpeg', CAST(N'2021-05-11T10:24:49.000' AS DateTime), CAST(N'2021-05-11T16:53:28.557' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (15, N'Black Pink', 1, 0, N'Blackpink là một nhóm nhạc nữ Hàn Quốc do công ty YG Entertainment thành lập và quản lý. Nhóm gồm 4 thành viên Jisoo, Jennie, Rosé, Lisa. Blackpink chính thức ra mắt với album đĩa đơn đầu tay mang tên Square One gồm hai ca khúc "Boombayah" và "Whistle". ', N'db1ec7cc-44c1-44d2-8605-6912d71be368photo-1-1620209620214806160956.jpeg', CAST(N'2021-05-11T10:25:48.000' AS DateTime), CAST(N'2021-05-11T16:53:57.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[Singers] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (1, N'thiet-ke-poster-su-kien-ca-nhac.jpg', N'Top 100 bài hát hay nhất ', NULL, NULL, 1)
INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (2, N'FPT_MH_Web_banner-5.png', N'Top nhạc Vũ Cát Tường', NULL, NULL, 1)
INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (3, N'mbfmusic-1013394.jpg', N'Top 100 bài hát hay nhất ', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (1, N'Vy', N'5506db36-a1f0-48c5-a1ff-9298b5380ee2img_the_scream.jpg', N'Phuongvy99@gmail.com', N'Phuongvy', NULL, CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-17T12:10:24.580' AS DateTime), 1, 1, 0, N'Music_Admin', 1500, CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, N'0924404019', NULL, NULL, 0, CAST(N'2021-03-16T15:20:48.597' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (2, N'Phương Vy', N'5506db36-a1f0-48c5-a1ff-9298b5380ee2img_the_scream.jpg', N'huynhminhtan4019@gmail.com', N'0924404019Aa@', N'3f277146-bac5-4af3-ac93-10c6d607912a', CAST(N'2021-03-28T13:31:19.083' AS DateTime), CAST(N'2021-03-28T13:31:19.083' AS DateTime), 1, 1, 0, N'#Music_Admin', 300, NULL, NULL, N'0924404019', NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (3, N'Phương Vy', N'133d7c67-d6fa-412b-bf0d-a11c9fcde9d9anhluanlaly do.jpg', N'laptring@gmail.com', N'0924404019', N'b3df0696-fc3b-4230-b297-3eda3f8604ca', CAST(N'2021-03-28T13:32:01.037' AS DateTime), CAST(N'2021-03-28T13:32:01.037' AS DateTime), 1, 1, 0, N'#Music_Admin', 0, NULL, NULL, N'0924404019', NULL, NULL, 0, CAST(N'2021-04-28T21:41:53.357' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (4, N'Phương Vy', N'133d7c67-d6fa-412b-bf0d-a11c9fcde9d9anhluanlaly do.jpg', N'jinnienguyen90@gmail.com', N'Phuongvy99**', N'5c0385b3-320d-4fc9-9005-2f72659b200c', CAST(N'2021-03-29T13:55:19.310' AS DateTime), CAST(N'2021-03-29T13:55:19.310' AS DateTime), 1, 1, 0, N'#Music_Admin', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-03-29T14:03:53.787' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (6, N'Phương Vy', N'133d7c67-d6fa-412b-bf0d-a11c9fcde9d9anhluanlaly do.jpg', N'vy@gmail.com', N'Phuongvy99&&', N'ccd32928-7b11-4a7c-8209-daf685469e14', CAST(N'2021-03-29T14:21:23.007' AS DateTime), CAST(N'2021-03-29T14:21:23.007' AS DateTime), 1, 1, 0, N'vy@gmail.com4f8a12', 200, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (8, N'Phương Vy', N'Userimg.png', N'phuongvy@gmail.com', N'Phuongvy99@@', N'3b7dad64-c23a-4a4f-bf27-311f0ccd1abe', CAST(N'2021-05-04T15:20:36.967' AS DateTime), CAST(N'2021-05-04T15:20:36.967' AS DateTime), 1, 1, 0, N'#phuon54e2f6', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-05-04T15:42:06.800' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (10, N'Phương Vy', N'5506db36-a1f0-48c5-a1ff-9298b5380ee2img_the_scream.jpg', N'laptring123@gmail.com', N'0924404019a@Aa', N'32a2f546-5939-4e8f-b17f-45fc6895cba6', CAST(N'2021-05-10T10:26:02.950' AS DateTime), CAST(N'2021-05-10T10:26:02.950' AS DateTime), 1, 1, 0, N'#laptrd044e1', 200, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (11, N'Phương Vy', N'Userimg.png', N'Admin@gmail.com', N'Admin123!!', N'33fcfff3-9139-4602-879b-bc5da0eaa565', CAST(N'2021-05-10T12:48:15.997' AS DateTime), CAST(N'2021-05-10T12:48:15.997' AS DateTime), 1, 1, 0, N'#Adminb99067', 200, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (12, N'phương vy', N'Userimg.png', N'phuongvy01@gmail.com', N'Phuongvy99**', N'1cc5ab5c-65ba-4e07-babd-01d5ffca528e', CAST(N'2021-05-11T22:28:34.050' AS DateTime), CAST(N'2021-05-11T22:28:34.050' AS DateTime), 1, 1, 0, N'#phuond7a6f8', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-06-11T22:35:21.840' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (13, N'Phương Vy', N'Userimg.png', N'vyvy@gmail.com', N'Phuongvy99**', N'64195cc9-1d87-42de-a007-ef93e1cf65a0', CAST(N'2021-05-11T22:38:29.037' AS DateTime), CAST(N'2021-05-11T22:38:29.037' AS DateTime), 1, 1, 0, N'#vyvy@665a81', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-13T11:19:21.687' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (14, N'Phương Vy', N'Userimg.png', N'vyvy01@gmail.com', N'Phuongvy99**', N'a3f69af7-0208-453c-9326-043e36eff391', CAST(N'2021-05-11T22:40:55.767' AS DateTime), CAST(N'2021-05-11T22:40:55.767' AS DateTime), 1, 1, 0, N'#vyvy00f6d08', 350000, NULL, NULL, N'0924404019', NULL, NULL, 1, CAST(N'2021-06-11T23:02:43.990' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_Users]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Musics] FOREIGN KEY([music_id])
REFERENCES [dbo].[Musics] ([music_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Musics]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Categories]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Musics] FOREIGN KEY([music_id])
REFERENCES [dbo].[Musics] ([music_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Musics]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Musics1] FOREIGN KEY([music_id])
REFERENCES [dbo].[Musics] ([music_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Musics1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Singers] FOREIGN KEY([singer_id])
REFERENCES [dbo].[Singers] ([singer_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Singers]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Users]
GO
ALTER TABLE [dbo].[Historys]  WITH CHECK ADD  CONSTRAINT [FK_Historys_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Historys] CHECK CONSTRAINT [FK_Historys_Users]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_Albums] FOREIGN KEY([album_id])
REFERENCES [dbo].[Albums] ([album_id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_Albums]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_Genres] FOREIGN KEY([genres_id])
REFERENCES [dbo].[Genres] ([genres_id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_Genres]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_National] FOREIGN KEY([nation_id])
REFERENCES [dbo].[National] ([nation_id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_National]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_Users]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_MusicsList_Authors] FOREIGN KEY([author_id])
REFERENCES [dbo].[Authors] ([author_id])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_MusicsList_Authors]
GO
ALTER TABLE [dbo].[Pays]  WITH CHECK ADD  CONSTRAINT [FK_Pays_Packages] FOREIGN KEY([pakage_id])
REFERENCES [dbo].[Packages] ([package_id])
GO
ALTER TABLE [dbo].[Pays] CHECK CONSTRAINT [FK_Pays_Packages]
GO
ALTER TABLE [dbo].[Pays]  WITH CHECK ADD  CONSTRAINT [FK_Pays_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Pays] CHECK CONSTRAINT [FK_Pays_Users]
GO
ALTER TABLE [dbo].[PlayList]  WITH CHECK ADD  CONSTRAINT [FK_PlayList_Albums] FOREIGN KEY([albums_id])
REFERENCES [dbo].[Albums] ([album_id])
GO
ALTER TABLE [dbo].[PlayList] CHECK CONSTRAINT [FK_PlayList_Albums]
GO
ALTER TABLE [dbo].[PlayList]  WITH CHECK ADD  CONSTRAINT [FK_PlayList_Musics] FOREIGN KEY([music_id])
REFERENCES [dbo].[Musics] ([music_id])
GO
ALTER TABLE [dbo].[PlayList] CHECK CONSTRAINT [FK_PlayList_Musics]
GO
ALTER TABLE [dbo].[Quest]  WITH CHECK ADD  CONSTRAINT [FK_Quest_Categories] FOREIGN KEY([quest_category])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Quest] CHECK CONSTRAINT [FK_Quest_Categories]
GO
ALTER TABLE [dbo].[Quest]  WITH CHECK ADD  CONSTRAINT [FK_Quest_National] FOREIGN KEY([quest_national])
REFERENCES [dbo].[National] ([nation_id])
GO
ALTER TABLE [dbo].[Quest] CHECK CONSTRAINT [FK_Quest_National]
GO
ALTER TABLE [dbo].[Quest]  WITH CHECK ADD  CONSTRAINT [FK_Quest_Singers] FOREIGN KEY([quest_singer])
REFERENCES [dbo].[Singers] ([singer_id])
GO
ALTER TABLE [dbo].[Quest] CHECK CONSTRAINT [FK_Quest_Singers]
GO
ALTER TABLE [dbo].[QuestGroup]  WITH CHECK ADD  CONSTRAINT [FK_QuestGroup_Quest] FOREIGN KEY([quest_id])
REFERENCES [dbo].[Quest] ([quest_id])
GO
ALTER TABLE [dbo].[QuestGroup] CHECK CONSTRAINT [FK_QuestGroup_Quest]
GO
ALTER TABLE [dbo].[QuestGroup]  WITH CHECK ADD  CONSTRAINT [FK_QuestGroup_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[QuestGroup] CHECK CONSTRAINT [FK_QuestGroup_Users]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Comment]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Reply_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Reply_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-2d6bab61-b489-4ef9-8fec-3cea6d9aa114]    Script Date: 05/13/2021 03:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-2d6bab61-b489-4ef9-8fec-3cea6d9aa114] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114') > 0)   DROP SERVICE [SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114]; if (OBJECT_ID('SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-2d6bab61-b489-4ef9-8fec-3cea6d9aa114]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-2d6bab61-b489-4ef9-8fec-3cea6d9aa114]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-465f1dfe-4542-424c-86f6-991f733256e1]    Script Date: 05/13/2021 03:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-465f1dfe-4542-424c-86f6-991f733256e1] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1') > 0)   DROP SERVICE [SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1]; if (OBJECT_ID('SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-465f1dfe-4542-424c-86f6-991f733256e1]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-465f1dfe-4542-424c-86f6-991f733256e1]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-68068e8e-bf59-4c96-a45e-bf858ef5a652]    Script Date: 05/13/2021 03:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-68068e8e-bf59-4c96-a45e-bf858ef5a652] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652') > 0)   DROP SERVICE [SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652]; if (OBJECT_ID('SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-68068e8e-bf59-4c96-a45e-bf858ef5a652]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-68068e8e-bf59-4c96-a45e-bf858ef5a652]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-89f389e8-9b99-4778-af70-96195be632cc]    Script Date: 05/13/2021 03:14:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-89f389e8-9b99-4778-af70-96195be632cc] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc') > 0)   DROP SERVICE [SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc]; if (OBJECT_ID('SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-89f389e8-9b99-4778-af70-96195be632cc]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-89f389e8-9b99-4778-af70-96195be632cc]; END COMMIT TRANSACTION; END
GO
USE [master]
GO
ALTER DATABASE [MusicProjectData] SET  READ_WRITE 
GO
