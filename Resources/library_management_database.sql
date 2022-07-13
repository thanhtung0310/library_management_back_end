USE [db_LibraryManagement]
GO
/****** Object:  StoredProcedure [dbo].[spUserToken_Insert]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUserToken_Insert]
GO
/****** Object:  StoredProcedure [dbo].[spUserToken_Clear]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUserToken_Clear]
GO
/****** Object:  StoredProcedure [dbo].[spUsers_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUsers_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spUserPwd_Get]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUserPwd_Get]
GO
/****** Object:  StoredProcedure [dbo].[spUser_Get]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUser_Get]
GO
/****** Object:  StoredProcedure [dbo].[spUser_Create]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spUser_Create]
GO
/****** Object:  StoredProcedure [dbo].[spTotalLoansPerBranch_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spTotalLoansPerBranch_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spTotalBookCopiesByBranch_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spTotalBookCopiesByBranch_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spTotalBookCopies_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spTotalBookCopies_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spNoLoans_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spNoLoans_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spLoanersInfo_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spLoanersInfo_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spCopiesFromSharpstown_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spCopiesFromSharpstown_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spCopiesAtAllBranches_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spCopiesAtAllBranches_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spBorrowerOnLoans_Get]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBorrowerOnLoans_Get]
GO
/****** Object:  StoredProcedure [dbo].[spBorrower_Insert]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBorrower_Insert]
GO
/****** Object:  StoredProcedure [dbo].[spBooksLoanedOut_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBooksLoanedOut_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spBooks_Search]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBooks_Search]
GO
/****** Object:  StoredProcedure [dbo].[spBookPublishers_Search]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookPublishers_Search]
GO
/****** Object:  StoredProcedure [dbo].[spBookOnLoans_Get]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookOnLoans_Get]
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Return]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookLoans_Return]
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Insert]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookLoans_Insert]
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookLoans_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spBookAuthors_Search]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBookAuthors_Search]
GO
/****** Object:  StoredProcedure [dbo].[spBook_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spBook_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spAvailBookCopiesByBranch_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_Get]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spAvailBookCopiesByBranch_Get]
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopies_GetAll]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[spAvailBookCopies_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[sp]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP PROCEDURE [dbo].[sp]
GO
ALTER TABLE [dbo].[tbl_book_loans] DROP CONSTRAINT [fk_cardno]
GO
ALTER TABLE [dbo].[tbl_book_loans] DROP CONSTRAINT [fk_branch_id1]
GO
ALTER TABLE [dbo].[tbl_book_loans] DROP CONSTRAINT [fk_book_id1]
GO
ALTER TABLE [dbo].[tbl_book_copies] DROP CONSTRAINT [fk_branch_id2]
GO
ALTER TABLE [dbo].[tbl_book_copies] DROP CONSTRAINT [fk_book_id2]
GO
ALTER TABLE [dbo].[tbl_book_authors] DROP CONSTRAINT [fk_book_id3]
GO
ALTER TABLE [dbo].[tbl_book] DROP CONSTRAINT [fk_publisher_id11]
GO
/****** Object:  Index [IX_tbl_user]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP INDEX [IX_tbl_user] ON [dbo].[tbl_user]
GO
/****** Object:  Index [UK_tbl_user]    Script Date: 7/13/2022 5:28:37 PM ******/
ALTER TABLE [dbo].[tbl_user] DROP CONSTRAINT [UK_tbl_user]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_user]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_user]
GO
/****** Object:  Table [dbo].[tbl_publisher]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_publisher]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_publisher]
GO
/****** Object:  Table [dbo].[tbl_library_branch]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_library_branch]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_library_branch]
GO
/****** Object:  Table [dbo].[tbl_borrower]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_borrower]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_borrower]
GO
/****** Object:  Table [dbo].[tbl_book_loans]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_book_loans]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_book_loans]
GO
/****** Object:  Table [dbo].[tbl_book_copies]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_book_copies]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_book_copies]
GO
/****** Object:  Table [dbo].[tbl_book_authors]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_book_authors]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_book_authors]
GO
/****** Object:  Table [dbo].[tbl_book]    Script Date: 7/13/2022 5:28:37 PM ******/
IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[tbl_book]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_book]
GO
USE [master]
GO
/****** Object:  Database [db_LibraryManagement]    Script Date: 7/13/2022 5:28:37 PM ******/
DROP DATABASE [db_LibraryManagement]
GO
/****** Object:  Database [db_LibraryManagement]    Script Date: 7/13/2022 5:28:37 PM ******/
CREATE DATABASE [db_LibraryManagement]
GO
ALTER DATABASE [db_LibraryManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
	EXEC [db_LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [db_LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_LibraryManagement] SET DB_CHAINING OFF 
GO
USE [db_LibraryManagement]
GO
/****** Object:  Table [dbo].[tbl_book]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book]
(
	[book_BookID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_Title] [varchar](100) NOT NULL,
	[book_PublisherID] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[book_BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book_authors]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_authors]
(
	[book_authors_AuthorID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_authors_BookID] [int] NOT NULL,
	[book_authors_AuthorName] [varchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[book_authors_AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book_copies]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_copies]
(
	[book_copies_CopiesID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_copies_BookID] [int] NOT NULL,
	[book_copies_BranchID] [int] NOT NULL,
	[book_copies_No_Of_Copies] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[book_copies_CopiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book_loans]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_loans]
(
	[book_loans_LoansID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_loans_BookID] [int] NOT NULL,
	[book_loans_BranchID] [int] NOT NULL,
	[book_loans_CardNo] [int] NOT NULL,
	[book_loans_DateOut] [varchar](10) NOT NULL,
	[book_loans_DueDate] [varchar](10) NOT NULL,
	[book_loans_Status] [varchar](50) NULL,
	CONSTRAINT [PK__tbl_book__9A03D6FB0AD2A005] PRIMARY KEY CLUSTERED 
(
	[book_loans_LoansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_borrower]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_borrower]
(
	[borrower_CardNo] [int] IDENTITY(100,1) NOT FOR REPLICATION NOT NULL,
	[borrower_BorrowerName] [varchar](100) NOT NULL,
	[borrower_BorrowerAddress] [varchar](200) NOT NULL,
	[borrower_BorrowerPhone] [varchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[borrower_CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_library_branch]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_library_branch]
(
	[library_branch_BranchID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[library_branch_BranchName] [varchar](100) NOT NULL,
	[library_branch_BranchAddress] [varchar](200) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[library_branch_BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_publisher]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_publisher]
(
	[publisher_PublisherID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[publisher_PublisherName] [varchar](100) NOT NULL,
	[publisher_PublisherAddress] [varchar](200) NOT NULL,
	[publisher_PublisherPhone] [varchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[publisher_PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 7/13/2022 5:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user]
(
	[userID] [int] IDENTITY(1000,1) NOT NULL,
	[userFullname] [nvarchar](200) NOT NULL,
	[userEmail] [varchar](100) NOT NULL,
	[userPassword] [varchar](60) NOT NULL,
	[userRole] [int] NOT NULL,
	[userToken] [varchar](200) NULL,
	CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_book] ON

INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(1, N'The Name of the Wind', 6)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(2, N'It', 15)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(3, N'The Green Mile', 14)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(4, N'Dune', 5)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(5, N'The Hobbit', 7)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(6, N'Eragon', 1)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(7, N'A Wise Mans Fear', 6)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(8, N'Harry Potter and the Philosophers Stone', 3)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(9, N'Hard Boiled Wonderland and The End of the World', 13)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(10, N'The Giving Tree', 9)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(11, N'The Hitchhikers Guide to the Galaxy', 10)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(12, N'Brave New World', 4)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(13, N'The Princess Bride', 8)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(14, N'Fight Club', 16)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(15, N'Holes', 12)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(16, N'Harry Potter and the Chamber of Secrets', 3)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(17, N'Harry Potter and the Prisoner of Azkaban', 3)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(18, N'The Fellowship of the Ring', 7)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(19, N'A Game of Thrones', 2)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(20, N'The Lost Tribe', 11)
INSERT [dbo].[tbl_book]
	([book_BookID], [book_Title], [book_PublisherID])
VALUES
	(42, N'The Fault in Our stars', 1)
SET IDENTITY_INSERT [dbo].[tbl_book] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_book_authors] ON

INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(2, 2, N'Stephen King')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(3, 3, N'Stephen King')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(4, 4, N'Frank Herbert')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(5, 5, N'J.R.R. Tolkien')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(6, 6, N'Christopher Paolini')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(7, 7, N'Patrick Rothfuss')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(8, 8, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(9, 9, N'Haruki Murakami')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(10, 10, N'Shel Silverstein')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(11, 11, N'Douglas Adams')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(12, 12, N'Aldous Huxley')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(13, 13, N'William Goldman')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(14, 14, N'Chuck Palahniuk')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(15, 15, N'Louis Sachar')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(16, 16, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(17, 17, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(18, 18, N'J.R.R. Tolkien')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(19, 19, N'George R.R. Martin')
INSERT [dbo].[tbl_book_authors]
	([book_authors_AuthorID], [book_authors_BookID], [book_authors_AuthorName])
VALUES
	(20, 20, N'Mark Lee')
SET IDENTITY_INSERT [dbo].[tbl_book_authors] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_book_loans] ON

INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(1, 1, 1, 100, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(2, 2, 1, 100, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(3, 3, 1, 100, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(4, 4, 1, 100, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(5, 5, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(6, 6, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(7, 7, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(8, 8, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(9, 9, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(10, 11, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(11, 12, 2, 105, N'2021-10-12', N'2021-11-12', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(12, 20, 2, 105, N'2022-02-03', N'2022-03-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(13, 18, 2, 105, N'2021-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(14, 19, 2, 105, N'2021-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(15, 19, 2, 100, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(16, 11, 2, 106, N'2022-01-06', N'2022-02-06', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(17, 1, 2, 106, N'2022-01-06', N'2022-02-06', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(18, 2, 2, 100, N'2022-01-06', N'2022-02-06', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(19, 3, 2, 100, N'2022-01-06', N'2022-02-06', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(20, 5, 2, 105, N'2022-01-02', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(21, 4, 3, 103, N'2022-01-09', N'2022-02-09', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(22, 7, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(23, 17, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(24, 16, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(25, 15, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(26, 15, 3, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(27, 14, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(28, 13, 3, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(29, 13, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(30, 19, 3, 102, N'2022-01-12', N'2022-02-12', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(31, 20, 4, 103, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(32, 3, 4, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(33, 18, 4, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(34, 12, 4, 102, N'2022-01-04', N'2022-02-04', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(35, 11, 4, 103, N'2022-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(36, 9, 4, 103, N'2022-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(37, 7, 4, 107, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(38, 4, 4, 103, N'2022-01-01', N'2022-02-01', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(39, 1, 4, 103, N'2022-02-06', N'2022-03-06', N'Done')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(40, 20, 4, 103, N'2022-06-06', N'2022-07-06', N'In Progress')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(41, 1, 4, 102, N'2022-06-06', N'2022-07-06', N'In Progress')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(42, 4, 4, 103, N'2022-07-06', N'2022-08-06', N'In Progress')
INSERT [dbo].[tbl_book_loans]
	([book_loans_LoansID], [book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status])
VALUES
	(43, 5, 3, 101, N'2022-07-06', N'2022-08-06', N'In Progress')
SET IDENTITY_INSERT [dbo].[tbl_book_loans] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_borrower] ON

INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(100, N'Joe Smith', N'1321 4th Street, New York, NY 10014', N'212-312-1234')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(101, N'Jane Smith', N'1321 4th Street, New York, NY 10014', N'212-931-4124')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(102, N'Tom Li', N'981 Main Street, Ann Arbor, MI 48104', N'734-902-7455')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(103, N'Angela Thompson', N'2212 Green Avenue, Ann Arbor, MI 48104', N'313-591-2122')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(104, N'Harry Emnace', N'121 Park Drive, Ann Arbor, MI 48104', N'412-512-5522')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(105, N'Tom Haverford', N'23 75th Street, New York, NY 10014', N'212-631-3418')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(106, N'Haley Jackson', N'231 52nd Avenue New York, NY 10014', N'212-419-9935')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(107, N'Michael Horford', N'653 Glen Avenue, Ann Arbor, MI 48104', N'734-998-1513')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(108, N'Phan Thanh Tung', N'Hanoi, Vietnam', N'0123-456-789')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(109, N'Hoàng Van Vi?t', N'Hanoi, Vietnam', N'0913275388')
INSERT [dbo].[tbl_borrower]
	([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone])
VALUES
	(110, N'string', N'string', N'string')
SET IDENTITY_INSERT [dbo].[tbl_borrower] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_library_branch] ON

INSERT [dbo].[tbl_library_branch]
	([library_branch_BranchID], [library_branch_BranchName], [library_branch_BranchAddress])
VALUES
	(1, N'Sharpstown', N'32 Corner Road, New York, NY 10012')
INSERT [dbo].[tbl_library_branch]
	([library_branch_BranchID], [library_branch_BranchName], [library_branch_BranchAddress])
VALUES
	(2, N'Central', N'491 3rd Street, New York, NY 10014')
INSERT [dbo].[tbl_library_branch]
	([library_branch_BranchID], [library_branch_BranchName], [library_branch_BranchAddress])
VALUES
	(3, N'Saline', N'40 State Street, Saline, MI 48176')
INSERT [dbo].[tbl_library_branch]
	([library_branch_BranchID], [library_branch_BranchName], [library_branch_BranchAddress])
VALUES
	(4, N'Ann Arbor', N'101 South University, Ann Arbor, MI 48104')
SET IDENTITY_INSERT [dbo].[tbl_library_branch] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_publisher] ON

INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(1, N'Alfred A. Knopf', N'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019', N'212-940-7390')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(2, N'Bantam', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(3, N'Bloomsbury', N'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', N'212-419-5300')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(4, N'Chalto & Windus', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(5, N'Chilton Books', N'Not Available', N'Not Available')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(6, N'DAW Books', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(7, N'George Allen & Unwin', N'83 Alexander Ln, Crows Nest NSW 2065, Australia', N'+61-2-8425-0100')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(8, N'Harcourt Brace Jovanovich', N'3 Park Ave, New York, NY 10016', N'212-420-5800')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(9, N'Harper and Row', N'HarperCollins Publishers, 195 Broadway, New York, NY 10007', N'212-207-7000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(10, N'Pan Books', N'175 Fifth Avenue, New York, NY 10010', N'646-307-5745')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(11, N'Picador USA', N'175 Fifth Avenue, New York, NY 10010', N'646-307-5745')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(12, N'Scholastic', N'557 Broadway, New York, NY 10012', N'800-724-6527')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(13, N'Shinchosa', N'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan', N'+81-3-5577-6507')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(14, N'Signet Books', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(15, N'Viking', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher]
	([publisher_PublisherID], [publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone])
VALUES
	(16, N'W.W. Norton', N' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110', N'212-354-5500')
SET IDENTITY_INSERT [dbo].[tbl_publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON

INSERT [dbo].[tbl_user]
	([userID], [userFullname], [userEmail], [userPassword], [userRole], [userToken])
VALUES
	(1000, N'Phan Thanh Tùng', N'tungpt@gmail.com', N'tungpt', 1, NULL)
INSERT [dbo].[tbl_user]
	([userID], [userFullname], [userEmail], [userPassword], [userRole], [userToken])
VALUES
	(1001, N'Admin', N'admin', N'admin', 1, NULL)
INSERT [dbo].[tbl_user]
	([userID], [userFullname], [userEmail], [userPassword], [userRole], [userToken])
VALUES
	(1002, N'Staff', N'staff', N'staff', 0, NULL)
INSERT [dbo].[tbl_user]
	([userID], [userFullname], [userEmail], [userPassword], [userRole], [userToken])
VALUES
	(1003, N'Hoàng Văn Việt', N'viethv@gmail.com', N'viethv', 0, NULL)
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_tbl_user]    Script Date: 7/13/2022 5:28:38 PM ******/
ALTER TABLE [dbo].[tbl_user] ADD  CONSTRAINT [UK_tbl_user] UNIQUE NONCLUSTERED 
(
	[userID] ASC,
	[userEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tbl_user]    Script Date: 7/13/2022 5:28:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_tbl_user] ON [dbo].[tbl_user]
(
	[userID] ASC,
	[userEmail] ASC,
	[userFullname] ASC,
	[userRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_book]  WITH CHECK ADD  CONSTRAINT [fk_publisher_id11] FOREIGN KEY([book_PublisherID])
REFERENCES [dbo].[tbl_publisher] ([publisher_PublisherID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book] CHECK CONSTRAINT [fk_publisher_id11]
GO
ALTER TABLE [dbo].[tbl_book_authors]  WITH CHECK ADD  CONSTRAINT [fk_book_id3] FOREIGN KEY([book_authors_BookID])
REFERENCES [dbo].[tbl_book] ([book_BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_authors] CHECK CONSTRAINT [fk_book_id3]
GO
ALTER TABLE [dbo].[tbl_book_copies]  WITH CHECK ADD  CONSTRAINT [fk_book_id2] FOREIGN KEY([book_copies_BookID])
REFERENCES [dbo].[tbl_book] ([book_BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_copies] CHECK CONSTRAINT [fk_book_id2]
GO
ALTER TABLE [dbo].[tbl_book_copies]  WITH CHECK ADD  CONSTRAINT [fk_branch_id2] FOREIGN KEY([book_copies_BranchID])
REFERENCES [dbo].[tbl_library_branch] ([library_branch_BranchID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_copies] CHECK CONSTRAINT [fk_branch_id2]
GO
ALTER TABLE [dbo].[tbl_book_loans]  WITH CHECK ADD  CONSTRAINT [fk_book_id1] FOREIGN KEY([book_loans_BookID])
REFERENCES [dbo].[tbl_book] ([book_BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_loans] CHECK CONSTRAINT [fk_book_id1]
GO
ALTER TABLE [dbo].[tbl_book_loans]  WITH CHECK ADD  CONSTRAINT [fk_branch_id1] FOREIGN KEY([book_loans_BranchID])
REFERENCES [dbo].[tbl_library_branch] ([library_branch_BranchID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_loans] CHECK CONSTRAINT [fk_branch_id1]
GO
ALTER TABLE [dbo].[tbl_book_loans]  WITH CHECK ADD  CONSTRAINT [fk_cardno] FOREIGN KEY([book_loans_CardNo])
REFERENCES [dbo].[tbl_borrower] ([borrower_CardNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_book_loans] CHECK CONSTRAINT [fk_cardno]
GO
/****** Object:  StoredProcedure [dbo].[sp]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDURE TEMPLATE -- 
-- <>
CREATE PROCEDURE [dbo].[sp]
	(@id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_book_loans l
	WHERE l.[book_loans_BranchID] = @id)
		BEGIN
		SET NOCOUNT ON;

		SELECT *
		FROM db_LibraryManagement.dbo.tbl_book b
			JOIN db_LibraryManagement.dbo.tbl_book_authors bA ON bA.[book_authors_BookID] = b.[book_BookID]
		WHERE b.[book_BookID] = @id
		ORDER BY bA.[book_authors_AuthorID]
	END
	ELSE
		BEGIN
		DECLARE @IN VARCHAR(500)
		SET @IN = 'There is no book with the id = '
		PRINT @IN + CONVERT(varchar,@id,100)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopies_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAvailBookCopies_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
	FROM db_LibraryManagement.dbo.tbl_book_copies bc
		JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
	WHERE l.[book_loans_Status] = 'In Progress'
	GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
END
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_Get]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAvailBookCopiesByBranch_Get]
	(@branch_id int,
	@book_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_book_loans l
	WHERE l.[book_loans_BranchID] = @branch_id AND l.[book_loans_BookID] = @book_id)
		BEGIN
		SET NOCOUNT ON;

		SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
		FROM db_LibraryManagement.dbo.tbl_book_copies bc
			LEFT JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
		WHERE bc.[book_copies_BranchID] = @branch_id AND l.[book_loans_BookID] = @book_id AND l.[book_loans_Status] = 'In Progress'
		GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
	END
	ELSE
		BEGIN
		DECLARE @IN1 VARCHAR(500), @IN2 VARCHAR(500), @IN3 VARCHAR(500)
		SET @IN1 = 'There is no book with the id = '
		SET @IN2 = ' from branch '
		SET @IN3 = ' in use'
		PRINT @IN1 + CONVERT(varchar,@book_id,100) + @IN2 + CONVERT(varchar,@branch_id,100) + @IN3
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAvailBookCopiesByBranch_GetAll]
	(@branch_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_book_loans l
	WHERE l.[book_loans_BranchID] = @branch_id)
		BEGIN
		SET NOCOUNT ON;

		SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
		FROM db_LibraryManagement.dbo.tbl_book_copies bc
			LEFT JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
		WHERE bc.[book_copies_BranchID] = @branch_id AND l.[book_loans_Status] = 'In Progress'
		GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
	END
	ELSE
		BEGIN
		DECLARE @IN VARCHAR(500)
		SET @IN = 'There is no branch with the id = '
		PRINT @IN + CONVERT(varchar,@branch_id,100)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spBook_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBook_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT b.[book_BookID] 'book_id', b.[book_Title] 'book_title', bA.[book_authors_AuthorName] 'author_name', p.[publisher_PublisherName] 'publisher_name'
	FROM db_LibraryManagement.dbo.tbl_book b
		JOIN db_LibraryManagement.dbo.tbl_book_authors bA ON bA.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
	ORDER BY bA.[book_authors_AuthorID]
END
GO
/****** Object:  StoredProcedure [dbo].[spBookAuthors_Search]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookAuthors_Search]
	(@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.[book_authors_AuthorID] 'author_id', a.[book_authors_AuthorName] 'author_name', b.[book_Title] 'book_title', p.[publisher_PublisherName] 'publisher_name'
	FROM db_LibraryManagement.dbo.tbl_book_authors a
		JOIN db_LibraryManagement.dbo.tbl_book b ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
	WHERE a.[book_authors_AuthorName] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT l.[book_loans_LoansID] 'loan_id', b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerPhone] 'borrower_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', brh.[library_branch_BranchName] 'branch_name'
	FROM db_LibraryManagement.dbo.tbl_book_loans l
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
		JOIN db_LibraryManagement.dbo.tbl_library_branch brh ON brh.[library_branch_BranchID] = l.[book_loans_BranchID]
		JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
	WHERE l.[book_loans_Status] = 'In Progress'
	ORDER BY brw.[borrower_BorrowerName], l.[book_loans_LoansID] DESC, b.[book_Title]
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Insert]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_Insert]
	(@book_id int,
	@branch_id int,
	@borrower_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
		FROM db_LibraryManagement.dbo.tbl_borrower brh
		WHERE brh.[borrower_CardNo] = @borrower_id)
		AND EXISTS (SELECT 1
		FROM db_LibraryManagement.dbo.tbl_library_branch brH
		WHERE brH.[library_branch_BranchID] = @branch_id)
		AND EXISTS (SELECT 1
		FROM db_LibraryManagement.dbo.tbl_book b
		WHERE b.[book_BookID] = @book_id)
		BEGIN
		SET NOCOUNT ON;

		INSERT INTO db_LibraryManagement.dbo.tbl_book_loans
			([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo],[book_loans_DateOut],[book_loans_DueDate],[book_loans_Status])
		VALUES
			(@book_id, @branch_id, @borrower_id, CONVERT(varchar(10),CURRENT_TIMESTAMP,120), CONVERT(varchar(10),DATEADD(month,1,CURRENT_TIMESTAMP),120), 'In Progress')

		SELECT TOP 1
			l.[book_loans_LoansID] 'loan_id', b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerPhone] 'borrower_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', brh.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
			JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
			JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
			JOIN db_LibraryManagement.dbo.tbl_library_branch brh ON brh.[library_branch_BranchID] = l.[book_loans_BranchID]
		WHERE l.[book_loans_CardNo] = @borrower_id AND l.[book_loans_BranchID] = @branch_id AND l.[book_loans_BookID] = @book_id AND l.[book_loans_Status] = 'In Progress'
		ORDER BY l.[book_loans_LoansID] DESC, l.[book_loans_DueDate] DESC
	END
	ELSE
		BEGIN
		PRINT 'Loan order cannot be created! Please try again.'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Return]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_Return]
	(@loan_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_book_loans l
	WHERE l.[book_loans_LoansID] = @loan_id)
		BEGIN
		SET NOCOUNT ON;

		UPDATE db_LibraryManagement.dbo.tbl_book_loans
				SET [book_loans_Status] = 'Done'
				WHERE [book_loans_LoansID] = @loan_id

		SELECT TOP 1
			l.[book_loans_LoansID] 'loan_id', b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerPhone] 'borrower_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', brh.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
			JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
			JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
			JOIN db_LibraryManagement.dbo.tbl_library_branch brh ON brh.[library_branch_BranchID] = l.[book_loans_BranchID]
		WHERE l.[book_loans_LoansID] = @loan_id
		ORDER BY l.[book_loans_LoansID] DESC, l.[book_loans_DueDate] DESC
	END
	ELSE
		BEGIN
		PRINT 'Return function failed! Please try again!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookOnLoans_Get]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookOnLoans_Get]
	(@borrower_id int,
	@book_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
		FROM db_LibraryManagement.dbo.tbl_book b
		WHERE b.[book_BookID] = @book_id)
		AND EXISTS (SELECT 1
		FROM db_LibraryManagement.dbo.tbl_borrower brw
		WHERE brw.[borrower_CardNo] = @borrower_id)
		BEGIN
		SET NOCOUNT ON;

		SELECT l.[book_loans_LoansID] 'loan_id', b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerPhone] 'borrower_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', brh.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
			JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
			JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
			JOIN db_LibraryManagement.dbo.tbl_library_branch brh ON brh.[library_branch_BranchID] = l.[book_loans_BranchID]
		WHERE l.[book_loans_BookID] = @book_id AND l.[book_loans_CardNo] = @borrower_id AND l.[book_loans_Status] = 'In Progress'
		ORDER BY brw.[borrower_BorrowerName], l.[book_loans_LoansID] DESC, b.[book_Title]
	END
	ELSE
		BEGIN
		PRINT 'Cannot search! Please try again.'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookPublishers_Search]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookPublishers_Search]
	(@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.[publisher_PublisherID] 'publisher_id', p.[publisher_PublisherName] 'publisher_name', p.[publisher_PublisherAddress] 'publisher_address', p.[publisher_PublisherPhone] 'publisher_contact_number', b.[book_Title] 'book_title'
	FROM db_LibraryManagement.dbo.tbl_publisher p
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_PublisherID] = p.[publisher_PublisherID]
	WHERE p.[publisher_PublisherName] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBooks_Search]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBooks_Search]
	(@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT b.[book_BookID] 'book_id', b.[book_Title] 'book_title', a.[book_authors_AuthorName] 'author_name', p.[publisher_PublisherName] 'publisher_name'
	FROM db_LibraryManagement.dbo.tbl_book b
		JOIN db_LibraryManagement.dbo.tbl_book_authors a ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
	WHERE b.[book_Title] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBooksLoanedOut_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spBooksLoanedOut_GetAll]
	(@BooksCheckedOut INT = 5)
AS
SELECT Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	COUNT(Borrower.borrower_BorrowerName) AS [Books Checked Out]
FROM db_LibraryManagement.dbo.tbl_book_loans AS Loans
	INNER JOIN db_LibraryManagement.dbo.tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
GROUP BY Borrower.borrower_BorrowerName, Borrower.borrower_BorrowerAddress
HAVING COUNT(Borrower.borrower_BorrowerName) >= @BooksCheckedOut
GO
/****** Object:  StoredProcedure [dbo].[spBorrower_Insert]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBorrower_Insert](@borrower_name varchar(200),
	@borrower_address varchar(100),
	@borrower_contact_number varchar(50))
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO db_LibraryManagement.dbo.tbl_borrower
		([borrower_BorrowerName],[borrower_BorrowerAddress], [borrower_BorrowerPhone])
	VALUES
		(@borrower_name, @borrower_address, @borrower_contact_number)

	SELECT brw.[borrower_CardNo] 'borrower_id', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerAddress] 'borrower_address', brw.[borrower_BorrowerPhone] 'borrower_contact_number'
	FROM db_LibraryManagement.dbo.tbl_borrower brw
	ORDER BY brw.[borrower_CardNo] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spBorrowerOnLoans_Get]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBorrowerOnLoans_Get]
	(@borrower_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_borrower b
	WHERE b.[borrower_CardNo] = @borrower_id)
		BEGIN
		SET NOCOUNT ON;

		SELECT l.[book_loans_LoansID] 'loan_id', b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'borrower_name', brw.[borrower_BorrowerPhone] 'borrower_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', brh.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
			JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
			JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
			JOIN db_LibraryManagement.dbo.tbl_library_branch brh ON brh.[library_branch_BranchID] = l.[book_loans_BranchID]
		WHERE l.[book_loans_CardNo] = @borrower_id AND l.[book_loans_Status] = 'In Progress'
		ORDER BY l.[book_loans_LoansID], l.[book_loans_BranchID], l.[book_loans_DueDate]
	END
	ELSE
		BEGIN
		DECLARE @IN VARCHAR(500)
		SET @IN = 'There is no borrower with the id = '
		PRINT @IN + CONVERT(varchar,@borrower_id,100)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spCopiesAtAllBranches_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCopiesAtAllBranches_GetAll]
	(@bookTitle varchar(70) = 'The Lost Tribe')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	copies.book_copies_No_Of_Copies AS [Number of Copies],
	book.book_Title AS [Book Title]
FROM db_LibraryManagement.dbo.tbl_book_copies AS copies
	INNER JOIN db_LibraryManagement.dbo.tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
	INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
WHERE book.book_Title = @bookTitle 
GO
/****** Object:  StoredProcedure [dbo].[spCopiesFromSharpstown_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCopiesFromSharpstown_GetAll]
	(@bookTitle varchar(70) = 'The Lost Tribe',
	@branchName varchar(70) = 'Sharpstown')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	copies.book_copies_No_Of_Copies AS [Number of Copies],
	book.book_Title AS [Book Title]
FROM db_LibraryManagement.dbo.tbl_book_copies AS copies
	INNER JOIN db_LibraryManagement.dbo.tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
	INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
WHERE book.book_Title = @bookTitle AND branch.library_branch_BranchName = @branchName
GO
/****** Object:  StoredProcedure [dbo].[spLoanersInfo_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLoanersInfo_GetAll]
	(@DueDate date = NULL,
	@LibraryBranchName varchar(50) = 'Sharpstown')
AS
SET @DueDate = GETDATE()
SELECT Branch.library_branch_BranchName AS [Branch Name], Book.book_Title [Book Name],
	Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	Loans.book_loans_DateOut AS [Date Out], Loans.book_loans_DueDate [Due Date]
FROM db_LibraryManagement.dbo.tbl_book_loans AS Loans
	INNER JOIN db_LibraryManagement.dbo.tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
	INNER JOIN db_LibraryManagement.dbo.tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
	INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
WHERE Loans.book_loans_DueDate = @DueDate AND Branch.library_branch_BranchName = @LibraryBranchName
GO
/****** Object:  StoredProcedure [dbo].[spNoLoans_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spNoLoans_GetAll]
AS
SELECT borrower_BorrowerName
FROM tbl_borrower
WHERE NOT EXISTS
		(SELECT *
FROM db_LibraryManagement.dbo.tbl_book_loans
WHERE book_loans_CardNo = borrower_CardNo)
GO
/****** Object:  StoredProcedure [dbo].[spTotalBookCopies_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTotalBookCopies_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] 'total_count'
	FROM db_LibraryManagement.dbo.tbl_book_copies bc
		JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
	GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies]
END
GO
/****** Object:  StoredProcedure [dbo].[spTotalBookCopiesByBranch_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTotalBookCopiesByBranch_GetAll]
	(@branch_id int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_book_loans l
	WHERE l.[book_loans_BranchID] = @branch_id)
		BEGIN
		SET NOCOUNT ON;

		SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] 'total_count'
		FROM db_LibraryManagement.dbo.tbl_book_copies bc
			JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
		WHERE bc.[book_copies_BranchID] = @branch_id
		GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies]
	END
	ELSE
		BEGIN
		DECLARE @IN VARCHAR(500)
		SET @IN = 'There is no branch with the id = '
		PRINT @IN + CONVERT(varchar,@branch_id,100)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spTotalLoansPerBranch_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTotalLoansPerBranch_GetAll]
AS
SELECT Branch.library_branch_BranchName AS [Branch Name], COUNT (Loans.book_loans_BranchID) AS [Total Loans]
FROM db_LibraryManagement.dbo.tbl_book_loans AS Loans
	INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
GROUP BY library_branch_BranchName
GO
/****** Object:  StoredProcedure [dbo].[spUser_Create]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUser_Create]
	(@userFullname varchar(200),
	@userEmail varchar(100),
	@userPassword varchar(60),
	@userRole int)
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_user u
	WHERE u.[userEmail] = @userEmail)
		BEGIN
		PRINT 'Email has already been used! Please try again!'
	END
	ELSE
		BEGIN
		SET NOCOUNT ON;

		INSERT INTO db_LibraryManagement.dbo.tbl_user
			(userFullname, userEmail, userPassword, userRole)
		VALUES
			(@userFullname, @userEmail, @userPassword, @userRole)

		SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
		FROM db_LibraryManagement.dbo.tbl_user u
		WHERE u.userEmail = @userFullname
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUser_Get]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUser_Get]
	(@userEmail varchar(100))
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_user u
	WHERE u.[userEmail] = @userEmail)
		BEGIN
		SET NOCOUNT ON;

		SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
		FROM db_LibraryManagement.dbo.tbl_user u
		WHERE u.[userEmail] = @userEmail
	END
	ELSE
		BEGIN
		PRINT 'Cannot find user with that email! Please try again!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUserPwd_Get]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserPwd_Get]
	(@userEmail varchar(100))
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_user u
	WHERE u.[userEmail] = @userEmail)
		BEGIN
		SET NOCOUNT ON;

		SELECT u.userPassword
		FROM db_LibraryManagement.dbo.tbl_user u
		WHERE u.[userEmail] = @userEmail
	END
	ELSE
		BEGIN
		PRINT 'Cannot find user with that email! Please try again!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUsers_GetAll]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUsers_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
	FROM db_LibraryManagement.dbo.tbl_user u
	ORDER BY u.userRole DESC, u.userToken
END
GO
/****** Object:  StoredProcedure [dbo].[spUserToken_Clear]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserToken_Clear]
	(@userEmail varchar(100))
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_user u
	WHERE u.[userEmail] = @userEmail)
		BEGIN
		SET NOCOUNT ON;

		UPDATE db_LibraryManagement.dbo.tbl_user
		SET userToken = NULL
		WHERE userEmail = @userEmail

		SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
		FROM db_LibraryManagement.dbo.tbl_user u
		WHERE u.userEmail = @userEmail
	END
	ELSE
		BEGIN
		PRINT 'Cannot find user with that email! Please try again!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spUserToken_Insert]    Script Date: 7/13/2022 5:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserToken_Insert]
	(@userEmail varchar(100),
	@userToken varchar(200))
AS
BEGIN
	IF EXISTS (SELECT 1
	FROM db_LibraryManagement.dbo.tbl_user u
	WHERE u.[userEmail] = @userEmail)
		BEGIN
		SET NOCOUNT ON;

		UPDATE db_LibraryManagement.dbo.tbl_user
		SET userToken = @userToken
		WHERE userEmail = @userEmail

		SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
		FROM db_LibraryManagement.dbo.tbl_user u
		WHERE u.userEmail = @userEmail
	END
	ELSE
		BEGIN
		PRINT 'Cannot find user with that email! Please try again!'
	END
END
GO
USE [master]
GO
ALTER DATABASE [db_LibraryManagement] SET  READ_WRITE 
GO
