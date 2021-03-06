USE [master]
GO
/****** Object:  Database [MusicProjectData]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Albums]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Authors]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Genres]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Musics]    Script Date: 03/27/2021 11:50:46 AM ******/
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
	[music_mp3] [nvarchar](max) NULL,
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[music_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[National]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Packages]    Script Date: 03/27/2021 11:50:46 AM ******/
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
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 03/27/2021 11:50:46 AM ******/
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
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[pay_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Quest]    Script Date: 03/27/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest](
	[quest_id] [int] IDENTITY(1,1) NOT NULL,
	[quest_name] [int] NULL,
	[quest_limit] [int] NULL,
	[quest_datecreate] [datetime] NULL,
	[quest_dateend] [datetime] NULL,
	[quest_active] [bit] NULL,
	[quest_category] [int] NULL,
	[quest_national] [int] NULL,
	[quest_singer] [int] NULL,
	[quest_gift] [nvarchar](max) NULL,
	[quest_top1] [nvarchar](max) NULL,
	[quest_top2] [nvarchar](max) NULL,
	[quest_top3] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[quest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestGroup]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Reply]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Singers]    Script Date: 03/27/2021 11:50:46 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 03/27/2021 11:50:46 AM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([album_id], [album_name], [album_datecreate], [album_dateedit], [album_view], [album_favorite], [album_active], [album_bin], [album_note], [album_img], [user_id]) VALUES (1, N'Tổng Hợp Nhạc Việt', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-17' AS Date), NULL, NULL, 1, 0, N'Tổng Hợp Các Bản Nhạc Hay Nhất Việt Nam', N'0029147d-7ee6-43db-bc7c-12e7304589dfAlbumViet.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (1, N'Vương Anh Tú', 1, 0, N'Là nhạc sĩ, nhà sản xuất trẻ và là người đứng sau một số hit của các ca sĩ như: Hồ Ngọc Hà, Đông Nhi, Thanh Hà, Ngô Kiến Huy, Hiền Hồ, Đức Phúc, Ông Cao Thắng, Erik, Dương Triệu Vũ, Hari Won, Minh Tuyết, Bùi Anh Tuấn, Noo Phước Thịnh, Miu Lê, Khổng Tú Quỳnh,… ca khúc đầu tiên Vương Anh Tú viết là vào năm lớp 5. Theo chia sẻ, “lúc nhỏ dù rất ngô nghê nhưng anh lại tập tành viết về tình yêu, bài hát ấy được ba mẹ lẫn anh trai góp ý”.
Năm 2013, ngay sau khi trình làng ca khúc “Giúp Anh Trả Lời Những Câu Hỏi”, Vương Anh Tú trở thành hiện tượng mạng trong thời điểm đó với hơn 10 triệu lượt nghe trên các nền tảng nhạc số và ngay lập tức có hit riêng cho mình. Năm 2015, Vương Anh Tú tiếp tục thành công với “Vợ Tuyệt Vời Nhất”, sáng tác cho Vũ Duy Khánh. MV của bài hát đạt hơn 97 triệu lượt nghe sau 12 tháng phát hành.
Các năm sau đó, Vương Anh Tú cũng gặt hái được nhiều thành công trong vai trò nhạc sĩ khi lần lượt các bản phối của “Anh Cứ Đi Đi” (Hari Won) và “Cuộc Sống Em Ổn Không” (Anh Tú) đều trở thành hiện tượng với lần lượt 13 triệu và 149 triệu lượt xem trên YouTube.
Vương Anh Tú là em trai của nhạc sĩ, ca sĩ, nhà sản xuất âm nhạc Vương Quốc Tuân (thường được biết đến với nghệ danh Mr. Siro). Từ nhỏ, hai anh em đã được cha mẹ cho đi học nhạc. Đây là tiền đề cho những sáng tác sau này của cả hai. Song song với việc hoạt động nghệ thuật, Vương Anh Tú cũng đã có thời gian dài tập trung kinh doanh. Nhưng sau đó, vì đam mê, anh đã quay trở lại và theo đuổi con đường sáng tác nhạc của mình.', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime), N'0c0e32f9-9419-425b-8719-09bfed7ad73fvuongAnhTu.jpg')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (2, N'Mr Siro', 1, 0, N'Vương Quốc Tuân, thường được biết đến với nghệ danh Mr. Siro, sinh ngày 14 tháng 11 năm 1981 tại Thành phố Hồ Chí Minh,[1] là một nhạc sĩ và ca sĩ người Việt Nam. Mr. Siro là một nghệ sĩ tài năng trong làng nhạc Việt khi anh có thể vừa thể hiện thành công những ca khúc của mình vừa sáng tác những tác phẩm thành công cho nhiều ca sĩ khác. Chưa hết, với những bản hit là những bản tình ca sâu lắng buồn được thể hiện với chất giọng vô cùng ấp áp và cảm xúc chạm đến tim đã khiến những tác phẩm của Mr. Siro chạm đến tận trái tim những người yêu âm nhạc. Cũng chính vì thế nam nhạc sĩ, ca sĩ Mr. Siro đã có được 1 fan hâm mộ (FC Mr. Siro hay còn gọi là SIROCON) vô cùng đông đảo.

Âm nhạc của Mr. Siro luôn nhẹ nhàng, sâu lắng nhưng lại da diết và mang đến cảm giác day dứt, ám ảnh rất sâu mỗi khi nghe nên rất để lại ấn tượng dai dẳng trong lòng khán giả yêu nhạc.

Nhiều người còn nói vui rằng tột cùng của sự đau khổ là khi bạn dính phải combo thất tình + nhạc của Mr. Siro, vì thế anh được người hâm mộ ưu ái đặt cho biệt danh là Thánh sầu', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime), N'Siro.jpg')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (3, N'Châu Đăng Khoa', 1, 0, N'Châu Đăng Khoa sinh ra ở Đắk Lắk nhưng anh chuyển vào Thành phố Hồ Chí Minh để học tập và làm việc. Châu Đăng Khoa là cựu sinh viên Trường Đại học Kinh tế Thành phố Hồ Chí Minh, đồng thời là sinh viên Nhạc viện Thành phố Hồ Chí Minh, khoa Thanh nhạc. Châu Đăng Khoa chia sẻ mong muốn của anh là được làm ca sĩ nhưng vì không đủ tiền để mua bài hát nên anh đã tập tành viết nhạc và hát những ca khúc của mình.

Bắt đầu bước chân vào con đường sáng tác vào năm 2012, Châu Đăng Khoa sớm trở thành một trong những cái tên nhạc sĩ trẻ được chú ý và sở hữu nhiều ca khúc được khán giả yêu thích. Những sáng tác của Châu Đăng Khoa cũng khá đa dạng về thể loại và luôn để lại ấn tượng tốt cho khán giả. Anh cũng là một trong những nhạc sĩ được Trung tâm Thúy Nga - Paris By Night thường xuyên đặt bài hát.

Vào tháng 10 năm 2017, công ty RBW - công ty chủ quản của nhóm Mamamoo đã ký hợp đồng sản xuất âm nhạc với nhạc sĩ Châu Đăng Khoa, anh sẽ đảm nhận vai trò sản xuất cho các sản phẩm âm nhạc của nhóm và các nghệ sĩ Hàn Quốc.

Vào tháng 1 năm 2018, ca khúc do anh sáng tác Người Lạ Ơi với phần trình diễn của Karik và Orange[1] trở thành hiện tượng trên các bảng xếp hạng âm nhạc và mạng xã hội.', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime), N'Khoa.jpg')
INSERT [dbo].[Authors] ([author_id], [author_name], [author_active], [author_bin], [author_note], [author_datecreate], [author_dateupdate], [author_img]) VALUES (4, N'Khắc Hưng', 1, 0, N'Khắc Hưng là em trai ca sĩ Khắc Việt. Anh là cựu sinh viên của Học viện Âm nhạc Quốc gia Việt Nam. Những sáng tác đầu tiên của Khắc Việt có sự phụ giúp của em trai trong phần phối khí. Hiện tại, Khắc Hưng đang là nhạc sĩ, nhà sản xuất trẻ có tiếng tại Việt Nam, anh chính là người đứng sau một số hit của các ca sĩ trẻ như Nguyễn Trần Trung Quân, Min, Erik, Đức Phúc, Trọng Hiếu, Miu Lê, nhóm nhạc Monstar,... Năm 2014, Khắc Hưng tham gia với vai trò là nhà sản xuất âm nhạc chính cho album phòng thu đầu tay của ca sĩ Nguyễn Trần Trung Quân. Khởi hành đã giúp Nguyễn Trần Trung Quân mang về 2 giải Cống hiến ở hạng mục "Album của năm" và "Nghệ sĩ mới của năm". Album là một cái tên hiếm hoi giữa các nghệ sĩ tên tuổi đã giành giải trước đó, được thực hiện từ những người trẻ tuổi và minh chứng cho việc anh có thể sản xuất ra những sản phẩm mang tính nghệ thuật. Năm 2016, Khắc Hưng cùng ca sĩ Nguyễn Trần Trung Quân và 2 nhạc sĩ, nhà sản xuất Đỗ Hiếu và Hoàng Touliver tham gia chương trình Khởi đầu ước mơ - Dream High và thí sinh Phạm Anh Duy của đội Khắc Hưng là Quán quân mùa đầu tiên.[1] Năm 2017, anh đạt Giải Cống hiến và sản xuất album Tâm 9. Năm 2018, anh là giám khảo cuộc thi Giọng hát Việt nhí. Nhiều bài hát của Khắc Hưng sáng tác bị cho là có tiêu đề phản cảm, gây hiểu lầm như "Như cái lò", "Như lời đồn".', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime), N'KhacHung.jpg')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (1, N'Nhạc Việt', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:17:09.917' AS DateTime), N'Viet.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (2, N'Nhạc Trữ Tình', 1, 0, N'Không có', 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:29:44.137' AS DateTime), N'TruTinh.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (3, N'Nhạc Trung', 1, 0, NULL, 1, NULL, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-15T16:16:57.823' AS DateTime), N'NhacHoa.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (4, N'Nhạc Trẻ', 1, 0, N'Không Có', 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-16T10:18:21.177' AS DateTime), N'NhacTre.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (5, N'Nhạc Hàn', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'Han.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (6, N'EDM', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'EDM.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (7, N'REMIX', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'REMIX.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (8, N'Hip-Hop', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'HipHop.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (9, N'Nhạc Phim', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'NhacPhim.jpg')
INSERT [dbo].[Categories] ([category_id], [category_name], [category_active], [category_bin], [category_note], [category_view], [user_id], [category_datecreate], [category_dateupdate], [category_img]) VALUES (10, N'Nhạc Thiếu Nhi', 1, 0, NULL, 1, NULL, CAST(N'2021-03-15T14:04:40.370' AS DateTime), CAST(N'2021-03-15T14:04:40.370' AS DateTime), N'ThieuNhi.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [music_mp3]) VALUES (1, N'Anh Luôn Là Lý Do', N'e067a540-efd8-402e-8858-ae7860189bdfanhluanlaly do.jpg', N'Chớ đến lúc mất đi mới thấy lo
Chợt nhớ đến những gì mình đã có
Không sao đâu, nắng mưa chuyện người ta
Chuyện gì cũng qua
Anh chẳng bao giờ nói suông
Anh sẽ luôn là lí do
Xua nhẹ đi mọi biến to
Cho bờ môi đó sẽ mãi tươi cười
Anh vẫn luôn là lí do
Che chở em khỏi bão to
Cho bờ môi đó sẽ mãi tươi cười
Mặt trời thường không trách đêm lâu, baby girl
Cưng yêu như phút ban đầu (uh-uh)
Gặp em đúng là tia sét ban ngày
Chẳng cần phải đoán xem ai đang say
Chẳng điều gì mới, vẫn là anh thôi
Trả nợ em không lãi suất cả cuộc đời
Chờ anh theo với, cùng đi muôn nơi
Phải dạy cho chính trái tim biết nghe lời
Và bởi vì...
Chớ đến lúc mất đi mới thấy lo
Chợt nhớ đến những gì mình đã có
Không sao đâu, nắng mưa chuyện người ta
Chuyện gì cũng qua
Anh chẳng bao giờ nói suông
Anh sẽ luôn…', N'3:52', 1, 0, 1, N'3b2afa10-fde6-4a26-8e56-090e62534c11Anh-Luon-La-Ly-Do-ERIK.mp3', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-18' AS Date), 1, 0, 1, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [music_mp3]) VALUES (2, N'Gặp Nhưng Không Ở Lại', N'e067a540-efd8-402e-8858-ae7860189bdfanhluanlaly do.jpg', N'Chớ đến lúc mất đi mới thấy lo
Chợt nhớ đến những gì mình đã có
Không sao đâu, nắng mưa chuyện người ta
Chuyện gì cũng qua
Anh chẳng bao giờ nói suông
Anh sẽ luôn là lí do
Xua nhẹ đi mọi biến to
Cho bờ môi đó sẽ mãi tươi cười
Anh vẫn luôn là lí do
Che chở em khỏi bão to
Cho bờ môi đó sẽ mãi tươi cười
Mặt trời thường không trách đêm lâu, baby girl
Cưng yêu như phút ban đầu (uh-uh)
Gặp em đúng là tia sét ban ngày
Chẳng cần phải đoán xem ai đang say
Chẳng điều gì mới, vẫn là anh thôi
Trả nợ em không lãi suất cả cuộc đời
Chờ anh theo với, cùng đi muôn nơi
Phải dạy cho chính trái tim biết nghe lời
Và bởi vì...
Chớ đến lúc mất đi mới thấy lo
Chợt nhớ đến những gì mình đã có
Không sao đâu, nắng mưa chuyện người ta
Chuyện gì cũng qua
Anh chẳng bao giờ nói suông
Anh sẽ luôn…', N'3:52', 1, 0, 1, N'3b2afa10-fde6-4a26-8e56-090e62534c11Anh-Luon-La-Ly-Do-ERIK.mp3', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-18' AS Date), 1, 0, 1, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[Musics] ([music_id], [music_name], [music_img], [music_lyric], [music_time], [music_view], [music_dowload], [user_id], [music_linkdow], [music_datecreate], [music_dateedit], [music_active], [music_bin], [music_option], [nation_id], [music_video], [genres_id], [author_id], [music_mp3]) VALUES (5, N'Gặp Nhưng Không Ở Lại', N'e067a540-efd8-402e-8858-ae7860189bdfanhluanlaly do.jpg', N'Chớ đến lúc mất đi mới thấy lo', N'3:52', 1, 0, 1, N'3b2afa10-fde6-4a26-8e56-090e62534c11Anh-Luon-La-Ly-Do-ERIK.mp3', CAST(N'2021-03-17' AS Date), CAST(N'2021-03-18' AS Date), 1, 0, 1, 2, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Musics] OFF
GO
SET IDENTITY_INSERT [dbo].[National] ON 

INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (2, N'Việt Nam', 1, 0, CAST(N'2021-03-17T13:48:44.427' AS DateTime), CAST(N'2021-03-17T13:48:44.427' AS DateTime), 1)
INSERT [dbo].[National] ([nation_id], [nation_name], [nation_active], [nation_bin], [nation_datecreate], [nation_dateupdate], [nation_option]) VALUES (3, N'Âu Mỹ', 1, 0, CAST(N'2021-03-18T09:46:35.997' AS DateTime), CAST(N'2021-03-18T09:46:35.997' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[National] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 

INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option]) VALUES (2, N'Miễn Phí', 0.0000, N'Gói Miễn Phí', CAST(N'2021-03-19T08:52:36.903' AS DateTime), 1, 0, 0, NULL, 1)
INSERT [dbo].[Packages] ([package_id], [package_name], [package_money], [package_content], [package_datecreate], [package_active], [package_bin], [pakage_price], [pakege_deadline], [package_option]) VALUES (3, N'Gói Bình Thường(1 Tháng)', 45000.0000, N'Gói Bình Thường', CAST(N'2021-03-19T09:13:09.297' AS DateTime), 1, 0, 45000, NULL, 1)
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
SET IDENTITY_INSERT [dbo].[Singers] ON 

INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (1, N'Erik', 1, 0, NULL, N'3c074b08-39a5-4e88-90be-dd7a4a753bf6erik.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (2, N'Hiền Hồ', 1, 0, NULL, N'HienHo.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (3, N'Mr.Siro', 1, 0, NULL, N'Siro.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (4, N'Hoà Minzy', 1, 0, NULL, N'HoaMinzy.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (5, N'Đức Phúc', 1, 0, NULL, N'DucPhuc.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (6, N'Sơn Tùng MT-P', 1, 0, NULL, N'MTP.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (7, N'Quân AP', 1, 0, NULL, N'QuanAP.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (8, N'Jack', 1, 0, NULL, N'Jack.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (9, N'Bùi Anh Tuấn', 1, 0, NULL, N'BuiAnhTuan.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
INSERT [dbo].[Singers] ([singer_id], [singer_name], [singer_active], [singer_bin], [singer_note], [singer_img], [singer_datecreate], [singer_dateupdate]) VALUES (10, N'Dương Hoàng Yến', 1, 0, NULL, N'DuongHoangYen.jpg', CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-16T15:20:48.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Singers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [user_img], [user_email], [user_pass], [user_token], [user_datecreate], [user_datelogin], [user_active], [user_option], [user_bin], [user_code], [user_point], [user_deadline], [user_birth], [user_phone], [user_note], [user_address], [user_vip], [user_datevip]) VALUES (1, N'Nguyễn ', N'336a83ff-73bf-451e-9671-3cc9968fc53cerik.jpg', N'Phuongvy99@gmail.com', N'Phuongvy', NULL, CAST(N'2021-03-16T15:20:48.597' AS DateTime), CAST(N'2021-03-17T12:10:24.580' AS DateTime), 1, 1, 0, N'Music_Admin', 1500, CAST(N'2021-03-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
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
USE [master]
GO
ALTER DATABASE [MusicProjectData] SET  READ_WRITE 
GO
