USE [master]
GO
/****** Object:  Database [MusicProjectData]    Script Date: 5/5/2021 3:42:12 PM ******/
CREATE DATABASE [MusicProjectData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicProjectData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicProjectData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicProjectData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicProjectData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [MusicProjectData] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[Albums]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Authors]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Genres]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 5/5/2021 3:42:12 PM ******/
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
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 5/5/2021 3:42:12 PM ******/
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
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[music_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[National]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Packages]    Script Date: 5/5/2021 3:42:12 PM ******/
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
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[PlayList]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Quest]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[QuestGroup]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Reply]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Singers]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Sliders]    Script Date: 5/5/2021 3:42:12 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/5/2021 3:42:12 PM ******/
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

INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (1, N'Tổng Hợp Nhạc Việt', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-17' AS Date), NULL, NULL, 1, 0, N'Tổng Hợp Các Bản Nhạc Hay Nhất Việt Nam', N'0029147d-7ee6-43db-bc7c-12e7304589dfAlbumViet.jpg', 1)
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (1, N'Vương Anh Tú', 1, 0, N'Là nhạc sĩ, nhà sản xuất trẻ và là người đứng sau một số hit của các ca sĩ như: Hồ Ngọc Hà, Đông Nhi, Thanh Hà, Ngô Kiến Huy, Hiền Hồ, Đức Phúc, Ông Cao Thắng, Erik, Dương Triệu Vũ, Hari Won, Minh Tuyết, Bùi Anh Tuấn, Noo Phước Thịnh, Miu Lê, Khổng Tú Quỳnh,… ca khúc đầu tiên Vương Anh Tú viết là vào năm lớp 5. Theo chia sẻ, “lúc nhỏ dù rất ngô nghê nhưng anh lại tập tành viết về tình yêu, bài hát ấy được ba mẹ lẫn anh trai góp ý”.
Năm 2013, ngay sau khi trình làng ca khúc “Giúp Anh Trả Lời Những Câu Hỏi”, Vương Anh Tú trở thành hiện tượng mạng trong thời điểm đó với hơn 10 triệu lượt nghe trên các nền tảng nhạc số và ngay lập tức có hit riêng cho mình. Năm 2015, Vương Anh Tú tiếp tục thành công với “Vợ Tuyệt Vời Nhất”, sáng tác cho Vũ Duy Khánh. MV của bài hát đạt hơn 97 triệu lượt nghe sau 12 tháng phát hành.
Các năm sau đó, Vương Anh Tú cũng gặt hái được nhiều thành công trong vai trò nhạc sĩ khi lần lượt các bản phối của “Anh Cứ Đi Đi” (Hari Won) và “Cuộc Sống Em Ổn Không” (Anh Tú) đều trở thành hiện tượng với lần lượt 13 triệu và 149 triệu lượt xem trên YouTube.
Vương Anh Tú là em trai của nhạc sĩ, ca sĩ, nhà sản xuất âm nhạc Vương Quốc Tuân (thường được biết đến với nghệ danh Mr. Siro). Từ nhỏ, hai anh em đã được cha mẹ cho đi học nhạc. Đây là tiền đề cho những sáng tác sau này của cả hai. Song song với việc hoạt động nghệ thuật, Vương Anh Tú cũng đã có thời gian dài tập trung kinh doanh. Nhưng sau đó, vì đam mê, anh đã quay trở lại và theo đuổi con đường sáng tác nhạc của mình.', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime), N'0c0e32f9-9419-425b-8719-09bfed7ad73fvuongAnhTu.jpg')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (1, N'Nhạc Việt', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:17:09.917' AS DateTime), N'fbfe2a1a-852a-4573-812e-18816b209babnotImg.png')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (2, N'Nhạc Trữ Tình', 1, 0, N'Không có', 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:29:44.137' AS DateTime), N'd65443b9-e19e-43db-8f64-407605c54782anhluanlaly do.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (3, N'Nhạc Trung', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:16:57.823' AS DateTime), N'4091c9c5-00a7-42e6-b0f6-f3dd309509ffnotImg.png')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (4, N'Nhạc Trẻ', 1, 0, N'Không Có', 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-16T10:18:21.177' AS DateTime), N'0d0afad1-68da-4852-a95a-7a72fbe1cd08hinh-nen-vu-tru-4k-1-scaled.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([genres_id], [genres_name], [genres_datecreate]) VALUES (1, N'Mp3 1', NULL)
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id]) VALUES (21, N'Laylalaya', N'2e35ccdf-8997-4a92-a834-6a0c4019350djack-va-nhung-thay-doi-trong-mv-laylalay-b54d12eb.jpg', N'Anh đã cố thay đổi màAnh chẳng có gian dối màAnh đã cố yêu hết lòng này cớ saoNhững niềm tin thì chẳng cònNhững lời hứa đã héo mònNơi thân xác kia giữ lại chẳng nghĩ chiBao tháng năm đôi mình đi với nhauEm chỉ toàn những câu mơ mộngNhưng đến nay em thì đã ngủ sayAnh thì đang chơi vơiThứ anh cần là melodyGiữ anh lại đừng để anh điBao tâm sự đầy ắp trên miNgười đã đúng anh đã saiThứ anh cần là melodyGiữ anh lại đừng để anh điBao tâm sự chẳng thể che điNgười đã đúng anh đã sai2. Từng yêu cuồng say nhưng giờ đây đã không mayNgày mai gặp em nhưng mà tay đã trong tayLà ai vì ai mà vai kề vai lướt quaMình yêu đời hơn khi mà ta lắm phong baTựa như quỳnh hương đêm mù sương tốn công taGửi em nhành hoa cho bài ca cách xa nàyBao tháng năm đôi mình đi với nhauEm chỉ toàn những câu mơ mộngNhưng đến nay em thì đã ngủ sayAnh thì đang chơi vơiThứ anh cần là melodyGiữ anh lại đừng để anh điBao tâm sự đầy ắp trên miNgười đã đúng anh đã saiThứ anh cần là melodyGiữ anh lại đừng để anh điBao tâm sự chẳng thể che điNgười đã đúng anh đã saiAnh đã sai[Coda:]Xa cách muôn trùngBồi hồi tìm về lại một giấc mơNgỡ đã một đờiVậy mà đành lòng nào lại đánh rơiĐừng yếu đuối đừng vội vàng ở lần nàyHãy cố giấu, cố che đi nay thôi rơiCả thế giới chẳng người nào được vào lòngTìm ánh nắng xóa mây đen đêm hư khôngĐừng yếu đuối đừng vội vàng ở lần nàyHãy cố giấu, cố che đi nay thôi rơiCả thế giới chẳng người nào được vào lòngTìm ánh nắng xóa mây đen đêm hư khôngLà la láy là là là là lày làyLà la láy lá la la lay layLà la láy là là là là lày làyLà la láy lá la la lay lay', N'03:52', 1, 0, 8, N'dea2bf52-aa35-453d-8b31-7de8d19f0375Laylalay-JackG5R-7003742.mp3', CAST(N'2021-05-04' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, 1)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [album_id]) VALUES (22, N'Tình Bạn Diệu Kỳ', N'5d0e2698-a35a-40ad-9271-1724022b020bloi-bai-hat-tinh-ban-dieu-ky-amee-x-ricky-star-x-lang-ld-kem-hop-am.jpg', N'[Amee]
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
We do everything', N'03:08', 1, 0, 8, N'7afaf272-2994-4c72-8841-70d42f545a1aTinhBanDieuKy-AMeeRickyStarLangLD-6927558.mp3', CAST(N'2021-05-04' AS Date), NULL, 1, 0, 1, 2, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Musics] OFF
GO
SET IDENTITY_INSERT [dbo].[National] ON 

INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (2, N'Việt Nam', 1, 0, CAST(N'2021-03-17T13:48:44.427' AS DateTime), CAST(N'2021-03-17T13:48:44.427' AS DateTime), 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (3, N'Âu Mỹ', 1, 0, CAST(N'2021-03-18T09:46:35.997' AS DateTime), CAST(N'2021-03-18T09:46:35.997' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[National] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 

INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month]) VALUES (2, N'1 THÁNG', 45000.0000, N'Gói Miễn Phí', CAST(N'2021-03-19T08:52:36.903' AS DateTime), 1, 0, 450000, NULL, 1, 1)
INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month]) VALUES (4, N'1 NĂM', 490000.0000, NULL, NULL, 1, NULL, 490000, NULL, NULL, 12)
INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option], [package_month]) VALUES (5, N'2 NĂM', 899000.0000, NULL, NULL, 1, NULL, 900000, NULL, NULL, 24)
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([pay_id], [user_id], [pakage_id], [pay_datecreate], [pay_dateexpiration], [pay_summoney], [pay_active], [pay_status]) VALUES (3, 8, 5, CAST(N'2021-05-04T15:42:06.817' AS DateTime), NULL, 900000.0000, NULL, 1)
SET IDENTITY_INSERT [dbo].[Pays] OFF
GO
SET IDENTITY_INSERT [dbo].[Quest] ON 

INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (1, 10, CAST(N'2021-03-30T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), 1, NULL, NULL, 1, N'Người việt nghe nhạc Việt', 300, 250, 200, 100)
INSERT [dbo].[Quest] ([quest_id], [quest_limit], [quest_datecreate], [quest_dateend], [quest_active], [quest_category], [quest_national], [quest_singer], [quest_title], [quest_top1], [quest_top2], [quest_top3], [quest_gift]) VALUES (2, 10, CAST(N'2021-05-03T16:52:00.000' AS DateTime), CAST(N'2021-05-11T16:53:00.000' AS DateTime), 1, 4, NULL, 1, N'Nghe nhạc tuần', 200, 150, 100, 50)
SET IDENTITY_INSERT [dbo].[Quest] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestGroup] ON 

INSERT [dbo].[QuestGroup] ([qg_id], [quest_id], [user_id], [qg_datecreate], [qg_status], [qg_top], [qg_progress]) VALUES (1, 2, 2, CAST(N'2021-05-03T22:16:12.427' AS DateTime), 1, 1, 10)
SET IDENTITY_INSERT [dbo].[QuestGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Người Dùng')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Singers] ON 

INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (1, N'Erik', 1, 0, NULL, N'3c074b08-39a5-4e88-90be-dd7a4a753bf6erik.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Singers] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (1, N'thiet-ke-poster-su-kien-ca-nhac.jpg', N'Top 100 bài hát hay nhất ', NULL, NULL, 1)
INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (2, N'FPT_MH_Web_banner-5.png', N'Top nhạc Vũ Cát Tường', NULL, NULL, 1)
INSERT [dbo].[Sliders] ([slider_id], [slider_img], [slider_name], [slider_link], [slider_datecreate], [slider_active]) VALUES (3, N'mbfmusic-1013394.jpg', N'Top 100 bài hát hay nhất ', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (1, N'Vy', N'45eae50e-fd11-4570-b6ec-5571aebf02122021-03-21_22-27-25.png', N'Phuongvy99@gmail.com', N'Phuongvy', NULL, CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-17T12:10:24.580' AS DateTime), 1, 1, 0, N'Music_Admin', 1500, CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, N'0924404019', NULL, NULL, 0, CAST(N'2021-03-16T15:20:48.597' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (2, N'Tấn huỳnh', N'336a83ff-73bf-451e-9671-3cc9968fc53cerik.jpg', N'huynhminhtan4019@gmail.com', N'0924404019Aa@', N'3f277146-bac5-4af3-ac93-10c6d607912a', CAST(N'2021-03-28T13:31:19.083' AS DateTime), CAST(N'2021-03-28T13:31:19.083' AS DateTime), 1, 1, 0, N'#Music_Admin', 300, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (3, N'Tấn huỳnh a', N'5506db36-a1f0-48c5-a1ff-9298b5380ee2img_the_scream.jpg', N'laptring@gmail.com', N'0924404019', N'b3df0696-fc3b-4230-b297-3eda3f8604ca', CAST(N'2021-03-28T13:32:01.037' AS DateTime), CAST(N'2021-03-28T13:32:01.037' AS DateTime), 1, 1, 0, N'#Music_Admin', 0, NULL, NULL, N'0924404019', NULL, NULL, 0, CAST(N'2021-04-28T21:41:53.357' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (4, N'Phương Vy', N'336a83ff-73bf-451e-9671-3cc9968fc53cerik.jpg', N'jinnienguyen90@gmail.com', N'Phuongvy99**', N'5c0385b3-320d-4fc9-9005-2f72659b200c', CAST(N'2021-03-29T13:55:19.310' AS DateTime), CAST(N'2021-03-29T13:55:19.310' AS DateTime), 1, 1, 0, N'#Music_Admin', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-03-29T14:03:53.787' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (5, N'Trân Vương', N'336a83ff-73bf-451e-9671-3cc9968fc53cerik.jpg', N'vuongbaotran1905@gmail.com', N'Tranheo99@@', N'0d87cf82-fe73-4a0f-8c27-97ec18ab2239', CAST(N'2021-03-29T14:16:13.753' AS DateTime), CAST(N'2021-03-29T14:16:13.753' AS DateTime), 1, 1, 0, N'#Music_Admin', 200, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (6, N'Phương Vy', N'336a83ff-73bf-451e-9671-3cc9968fc53cerik.jpg', N'vy@gmail.com', N'Phuongvy99&&', N'ccd32928-7b11-4a7c-8209-daf685469e14', CAST(N'2021-03-29T14:21:23.007' AS DateTime), CAST(N'2021-03-29T14:21:23.007' AS DateTime), 1, 1, 0, N'vy@gmail.com4f8a12', 200, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip], [role_id]) VALUES (8, N'Nguyễn Trần Phương Vy', N'Userimg.png', N'phuongvy@gmail.com', N'Phuongvy99@@', N'3b7dad64-c23a-4a4f-bf27-311f0ccd1abe', CAST(N'2021-05-04T15:20:36.967' AS DateTime), CAST(N'2021-05-04T15:20:36.967' AS DateTime), 1, 1, 0, N'#phuon54e2f6', 200, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2023-05-04T15:42:06.800' AS DateTime), 1)
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
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Singers] FOREIGN KEY([singer_id])
REFERENCES [dbo].[Singers] ([singer_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Singers]
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
USE [master]
GO
ALTER DATABASE [MusicProjectData] SET  READ_WRITE 
GO
