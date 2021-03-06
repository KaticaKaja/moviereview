USE [master]
GO
/****** Object:  Database [movie-review]    Script Date: 12/07/2020 08:11:50 ******/
CREATE DATABASE [movie-review]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'movie-review', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\movie-review.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'movie-review_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\movie-review_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [movie-review] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [movie-review].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [movie-review] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [movie-review] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [movie-review] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [movie-review] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [movie-review] SET ARITHABORT OFF 
GO
ALTER DATABASE [movie-review] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [movie-review] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [movie-review] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [movie-review] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [movie-review] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [movie-review] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [movie-review] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [movie-review] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [movie-review] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [movie-review] SET  ENABLE_BROKER 
GO
ALTER DATABASE [movie-review] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [movie-review] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [movie-review] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [movie-review] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [movie-review] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [movie-review] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [movie-review] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [movie-review] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [movie-review] SET  MULTI_USER 
GO
ALTER DATABASE [movie-review] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [movie-review] SET DB_CHAINING OFF 
GO
ALTER DATABASE [movie-review] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [movie-review] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [movie-review] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [movie-review] SET QUERY_STORE = OFF
GO
USE [movie-review]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/07/2020 08:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActorMovies]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorMovies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[CharacterName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActorMovies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](450) NOT NULL,
	[LastName] [nvarchar](450) NOT NULL,
	[ShortBio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[MovieId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_MovieGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Title] [nvarchar](450) NOT NULL,
	[Duration] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[MovieRating] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 12/07/2020 08:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629151449_initial', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630123416_test', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630201605_updated tables review, connecting tables', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200701110527_updated table movie', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200701200428_changed', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702105522_configurations', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702113702_moviegenre conf', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702114459_actor conf', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702114720_actor conf2', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702115204_actormovie conf', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200702163836_review conf update', N'3.1.5')
SET IDENTITY_INSERT [dbo].[ActorMovies] ON 

INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (1, CAST(N'2020-07-02T13:56:10.7669566' AS DateTime2), NULL, 0, NULL, 1, 31, 9, N'Sylvia Bosco')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (2, CAST(N'2020-07-02T13:56:10.7671015' AS DateTime2), NULL, 0, NULL, 1, 39, 6, N'Craig Runolfsdottir')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (3, CAST(N'2020-07-02T13:56:10.7671035' AS DateTime2), NULL, 0, NULL, 1, 32, 5, N'Gladys Torphy')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (4, CAST(N'2020-07-02T13:56:10.7671039' AS DateTime2), NULL, 0, NULL, 1, 34, 27, N'Mandy Lind')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (5, CAST(N'2020-07-02T13:56:10.7671043' AS DateTime2), NULL, 0, NULL, 1, 32, 14, N'Henrietta Hane')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (6, CAST(N'2020-07-02T13:56:10.7671047' AS DateTime2), NULL, 0, NULL, 1, 35, 5, N'Tony Terry')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (7, CAST(N'2020-07-02T13:56:10.7671051' AS DateTime2), NULL, 0, NULL, 1, 29, 11, N'Wanda Hettinger')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (8, CAST(N'2020-07-02T13:56:10.7671054' AS DateTime2), NULL, 0, NULL, 1, 39, 14, N'Jay Grimes')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (9, CAST(N'2020-07-02T13:56:10.7671058' AS DateTime2), NULL, 0, NULL, 1, 33, 20, N'Ginger Wunsch')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (10, CAST(N'2020-07-02T13:56:10.7671062' AS DateTime2), NULL, 0, NULL, 1, 43, 14, N'Bennie Mosciski')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (11, CAST(N'2020-07-02T13:56:21.4960089' AS DateTime2), NULL, 0, NULL, 1, 40, 8, N'Louis Mertz')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (12, CAST(N'2020-07-02T13:56:21.4961418' AS DateTime2), NULL, 0, NULL, 1, 31, 13, N'Nora Carroll')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (13, CAST(N'2020-07-02T13:56:21.4961437' AS DateTime2), NULL, 0, NULL, 1, 34, 2, N'Whitney Marks')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (14, CAST(N'2020-07-02T13:56:21.4961442' AS DateTime2), NULL, 0, NULL, 1, 30, 9, N'Traci Purdy')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (15, CAST(N'2020-07-02T13:56:21.4961446' AS DateTime2), NULL, 0, NULL, 1, 37, 5, N'Olivia Boyle')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (16, CAST(N'2020-07-02T13:56:21.4961451' AS DateTime2), NULL, 0, NULL, 1, 34, 8, N'Taylor O''Connell')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (17, CAST(N'2020-07-02T13:56:21.4961456' AS DateTime2), NULL, 0, NULL, 1, 40, 13, N'Brittany Cassin')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (18, CAST(N'2020-07-02T13:56:21.4961460' AS DateTime2), NULL, 0, NULL, 1, 36, 15, N'Pedro Rowe')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (19, CAST(N'2020-07-02T13:56:21.4961464' AS DateTime2), NULL, 0, NULL, 1, 39, 13, N'Edna Predovic')
INSERT [dbo].[ActorMovies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [ActorId], [MovieId], [CharacterName]) VALUES (20, CAST(N'2020-07-02T13:56:21.4961468' AS DateTime2), NULL, 0, NULL, 1, 26, 16, N'Casey Murazik')
SET IDENTITY_INSERT [dbo].[ActorMovies] OFF
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (25, CAST(N'2020-07-02T13:49:38.9916064' AS DateTime2), NULL, 0, NULL, 1, N'Ann', N'Champlin', N'Dolor totam excepturi sunt consequatur a nobis soluta sint est.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (26, CAST(N'2020-07-02T13:49:38.9917334' AS DateTime2), NULL, 0, NULL, 1, N'Edwin', N'Hills', N'Ipsa debitis sequi voluptates vitae esse quas aut consectetur ut.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (27, CAST(N'2020-07-02T13:49:38.9917352' AS DateTime2), NULL, 0, NULL, 1, N'Emanuel', N'Kunze', N'Qui quasi vitae blanditiis id ut quis minima iure et.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (28, CAST(N'2020-07-02T13:49:38.9917356' AS DateTime2), NULL, 0, NULL, 1, N'Harriet', N'Klocko', N'Molestiae ea ea fuga atque quidem incidunt totam molestias blanditiis.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (29, CAST(N'2020-07-02T13:49:38.9917360' AS DateTime2), NULL, 0, NULL, 1, N'Cesar', N'Shanahan', N'Doloribus reiciendis qui accusantium in facere nobis doloremque molestiae quos.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (30, CAST(N'2020-07-02T13:49:38.9917363' AS DateTime2), NULL, 0, NULL, 1, N'Seth', N'Ortiz', N'Error ad omnis incidunt dolores maxime iure doloremque id quibusdam.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (31, CAST(N'2020-07-02T13:49:38.9917367' AS DateTime2), NULL, 0, NULL, 1, N'Gladys', N'Treutel', N'Quisquam ea quia quasi aspernatur earum optio eos sit perferendis.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (32, CAST(N'2020-07-02T13:49:38.9917371' AS DateTime2), NULL, 0, NULL, 1, N'Inez', N'Hudson', N'Omnis rem id maiores sunt fuga animi soluta id numquam.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (33, CAST(N'2020-07-02T13:49:38.9917376' AS DateTime2), NULL, 0, NULL, 1, N'Stuart', N'Pfeffer', N'Aut voluptatem sequi sapiente sunt placeat molestias in nesciunt illum.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (34, CAST(N'2020-07-02T13:49:38.9917379' AS DateTime2), NULL, 0, NULL, 1, N'Blanca', N'Deckow', N'Quasi enim aut dolore assumenda nobis sequi error asperiores eligendi.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (35, CAST(N'2020-07-02T13:49:52.4693073' AS DateTime2), NULL, 0, NULL, 1, N'Jeannette', N'Bergnaum', N'Sequi cupiditate doloribus pariatur id rerum veniam repellendus et enim.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (36, CAST(N'2020-07-02T13:49:52.4694895' AS DateTime2), NULL, 0, NULL, 1, N'Grady', N'Schuppe', N'Maxime accusamus et rerum modi tempore et laboriosam ipsa ut.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (37, CAST(N'2020-07-02T13:49:52.4694913' AS DateTime2), NULL, 0, NULL, 1, N'Pearl', N'Auer', N'Repellendus non voluptatem ex est vero aut maxime deleniti beatae.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (38, CAST(N'2020-07-02T13:49:52.4694918' AS DateTime2), NULL, 0, NULL, 1, N'Stacy', N'Lebsack', N'Aspernatur est in vero temporibus enim autem quia molestiae voluptas.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (39, CAST(N'2020-07-02T13:49:52.4694922' AS DateTime2), NULL, 0, NULL, 1, N'Mark', N'Wyman', N'Dolor eligendi voluptates atque omnis odit et necessitatibus asperiores quibusdam.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (40, CAST(N'2020-07-02T13:49:52.4694927' AS DateTime2), NULL, 0, NULL, 1, N'Bertha', N'Lehner', N'Veniam consequuntur numquam ut cumque ipsam sit omnis quas libero.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (41, CAST(N'2020-07-02T13:49:52.4694931' AS DateTime2), NULL, 0, NULL, 1, N'Mario', N'Walker', N'Voluptate eius eum est minima commodi dolorum doloribus dolore minima.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (42, CAST(N'2020-07-02T13:49:52.4694936' AS DateTime2), NULL, 0, NULL, 1, N'Elizabeth', N'Johnston', N'Totam qui ex nemo omnis provident qui eum ad labore.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (43, CAST(N'2020-07-02T13:49:52.4694940' AS DateTime2), NULL, 0, NULL, 1, N'Charlie', N'Leuschke', N'Fugiat odit atque doloribus ducimus quisquam officia dolorum ad rerum.')
INSERT [dbo].[Actors] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [ShortBio]) VALUES (44, CAST(N'2020-07-02T13:49:52.4694945' AS DateTime2), NULL, 0, NULL, 1, N'Leslie', N'Von', N'Iusto ea ullam eos nihil omnis quisquam in ipsam est.')
SET IDENTITY_INSERT [dbo].[Actors] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (101, CAST(N'2020-07-01T22:17:04.4155633' AS DateTime2), NULL, 0, NULL, 1, N'action')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (102, CAST(N'2020-07-01T22:17:04.4157173' AS DateTime2), NULL, 0, NULL, 1, N'comedy')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (103, CAST(N'2020-07-01T22:17:04.4157191' AS DateTime2), NULL, 0, NULL, 1, N'drama')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (104, CAST(N'2020-07-01T22:17:04.4157194' AS DateTime2), NULL, 0, NULL, 1, N'thriller')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (105, CAST(N'2020-07-01T22:17:04.4157198' AS DateTime2), NULL, 0, NULL, 1, N'horror')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (106, CAST(N'2020-07-01T22:17:04.4157202' AS DateTime2), NULL, 0, NULL, 1, N'romance')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (107, CAST(N'2020-07-01T22:17:04.4157206' AS DateTime2), NULL, 0, NULL, 1, N'western')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (108, CAST(N'2020-07-01T22:17:04.4157209' AS DateTime2), NULL, 0, NULL, 1, N'fantasy')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (109, CAST(N'2020-07-01T22:17:04.4157214' AS DateTime2), NULL, 0, NULL, 1, N'mystery')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Name]) VALUES (110, CAST(N'2020-07-01T22:17:04.4157217' AS DateTime2), NULL, 0, NULL, 1, N'crime')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[MovieGenres] ON 

INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (31, CAST(N'2020-07-02T13:39:36.0640721' AS DateTime2), NULL, 0, NULL, 1, 26, 109)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (32, CAST(N'2020-07-02T13:39:36.0642054' AS DateTime2), NULL, 0, NULL, 1, 10, 102)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (33, CAST(N'2020-07-02T13:39:36.0642071' AS DateTime2), NULL, 0, NULL, 1, 30, 102)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (34, CAST(N'2020-07-02T13:39:36.0642077' AS DateTime2), NULL, 0, NULL, 1, 10, 109)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (35, CAST(N'2020-07-02T13:39:36.0642081' AS DateTime2), NULL, 0, NULL, 1, 10, 101)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (36, CAST(N'2020-07-02T13:39:36.0642085' AS DateTime2), NULL, 0, NULL, 1, 22, 106)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (37, CAST(N'2020-07-02T13:39:36.0642088' AS DateTime2), NULL, 0, NULL, 1, 16, 109)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (38, CAST(N'2020-07-02T13:39:36.0642092' AS DateTime2), NULL, 0, NULL, 1, 12, 109)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (39, CAST(N'2020-07-02T13:39:36.0642096' AS DateTime2), NULL, 0, NULL, 1, 2, 106)
INSERT [dbo].[MovieGenres] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [MovieId], [GenreId]) VALUES (40, CAST(N'2020-07-02T13:39:36.0642100' AS DateTime2), NULL, 0, NULL, 1, 20, 101)
SET IDENTITY_INSERT [dbo].[MovieGenres] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (1, CAST(N'2020-07-01T22:40:58.0969890' AS DateTime2), NULL, 0, NULL, 1, N'Toy Story', 45, 1888)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (2, CAST(N'2020-07-01T22:40:58.0971272' AS DateTime2), NULL, 0, NULL, 1, N'Gone With The Wind', 245, 1956)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (3, CAST(N'2020-07-01T22:40:58.0971268' AS DateTime2), NULL, 0, NULL, 1, N'4 Months, 3 Weeks and 2 Days', 167, 2000)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (4, CAST(N'2020-07-01T22:40:58.0971264' AS DateTime2), NULL, 0, NULL, 1, N'Dumbo', 34, 2010)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (5, CAST(N'2020-07-01T22:40:58.0971260' AS DateTime2), NULL, 0, NULL, 1, N'Bang the Drum Slowly', 93, 2020)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (6, CAST(N'2020-07-01T22:40:58.0971256' AS DateTime2), NULL, 0, NULL, 1, N'Portrait of a Lady on Fire', 94, 1999)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (7, CAST(N'2020-07-01T22:40:58.0971252' AS DateTime2), NULL, 0, NULL, 1, N'Kill Bill', 156, 2014)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (8, CAST(N'2020-07-01T22:40:58.0971249' AS DateTime2), NULL, 0, NULL, 1, N'Beauty and the Beast', 98, 1934)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (9, CAST(N'2020-07-01T22:40:58.0971245' AS DateTime2), NULL, 0, NULL, 1, N'Good Will Hunting', 134, 1956)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (10, CAST(N'2020-07-01T22:40:58.0971241' AS DateTime2), NULL, 0, NULL, 1, N'Spirited Away', 78, 2011)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (11, CAST(N'2020-07-01T22:40:58.0971237' AS DateTime2), NULL, 0, NULL, 1, N'American Graffiti', 76, 2000)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (12, CAST(N'2020-07-01T22:40:58.0971233' AS DateTime2), NULL, 0, NULL, 1, N'A Streetcar Named Desire', 54, 2011)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (13, CAST(N'2020-07-01T22:40:58.0971229' AS DateTime2), NULL, 0, NULL, 1, N'Psycho', 45, 1934)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (14, CAST(N'2020-07-01T22:40:58.0971225' AS DateTime2), NULL, 0, NULL, 1, N'Roma', 156, 1956)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (15, CAST(N'2020-07-01T22:40:58.0971221' AS DateTime2), NULL, 0, NULL, 1, N'Shawshank Redemption', 78, 2011)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (16, CAST(N'2020-07-01T22:40:58.0971217' AS DateTime2), NULL, 0, NULL, 1, N'Ratatouille', 146, 2010)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (17, CAST(N'2020-07-01T22:40:58.0971214' AS DateTime2), NULL, 0, NULL, 1, N'Nashville', 78, 1900)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (18, CAST(N'2020-07-01T22:40:58.0971209' AS DateTime2), NULL, 0, NULL, 1, N'Fantasia', 4, 1994)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (19, CAST(N'2020-07-01T22:40:58.0971206' AS DateTime2), NULL, 0, NULL, 1, N'Parasite', 134, 2000)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (20, CAST(N'2020-07-01T22:40:58.0971202' AS DateTime2), NULL, 0, NULL, 1, N'Gravity', 123, 1996)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (21, CAST(N'2020-07-01T22:40:58.0971198' AS DateTime2), NULL, 0, NULL, 1, N'12 Years a Slave', 90, 2010)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (22, CAST(N'2020-07-01T22:40:58.0971194' AS DateTime2), NULL, 0, NULL, 1, N'Mean Streets', 89, 1984)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (23, CAST(N'2020-07-01T22:40:58.0971191' AS DateTime2), NULL, 0, NULL, 1, N'Bring Me the Head of Alfredo Garcia', 90, 1945)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (24, CAST(N'2020-07-01T22:40:58.0971187' AS DateTime2), NULL, 0, NULL, 1, N'The Maltese Falcon', 93, 2000)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (25, CAST(N'2020-07-01T22:40:58.0971184' AS DateTime2), NULL, 0, NULL, 1, N'Rosemary''s Baby', 89, 1956)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (26, CAST(N'2020-07-01T22:40:58.0971179' AS DateTime2), NULL, 0, NULL, 1, N'Manchester by the Sea', 120, 1999)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (27, CAST(N'2020-07-01T22:40:58.0971175' AS DateTime2), NULL, 0, NULL, 1, N'12 Angry Men', 56, 2018)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (28, CAST(N'2020-07-01T22:40:58.0971156' AS DateTime2), NULL, 0, NULL, 1, N'The Grapes of Wrath', 123, 2010)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (29, CAST(N'2020-07-01T22:40:58.0971276' AS DateTime2), NULL, 0, NULL, 1, N'Ran', 13, 2017)
INSERT [dbo].[Movies] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Title], [Duration], [Year]) VALUES (30, CAST(N'2020-07-01T22:40:58.0971280' AS DateTime2), NULL, 0, NULL, 1, N'Killer of Sheep', 45, 2011)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (1, CAST(N'2020-07-02T13:16:30.7882707' AS DateTime2), NULL, 0, NULL, 1, 27, 1, 2, N'Vero eveniet aliquam facere voluptate totam qui velit.
Impedit id ad non debitis dolorem.
Quis aut ut quia quia nihil.
Voluptas quia nam.
Sit dolorem nulla nemo hic minima ut vel dolores.
Omnis tempore praesentium commodi laboriosam est.
Earum asperiores debitis qui.
Eveniet debitis eveniet voluptas consectetur.
Sequi dolorem corrupti perspiciatis quod et.
Aperiam deserunt in repellendus repellat fuga et.', N'Sit ad dolore nihil architecto enim.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (2, CAST(N'2020-07-02T13:16:30.7884155' AS DateTime2), NULL, 0, NULL, 1, 49, 29, 2, N'Vel tempora non dolores dolor.
Est tempora dicta.
Incidunt consectetur omnis tempore nisi nihil nostrum.
Quo nihil tempore dolorem cupiditate qui nisi qui eos ab.
Earum eum qui et voluptatem animi.
Reiciendis voluptas nobis nihil corporis sed et quos dolorem.
Veritatis ut totam cumque voluptatem hic pariatur illum.
Est nihil iure autem ex officiis tempore eum.
Dolorem velit voluptas fuga.
Officia dignissimos delectus.', N'Vel quia iste et natus cupiditate.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (3, CAST(N'2020-07-02T13:16:30.7884151' AS DateTime2), NULL, 0, NULL, 1, 25, 4, 1, N'Sunt consequatur eveniet.
Facilis quibusdam aut repellendus labore.
Optio vel dolorum sunt dolorem at libero quos vitae.
Qui illo enim.
Asperiores aliquam sit natus quibusdam qui reprehenderit quo.
Deserunt maxime qui.
Laborum culpa et dicta voluptas non facere omnis et.
Sit placeat sunt sed aliquam distinctio beatae et.
Dolores magnam vel iure laudantium velit maiores.
Praesentium eos quisquam doloremque nisi qui quae.', N'Sint nihil accusamus placeat maxime odit.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (4, CAST(N'2020-07-02T13:16:30.7884147' AS DateTime2), NULL, 0, NULL, 1, 13, 19, 3, N'Deleniti enim molestias sed perferendis mollitia facere.
In molestias voluptatum reiciendis cupiditate.
Et amet voluptatem quibusdam est sit.
Aliquam incidunt qui consequatur voluptas doloribus minima.
Eius ea natus.
Expedita porro quia vitae aliquam modi sint.
Labore laborum iusto.
Modi animi eos culpa velit animi.
Reprehenderit cumque maiores tempora eaque.
Aut ipsum id.', N'Dignissimos iure eos aut sed quisquam.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (5, CAST(N'2020-07-02T13:16:30.7884143' AS DateTime2), NULL, 0, NULL, 1, 14, 22, 5, N'Ut quis ratione molestias.
Officiis eos molestiae similique in nam aperiam necessitatibus.
Quia voluptas quas est modi nihil aliquid nesciunt nulla ut.
Qui et ut.
Dolorem dolores ratione ea laborum nihil molestiae ducimus.
Voluptatem voluptatibus consectetur voluptatum distinctio expedita accusantium voluptatem magnam omnis.
Quaerat dolor harum aperiam labore saepe aut dignissimos.
Ea sed ut deserunt.
In vitae sint cum ad magnam velit reprehenderit.
Quis labore excepturi officiis dolores amet rerum.', N'Temporibus aspernatur quis quia aliquam earum.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (6, CAST(N'2020-07-02T13:16:30.7884139' AS DateTime2), NULL, 0, NULL, 1, 11, 17, 4, N'Quidem impedit velit illum rem quis.
Suscipit libero aut minus.
Ut fuga culpa in modi numquam commodi aut dolores magnam.
Facere cupiditate aut expedita consequuntur provident numquam maiores.
Cumque dolores et consequatur aut.
Et molestias et incidunt voluptatem qui et suscipit quod.
Suscipit et non nam beatae possimus magnam iure vitae distinctio.
Deserunt harum inventore et qui.
Ea ullam at ut non deserunt nihil aut vero.
Ut tempora ut.', N'Sint fugiat sequi aut odio qui.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (7, CAST(N'2020-07-02T13:16:30.7884135' AS DateTime2), NULL, 0, NULL, 1, 29, 13, 4, N'Dolorum vel commodi soluta autem incidunt sapiente eos.
Sit nostrum dolorem quis voluptas voluptatem est.
Nemo omnis voluptatem praesentium in ducimus asperiores vel id.
Vitae in ut delectus tempore ducimus quos modi cumque.
Tempore molestias molestiae.
Voluptates distinctio et voluptas.
Neque architecto optio itaque eum omnis vero aut sed ipsa.
Consequatur et est molestiae aut.
Beatae eius et porro quibusdam.
Error est velit.', N'Sapiente nam cumque eos dolorum nostrum.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (8, CAST(N'2020-07-02T13:16:30.7884130' AS DateTime2), NULL, 0, NULL, 1, 31, 15, 1, N'Repellat inventore quo.
Itaque dolor omnis doloremque dolorem rerum sit sed ipsa voluptatem.
Necessitatibus rerum ipsam aspernatur adipisci debitis qui.
Quo alias necessitatibus in minus temporibus molestiae inventore eaque.
Saepe voluptatum inventore quos deserunt molestiae odio consequatur aut.
Perferendis culpa ut odio ipsum est consequuntur modi adipisci.
Molestias incidunt vero dolore consequuntur repudiandae.
Quia ipsa labore.
Eum nostrum id voluptatem.
Excepturi in aliquid rerum distinctio consectetur est minima et.', N'Nisi perferendis dolorem molestias occaecati nihil.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (9, CAST(N'2020-07-02T13:16:30.7884127' AS DateTime2), NULL, 0, NULL, 1, 23, 11, 5, N'Saepe ex aut eaque porro omnis qui sit fugit facilis.
Temporibus et cum quasi quidem delectus quis aliquid quibusdam atque.
Quis accusantium incidunt fuga consectetur quo soluta.
Ipsum assumenda praesentium.
Nemo pariatur at fugiat quaerat.
Rerum ipsa ipsa quibusdam nobis eius.
Soluta voluptatem reiciendis consequatur ipsum quo.
Dignissimos consequatur et beatae aut explicabo similique.
Quas repellat voluptatum sed voluptas molestias consequatur.
Dolor magni accusantium eveniet.', N'Reprehenderit laborum aut blanditiis veritatis quam.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (10, CAST(N'2020-07-02T13:16:30.7884122' AS DateTime2), NULL, 0, NULL, 1, 11, 30, 3, N'Saepe dolores saepe nisi laudantium autem repudiandae est quis.
Voluptatem harum cupiditate et cumque ea porro nostrum.
Rem ut nam sed aut porro et dolores.
Sunt dicta nihil minima distinctio enim fuga voluptatum.
Enim quisquam tempore voluptatem.
Ad deserunt fugiat quaerat similique beatae nihil soluta minus animi.
Rerum omnis incidunt nostrum.
Fuga fugiat aut.
Sed sed a accusamus aut.
Veniam modi sequi dignissimos.', N'Voluptate eaque ducimus necessitatibus et esse.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (11, CAST(N'2020-07-02T13:16:30.7884118' AS DateTime2), NULL, 0, NULL, 1, 37, 8, 5, N'Quia eius molestiae necessitatibus fugit odit nemo a at doloremque.
Rerum et dolor sunt consequatur voluptates sit eaque eum.
Suscipit est impedit velit beatae quos omnis.
Et tenetur tempore quia tenetur.
A sit vero tenetur iure qui magnam aliquid.
Dolorum nihil tempore blanditiis sit rem qui sed.
Tempora blanditiis temporibus laborum quisquam deleniti eaque laborum provident deserunt.
Beatae explicabo occaecati ut.
Et sit ab.
Et natus magnam.', N'Et voluptas quidem omnis et est.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (12, CAST(N'2020-07-02T13:16:30.7884113' AS DateTime2), NULL, 0, NULL, 1, 4, 13, 2, N'At et vitae aut et nulla et odit iste suscipit.
Qui ratione quae.
Officia rem maxime dolores fugit vero voluptas sed consequatur.
Minima placeat et et dolorem.
Qui exercitationem rerum qui sed tempore distinctio similique.
Commodi temporibus quo doloribus nesciunt qui sed.
Consequatur quo deserunt placeat reiciendis.
Dicta non excepturi quo sed ut explicabo voluptatum.
Qui soluta sed quis molestias mollitia qui repudiandae.
Dolor laborum placeat quasi quos consequuntur quia sed quod.', N'Eius nihil veritatis dolores fugit est.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (13, CAST(N'2020-07-02T13:16:30.7884109' AS DateTime2), NULL, 0, NULL, 1, 44, 27, 1, N'Molestiae laudantium dolorum delectus qui omnis.
Minima aut qui iure.
Temporibus quis eum at quo consequatur.
Vel esse voluptas vel.
Beatae iusto et neque optio in architecto harum tenetur.
Consequatur iste a dignissimos atque a et.
Ex mollitia nisi sit earum quas iure facere.
Dignissimos omnis quasi sapiente neque est at necessitatibus.
Recusandae quasi qui nemo.
Possimus perspiciatis adipisci consequatur enim saepe reprehenderit voluptas.', N'Eius id iste aliquam eligendi ducimus.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (14, CAST(N'2020-07-02T13:16:30.7884105' AS DateTime2), NULL, 0, NULL, 1, 45, 1, 4, N'Laboriosam itaque laudantium cum fugit assumenda.
Quisquam cumque ut qui natus dolores officia magnam similique.
Esse atque dolor quasi eaque aut.
Ut quo et non.
Sed natus facere quae laborum culpa perferendis ratione.
Ut possimus corporis at iusto magnam aut expedita.
Nihil alias ut et deserunt.
Quos vel ullam magni.
Voluptas ea ut recusandae voluptatem.
Velit quasi excepturi rerum aut ut quam.', N'Magnam et hic aut et tempore.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (15, CAST(N'2020-07-02T13:16:30.7884101' AS DateTime2), NULL, 0, NULL, 1, 50, 1, 4, N'Est odit non autem et omnis molestiae dolores.
Occaecati blanditiis reiciendis temporibus ducimus.
Sit sunt sint delectus ullam et officia culpa.
Eius assumenda ut.
Veniam iste molestias sed.
Voluptas iusto aut ut.
Quia accusantium quo error rem consequatur sit et.
Sunt ea quisquam.
Et hic est.
Sit non dolorem sunt dolores eius.', N'Et quod voluptatem iusto sint voluptates.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (16, CAST(N'2020-07-02T13:16:30.7884097' AS DateTime2), NULL, 0, NULL, 1, 51, 2, 4, N'Dolores laboriosam eum.
Repellendus et esse accusantium dolores ducimus et laborum aut voluptatibus.
Consequatur autem quia ut consequuntur molestias nulla.
Cum doloremque libero reiciendis itaque.
Sit saepe corrupti provident quia numquam occaecati voluptatem laudantium sunt.
Ut quos dolor.
Cupiditate mollitia facere et corporis autem voluptates.
Optio et natus quis voluptatem nihil earum sed.
Voluptatum ipsa sed.
Iusto beatae temporibus voluptas veritatis temporibus sit.', N'Rerum amet cumque necessitatibus ut facere.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (17, CAST(N'2020-07-02T13:16:30.7884094' AS DateTime2), NULL, 0, NULL, 1, 43, 17, 3, N'Id maiores sunt maiores quia.
Dolore aut est maxime non animi numquam nisi et in.
Sunt est ut dolorum.
Atque et perspiciatis voluptates est soluta numquam sint porro.
Aliquam explicabo aut consequatur autem voluptas ea non blanditiis.
Iste explicabo saepe nobis molestias non quia dicta labore velit.
Incidunt facilis eveniet et sit dignissimos numquam tempora error.
Aut accusantium omnis nisi quia labore sed voluptatem.
Ipsum porro dolor quisquam veniam reprehenderit ut eos ea.
Ea consequuntur soluta sint sint accusantium.', N'Incidunt corrupti iure est et totam.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (18, CAST(N'2020-07-02T13:16:30.7884090' AS DateTime2), NULL, 0, NULL, 1, 26, 27, 3, N'Tempora consequuntur doloremque nihil expedita.
Quia veniam necessitatibus vero.
Enim architecto modi id ullam.
Corrupti voluptas at officiis a ea tempore eos.
Et consequatur possimus vitae nesciunt.
Doloremque ut et quia in sit quaerat.
Laudantium aspernatur blanditiis itaque ea.
Voluptatem libero dolorem.
Sed voluptates nihil nemo quos enim quisquam ea.
Aliquid hic enim cupiditate consequatur cumque repellendus minima quo.', N'Molestiae non earum in perspiciatis neque.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (19, CAST(N'2020-07-02T13:16:30.7884086' AS DateTime2), NULL, 0, NULL, 1, 20, 12, 4, N'Quisquam occaecati mollitia ea veritatis.
Incidunt error est vitae necessitatibus voluptatem debitis hic aliquid.
Non minima itaque et ratione.
Fugiat similique et non animi fuga.
Quia voluptatum repellat aliquid sit commodi ut.
Esse quas quas cum aliquam ab ut et ea iure.
Quaerat nemo velit ducimus exercitationem eligendi.
Labore est accusantium iste.
Consectetur id doloremque ducimus.
Necessitatibus repudiandae perspiciatis officia eum ut quibusdam.', N'Laborum sunt velit est ut omnis.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (20, CAST(N'2020-07-02T13:16:30.7884082' AS DateTime2), NULL, 0, NULL, 1, 28, 21, 3, N'Eum consectetur mollitia.
Dicta quis atque sit ad quidem ipsa possimus molestiae.
Ut in sunt totam minus dolore.
Laboriosam cum dolorem.
Temporibus laudantium libero molestias quis.
Autem dolores eaque.
Omnis maiores nulla ut aut sapiente corporis qui vitae.
Adipisci asperiores ut odit id sed.
Aut et dicta quos.
Est error ullam et illum qui maiores.', N'Qui dolores omnis cumque nulla et.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (21, CAST(N'2020-07-02T13:16:30.7884077' AS DateTime2), NULL, 0, NULL, 1, 56, 27, 3, N'Omnis sint cumque fuga accusamus illo id et quia est.
Repellat illum voluptas.
Sit quos molestiae.
Voluptas voluptatem officia non aperiam ullam cupiditate.
Aut laboriosam blanditiis voluptatem sed sunt consequuntur.
Voluptatibus labore autem beatae optio.
Iusto qui sit non numquam sequi quia facilis.
Qui modi ea.
Tempore delectus qui libero.
Nisi ducimus harum explicabo porro.', N'Omnis vitae ipsam ratione et voluptates.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (22, CAST(N'2020-07-02T13:16:30.7884072' AS DateTime2), NULL, 0, NULL, 1, 28, 9, 2, N'Corporis animi porro cupiditate veniam.
Eligendi pariatur occaecati autem eaque modi.
Incidunt itaque quasi.
Unde aut dolores commodi unde laboriosam at hic.
Odit deleniti aut harum.
A voluptates accusamus enim accusantium magni nesciunt.
Enim excepturi dolores.
Minus quam est voluptate eaque atque.
Et dolores earum.
Rerum facere voluptatem et sunt aut.', N'Quam dolores culpa quae tenetur omnis.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (23, CAST(N'2020-07-02T13:16:30.7884069' AS DateTime2), NULL, 0, NULL, 1, 11, 6, 3, N'Dolores necessitatibus quasi sit.
Sunt aliquid sed voluptatum soluta debitis sequi.
Laudantium quibusdam non quod.
Ea soluta fuga sed.
Illo aut repudiandae distinctio saepe sit et ab accusantium rem.
Voluptas deserunt et qui aperiam rerum nobis velit nulla similique.
Qui accusamus impedit nisi impedit error ducimus enim hic est.
Ut perferendis non distinctio voluptates praesentium.
Laborum et pariatur nobis.
Optio quia ut perferendis odit.', N'Qui et corporis officia quo et.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (24, CAST(N'2020-07-02T13:16:30.7884065' AS DateTime2), NULL, 0, NULL, 1, 20, 11, 4, N'Qui eum adipisci id vero fuga.
Et nihil perspiciatis ut.
Esse vel esse saepe nihil quasi a.
Quidem ut quaerat recusandae quia.
Quo similique ea iure qui facilis ipsam dolorum quaerat suscipit.
Minima voluptatem et facere et porro accusantium odio.
At non asperiores fugiat.
Earum dolorem quidem.
Aut quia quaerat deleniti itaque repudiandae laborum sint.
In quia dolore.', N'Voluptate est blanditiis perferendis consequuntur voluptatibus.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (25, CAST(N'2020-07-02T13:16:30.7884061' AS DateTime2), NULL, 0, NULL, 1, 32, 18, 3, N'Iste vero est molestiae.
Voluptate illo a explicabo saepe voluptate.
Voluptatem distinctio nobis eos ut.
Omnis sunt commodi quaerat vero earum non.
Cupiditate ab cum nesciunt ab ut cumque.
Eos esse occaecati magni aut nemo beatae ut.
Deleniti corrupti dolorem ut sint.
Illo reiciendis magni voluptas.
Assumenda ullam repellat impedit.
Repudiandae rerum consequatur minima recusandae nulla qui similique.', N'Officiis repudiandae sint distinctio id dolore.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (26, CAST(N'2020-07-02T13:16:30.7884057' AS DateTime2), NULL, 0, NULL, 1, 4, 10, 5, N'Numquam perferendis laborum iste possimus facere sed autem neque.
Quam error animi commodi distinctio nostrum placeat modi fugit maxime.
Voluptatibus dolor nemo occaecati.
Eum rerum fugit qui vitae rem est sit.
Corrupti incidunt corrupti.
Reiciendis unde assumenda id minima numquam accusantium.
A doloremque animi.
Voluptatum tempora iste et ut quo corporis eaque aut.
Deserunt cum impedit officiis rerum officiis esse enim ipsum inventore.
Quo dolores adipisci quis autem.', N'Est necessitatibus ut optio laboriosam ullam.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (27, CAST(N'2020-07-02T13:16:30.7884052' AS DateTime2), NULL, 0, NULL, 1, 10, 21, 4, N'Sit sapiente repellat.
Nihil enim non.
Quo ut quidem aliquam ea et.
Et eos incidunt doloribus at accusantium suscipit sit amet magni.
Sapiente nihil iste nam dicta ut.
Quibusdam sequi minus incidunt.
Omnis libero neque eos quibusdam atque nulla.
Cumque placeat voluptate earum odit sit voluptatem harum consequatur.
Omnis vel doloribus tenetur nemo quas nulla quae voluptatem minus.
Natus assumenda incidunt.', N'Quis consequatur dolore natus eos corrupti.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (28, CAST(N'2020-07-02T13:16:30.7884034' AS DateTime2), NULL, 0, NULL, 1, 48, 5, 3, N'Repellendus quo dolorem ut.
Voluptate aut dicta et distinctio tempore eveniet consequatur non nulla.
Corporis magni dolorem nesciunt repellat aliquam beatae doloremque et.
Voluptas et et.
Quia reiciendis nam suscipit tenetur et est.
Fuga asperiores cum voluptates consectetur voluptate expedita aspernatur vel.
Non rerum error nulla.
Nam numquam provident.
Quibusdam commodi repudiandae facilis ipsa expedita fugiat atque.
Incidunt tempore aut earum sunt ut molestias fugiat.', N'Est omnis accusamus reiciendis nulla dolorem.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (29, CAST(N'2020-07-02T13:16:30.7884159' AS DateTime2), NULL, 0, NULL, 1, 27, 17, 4, N'Optio cum iusto ut quae molestias tenetur.
Deserunt provident voluptas.
Et quis ex voluptas velit reprehenderit odio velit debitis.
Ullam quo voluptas quam sunt.
Cum et ipsum animi alias sunt magni totam qui odio.
Sed sed ut pariatur iusto.
Dolor assumenda voluptatem enim nihil et incidunt voluptatem tempore nihil.
Vel est magni et quam ut.
Cupiditate ea est eum ut nesciunt.
Mollitia ut fugit voluptatem beatae laboriosam voluptate eos et nam.', N'Nam doloremque voluptatem fuga possimus officiis.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (30, CAST(N'2020-07-02T13:16:30.7884164' AS DateTime2), NULL, 0, NULL, 1, 41, 30, 4, N'Consequatur enim et.
Ratione neque quia architecto amet aliquid incidunt odit.
Odit recusandae sed repellat mollitia commodi.
Sint et totam.
Mollitia ullam ea commodi quam odio et voluptatem laudantium quibusdam.
Distinctio praesentium fuga recusandae quia dicta temporibus.
Enim esse porro dolore et incidunt qui.
Minus voluptatem distinctio sunt dicta.
Libero aut nulla omnis sapiente et maxime pariatur beatae.
Et occaecati enim expedita quis distinctio amet rerum.', N'Neque earum veniam voluptas iure eligendi.')
INSERT [dbo].[Reviews] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [UserId], [MovieId], [MovieRating], [Text], [Title]) VALUES (36, CAST(N'2020-07-02T18:46:28.1179961' AS DateTime2), NULL, 0, NULL, 1, 4, 1, 3, N'neki text', N'neki title')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (4, CAST(N'2020-06-30T19:02:28.6773267' AS DateTime2), NULL, 0, NULL, 1, N'Zika', N'Zikic', N'zika', N'MTIzNDU2Nzhhc3NkZ0AjJSRkZg==', N'zika@outlook.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (7, CAST(N'2020-05-03T12:00:00.0000000' AS DateTime2), NULL, 0, NULL, 1, N'Admin', N'Admin', N'admin', N'MTIzNDU2Nzhhc3NkZ0AjJSRkZg==', N'admin@admin.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (8, CAST(N'2020-06-30T22:05:45.0074286' AS DateTime2), NULL, 0, NULL, 1, N'Carley', N'Klein', N'Amparo_Collier75', N'lYrgvwbd5M', N'Eugenia_Hermann63@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (9, CAST(N'2020-06-30T22:05:45.0075732' AS DateTime2), NULL, 0, NULL, 1, N'Brice', N'D''Amore', N'Fritz.Hauck', N'b8fxza5hwl', N'Jerod_Franecki@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (10, CAST(N'2020-06-30T22:05:45.0075735' AS DateTime2), NULL, 0, NULL, 1, N'Kennedy', N'Reynolds', N'Kyle_Schroeder24', N'85gvcLq2M1', N'Verda.Kessler47@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (11, CAST(N'2020-06-30T22:05:45.0075739' AS DateTime2), NULL, 0, NULL, 1, N'Evan', N'Bailey', N'Markus_Batz', N'_NVN4UKMqJ', N'Myron40@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (12, CAST(N'2020-06-30T22:05:45.0075743' AS DateTime2), NULL, 0, NULL, 1, N'Estrella', N'Hintz', N'Deondre.Jaskolski93', N'PnYSABKlj5', N'Jayme.Moen@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (13, CAST(N'2020-06-30T22:05:45.0075747' AS DateTime2), NULL, 0, NULL, 1, N'Jeramy', N'Sporer', N'Savion_Schaefer15', N'JrlS8xF7HW', N'Ferne92@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (14, CAST(N'2020-06-30T22:05:45.0075750' AS DateTime2), NULL, 0, NULL, 1, N'Darrion', N'Gislason', N'Irving_Connelly34', N'LC_m8r0ICa', N'Bertrand_Sauer@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (15, CAST(N'2020-06-30T22:05:45.0075754' AS DateTime2), NULL, 0, NULL, 1, N'Carol', N'Gibson', N'Juana.Batz', N'Qtm44W8mkU', N'Heaven95@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (16, CAST(N'2020-06-30T22:05:45.0075759' AS DateTime2), NULL, 0, NULL, 1, N'Laron', N'Zemlak', N'Keegan50', N'girBhRPpjt', N'Broderick.Graham92@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (17, CAST(N'2020-06-30T22:05:45.0075762' AS DateTime2), NULL, 0, NULL, 1, N'Rosendo', N'Durgan', N'Fernando.Bauch72', N'pJgRknDLdN', N'Letitia86@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (18, CAST(N'2020-06-30T22:05:45.0075767' AS DateTime2), NULL, 0, NULL, 1, N'Edison', N'Rath', N'Claire_Mills97', N'IJJ4ZOwMrK', N'Elise38@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (19, CAST(N'2020-06-30T22:05:45.0075771' AS DateTime2), NULL, 0, NULL, 1, N'Ashtyn', N'Ondricka', N'Aileen.Schuster40', N'1rfjtAoa0q', N'Ima_Runolfsson@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (20, CAST(N'2020-06-30T22:05:45.0075775' AS DateTime2), CAST(N'2020-07-01T11:18:44.0302566' AS DateTime2), 1, NULL, 1, N'Kiara', N'Schowalter', N'Dan14', N'jc8fwCmfno', N'Kristofer47@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (21, CAST(N'2020-06-30T22:05:45.0075780' AS DateTime2), NULL, 0, NULL, 1, N'Cyrus', N'Walter', N'Dixie60', N'0XwSvQgjoG', N'Isom_OReilly@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (22, CAST(N'2020-06-30T22:05:45.0075784' AS DateTime2), NULL, 0, NULL, 1, N'Jerald', N'Wilkinson', N'Roberto.Gottlieb95', N'bN7ZP4F_Bd', N'Nickolas.Kirlin@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (23, CAST(N'2020-06-30T22:05:45.0075788' AS DateTime2), NULL, 0, NULL, 1, N'Christ', N'Hagenes', N'Drake48', N'n21TFQM3hc', N'Luisa49@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (24, CAST(N'2020-06-30T22:05:45.0075792' AS DateTime2), NULL, 0, NULL, 1, N'Ibrahim', N'Shields', N'Lauriane_Bruen83', N'yHlGGVq8o6', N'Shane.Mayert59@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (25, CAST(N'2020-06-30T22:05:45.0075796' AS DateTime2), NULL, 0, NULL, 1, N'Weldon', N'Goldner', N'Johnny20', N'dF3_nTb9Ze', N'Immanuel89@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (26, CAST(N'2020-06-30T22:05:45.0075801' AS DateTime2), NULL, 0, NULL, 1, N'Lewis', N'Murphy', N'Kurtis_Mante61', N'g3Z1ubtY1I', N'Keanu54@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (27, CAST(N'2020-06-30T22:05:45.0075806' AS DateTime2), NULL, 0, NULL, 1, N'Dakota', N'Kreiger', N'Meagan.Okuneva', N'pjllmSHxdd', N'Demetrius_Nolan66@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (28, CAST(N'2020-06-30T22:05:45.0075810' AS DateTime2), NULL, 0, NULL, 1, N'Gregory', N'Collier', N'Jasmin82', N'UrQhq5M7kS', N'Lexi50@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (29, CAST(N'2020-06-30T22:05:45.0075814' AS DateTime2), NULL, 0, NULL, 1, N'Javonte', N'Jast', N'Tom48', N'R_1f2o73jv', N'Larissa_Watsica34@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (30, CAST(N'2020-06-30T22:05:45.0075727' AS DateTime2), NULL, 0, NULL, 1, N'Alexander', N'Gleichner', N'Andres.Ferry46', N'2kxkzBbTX3', N'Jayce72@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (31, CAST(N'2020-06-30T22:05:45.0075722' AS DateTime2), NULL, 0, NULL, 1, N'Victor', N'Abshire', N'Earnestine27', N'scyL1CBtqy', N'Leland_Kerluke@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (32, CAST(N'2020-06-30T22:05:45.0075718' AS DateTime2), NULL, 0, NULL, 1, N'Rosalia', N'Baumbach', N'Marlene89', N'Fk8XumbfGt', N'Giovani.Hettinger@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (33, CAST(N'2020-06-30T22:05:45.0075714' AS DateTime2), NULL, 0, NULL, 1, N'Erin', N'Runolfsdottir', N'Jamaal38', N'ekOQiAjH1_', N'Erwin.Weissnat44@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (34, CAST(N'2020-06-30T22:05:45.0075610' AS DateTime2), NULL, 0, NULL, 1, N'Susanna', N'Bailey', N'Domingo_Haag86', N'JhasP_OiG6', N'Lenore38@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (35, CAST(N'2020-06-30T22:05:45.0075628' AS DateTime2), NULL, 0, NULL, 1, N'Reyes', N'Walsh', N'Daisha.Johnson', N'fxAia2Bu5m', N'Sylvia84@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (36, CAST(N'2020-06-30T22:05:45.0075632' AS DateTime2), NULL, 0, NULL, 1, N'Andreane', N'Rempel', N'Gabriella_Wehner', N'NyHvzlLe4t', N'Javonte44@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (37, CAST(N'2020-06-30T22:05:45.0075636' AS DateTime2), NULL, 0, NULL, 1, N'Alec', N'Bernhard', N'Claud27', N'V2GL6Wq9cp', N'Antoinette_Blanda@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (38, CAST(N'2020-06-30T22:05:45.0075640' AS DateTime2), NULL, 0, NULL, 1, N'Stevie', N'Franecki', N'Demetris83', N'MtdsTTovyX', N'Scot_Hermann@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (39, CAST(N'2020-06-30T22:05:45.0075645' AS DateTime2), NULL, 0, NULL, 1, N'Cullen', N'Boyer', N'Deanna.Kris', N'SaRYMaG4tS', N'Ardith.Heller19@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (40, CAST(N'2020-06-30T22:05:45.0075649' AS DateTime2), NULL, 0, NULL, 1, N'Brionna', N'Klocko', N'Nia_Zieme', N'ANIy6T1VgC', N'Tobin79@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (41, CAST(N'2020-06-30T22:05:45.0075654' AS DateTime2), NULL, 0, NULL, 1, N'Breanna', N'Weissnat', N'Estelle_Olson23', N'JuyMv9cTHo', N'Kale.Romaguera10@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (42, CAST(N'2020-06-30T22:05:45.0075657' AS DateTime2), NULL, 0, NULL, 1, N'Jayda', N'Doyle', N'Rasheed_Runte19', N'vU2zuj6poi', N'Crawford_Koepp46@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (43, CAST(N'2020-06-30T22:05:45.0075661' AS DateTime2), NULL, 0, NULL, 1, N'Sandrine', N'Block', N'Neva_Hansen12', N'bJAYUv3MyM', N'Tamara.Beatty24@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (44, CAST(N'2020-06-30T22:05:45.0075819' AS DateTime2), NULL, 0, NULL, 1, N'Archibald', N'Kulas', N'Roberta86', N'_RVTR_VOYb', N'Zoe77@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (45, CAST(N'2020-06-30T22:05:45.0075667' AS DateTime2), NULL, 0, NULL, 1, N'Kieran', N'Pagac', N'Adrien39', N'io34df74EF', N'Maritza.Koch16@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (46, CAST(N'2020-06-30T22:05:45.0075675' AS DateTime2), NULL, 0, NULL, 1, N'Nia', N'Wiegand', N'Gabrielle_Fadel', N'aGtau6rK3Z', N'Lesley_Blick43@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (47, CAST(N'2020-06-30T22:05:45.0075679' AS DateTime2), NULL, 0, NULL, 1, N'Keara', N'McCullough', N'Michaela.Feeney', N'OcyjolsHcA', N'Lauriane_Becker@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (48, CAST(N'2020-06-30T22:05:45.0075683' AS DateTime2), NULL, 0, NULL, 1, N'Garland', N'O''Reilly', N'Doris23', N'nVsY5Cxmoa', N'Kaitlyn82@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (49, CAST(N'2020-06-30T22:05:45.0075687' AS DateTime2), NULL, 0, NULL, 1, N'Nasir', N'Pacocha', N'Hilton.Pouros', N'5lpLeGinM9', N'Maximo35@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (50, CAST(N'2020-06-30T22:05:45.0075691' AS DateTime2), NULL, 0, NULL, 1, N'Thurman', N'Goodwin', N'Hillard.Kub7', N'UipgPwQD2C', N'Rickey41@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (51, CAST(N'2020-06-30T22:05:45.0075695' AS DateTime2), NULL, 0, NULL, 1, N'Clay', N'Rath', N'Maxine_Bergnaum47', N'E9LxRRIvz8', N'Jocelyn78@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (52, CAST(N'2020-06-30T22:05:45.0075698' AS DateTime2), NULL, 0, NULL, 1, N'Alaina', N'Hahn', N'Fannie.Feeney88', N'UhcOyl9Hzq', N'Benedict36@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (53, CAST(N'2020-06-30T22:05:45.0075702' AS DateTime2), NULL, 0, NULL, 1, N'Yvonne', N'Yundt', N'Nash_Ondricka23', N'7gRwEChxOo', N'Giovanni.Baumbach@yahoo.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (54, CAST(N'2020-06-30T22:05:45.0075707' AS DateTime2), NULL, 0, NULL, 1, N'Amiya', N'Dickinson', N'Jefferey41', N'v0da0uenL5', N'Keyshawn99@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (55, CAST(N'2020-06-30T22:05:45.0075711' AS DateTime2), NULL, 0, NULL, 1, N'Lloyd', N'Kilback', N'Sim.Lueilwitz', N'DAPC22hzlP', N'Francis_Watsica@hotmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (56, CAST(N'2020-06-30T22:05:45.0075671' AS DateTime2), NULL, 0, NULL, 1, N'Hector', N'Kihn', N'Tony_Mante96', N'EgDgji2oeb', N'Olen11@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [FirstName], [LastName], [Username], [Password], [Email]) VALUES (57, CAST(N'2020-06-30T22:05:45.0075823' AS DateTime2), NULL, 0, NULL, 1, N'Christiana', N'Crona', N'Mittie18', N'MT_yITFdY8', N'Barrett_Boyle@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (6, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (8, 2, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (9, 3, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (10, 4, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (11, 5, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (12, 6, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (13, 7, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (14, 8, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (15, 9, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (17, 10, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (18, 11, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (19, 12, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (20, 13, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (22, 14, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (23, 15, 7)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (24, 11, 4)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (34, 6, 4)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (35, 7, 4)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (36, 15, 4)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId]) VALUES (37, 14, 4)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
/****** Object:  Index [AK_ActorMovies_ActorId_MovieId]    Script Date: 12/07/2020 08:11:52 ******/
ALTER TABLE [dbo].[ActorMovies] ADD  CONSTRAINT [AK_ActorMovies_ActorId_MovieId] UNIQUE NONCLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActorMovies_MovieId]    Script Date: 12/07/2020 08:11:52 ******/
CREATE NONCLUSTERED INDEX [IX_ActorMovies_MovieId] ON [dbo].[ActorMovies]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Actors_FirstName]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Actors_FirstName] ON [dbo].[Actors]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Actors_LastName]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Actors_LastName] ON [dbo].[Actors]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_Name]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Genres_Name] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AK_MovieGenres_GenreId_MovieId]    Script Date: 12/07/2020 08:11:52 ******/
ALTER TABLE [dbo].[MovieGenres] ADD  CONSTRAINT [AK_MovieGenres_GenreId_MovieId] UNIQUE NONCLUSTERED 
(
	[GenreId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieGenres_MovieId]    Script Date: 12/07/2020 08:11:52 ******/
CREATE NONCLUSTERED INDEX [IX_MovieGenres_MovieId] ON [dbo].[MovieGenres]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Title]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_Title] ON [dbo].[Movies]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AK_Reviews_MovieId_UserId]    Script Date: 12/07/2020 08:11:52 ******/
ALTER TABLE [dbo].[Reviews] ADD  CONSTRAINT [AK_Reviews_MovieId_UserId] UNIQUE NONCLUSTERED 
(
	[MovieId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_UserId]    Script Date: 12/07/2020 08:11:52 ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_UserId] ON [dbo].[Reviews]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 12/07/2020 08:11:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 12/07/2020 08:11:52 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [MovieRating]
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Actors_ActorId]
GO
ALTER TABLE [dbo].[ActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovies_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovies] CHECK CONSTRAINT [FK_ActorMovies_Movies_MovieId]
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenres_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenres] CHECK CONSTRAINT [FK_MovieGenres_Genres_GenreId]
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenres_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieGenres] CHECK CONSTRAINT [FK_MovieGenres_Movies_MovieId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Movies_MovieId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [movie-review] SET  READ_WRITE 
GO
