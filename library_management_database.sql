USE [master]
GO
/****** Object:  Database [db_LibraryManagement]    Script Date: 6/21/2022 1:06:46 PM ******/
CREATE DATABASE [db_LibraryManagement]
GO
USE [db_LibraryManagement]
GO
/****** Object:  Table [dbo].[tbl_book]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book](
	[book_BookID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_Title] [varchar](100) NOT NULL,
	[book_PublisherID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book_authors]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_authors](
	[book_authors_AuthorID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_authors_BookID] [int] NOT NULL,
	[book_authors_AuthorName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_authors_AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_book_copies]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_copies](
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
/****** Object:  Table [dbo].[tbl_book_loans]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_book_loans](
	[book_loans_LoansID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[book_loans_BookID] [int] NOT NULL,
	[book_loans_BranchID] [int] NOT NULL,
	[book_loans_CardNo] [int] NOT NULL,
	[book_loans_DateOut] [varchar](50) NOT NULL,
	[book_loans_DueDate] [varchar](50) NOT NULL,
	[book_loans_Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[book_loans_LoansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_borrower]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_borrower](
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
/****** Object:  Table [dbo].[tbl_library_branch]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_library_branch](
	[library_branch_BranchID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[library_branch_BranchName] [varchar](100) NOT NULL,
	[library_branch_BranchAddress] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[library_branch_BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_publisher]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_publisher](
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

INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Name of the Wind', 6)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'It', 15)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Green Mile', 14)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Dune', 5)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Hobbit', 7)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Eragon', 1)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'A Wise Mans Fear', 6)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Harry Potter and the Philosophers Stone', 3)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Hard Boiled Wonderland and The End of the World', 13)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Giving Tree', 9)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Hitchhikers Guide to the Galaxy', 10)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Brave New World', 4)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Princess Bride', 8)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Fight Club', 16)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Holes', 12)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Harry Potter and the Chamber of Secrets', 3)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'Harry Potter and the Prisoner of Azkaban', 3)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Fellowship of the Ring', 7)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'A Game of Thrones', 2)
INSERT [dbo].[tbl_book] ([book_Title], [book_PublisherID]) VALUES (N'The Lost Tribe', 11)
GO

INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (1, N'Patrick Rothfuss')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (2, N'Stephen King')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (3, N'Stephen King')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (4, N'Frank Herbert')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (5, N'J.R.R. Tolkien')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (6, N'Christopher Paolini')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (6, N'Patrick Rothfuss')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (8, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (9, N'Haruki Murakami')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (10, N'Shel Silverstein')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (11, N'Douglas Adams')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (12, N'Aldous Huxley')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (13, N'William Goldman')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (14, N'Chuck Palahniuk')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (15, N'Louis Sachar')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (16, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (17, N'J.K. Rowling')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (18, N'J.R.R. Tolkien')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (19, N'George R.R. Martin')
INSERT [dbo].[tbl_book_authors] ([book_authors_BookID], [book_authors_AuthorName]) VALUES (20, N'Mark Lee')
GO

INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (1, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (2, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (3, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (4, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (5, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (6, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (7, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (8, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (9, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (10, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (11, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (12, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (13, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (14, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (15, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (16, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (17, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (18, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (19, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (20, 1, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (1, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (2, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (3, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (4, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (5, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (6, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (7, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (8, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (9, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (10, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (11, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (12, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (13, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (14, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (15, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (16, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (17, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (18, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (19, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (20, 2, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (1, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (2, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (3, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (4, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (5, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (6, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (7, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (8, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (9, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (10, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (11, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (12, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (13, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (14, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (15, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (16, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (17, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (18, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (19, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (20, 3, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (1, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (2, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (3, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (4, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (5, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (6, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (7, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (8, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (9, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (10, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (11, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (12, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (13, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (14, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (15, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (16, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (17, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (18, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (19, 4, 5)
INSERT [dbo].[tbl_book_copies] ([book_copies_BookID], [book_copies_BranchID], [book_copies_No_Of_Copies]) VALUES (20, 4, 5)
GO

INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (1, 1, 100, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (2, 1, 100, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (3, 1, 100, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (4, 1, 100, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (5, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (6, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (7, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (8, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (9, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (11, 1, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (12, 2, 105, N'2021-10-12', N'2021-11-12', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (10, 2, 105, N'2021-10-12', N'2021-11-12', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (20, 2, 105, N'2022-02-03', N'2022-03-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (18, 2, 105, N'2021-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (19, 2, 105, N'2021-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (19, 2, 100, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (11, 2, 106, N'2022-01-06', N'2022-03-06', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (1, 2, 106, N'2022-01-06', N'2022-03-06', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (2, 2, 100, N'2022-01-06', N'2022-03-06', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (3, 2, 100, N'2022-01-06', N'2022-03-06', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (5, 2, 105, N'2022-01-02', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (4, 3, 103, N'2022-01-09', N'2022-02-09', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (7, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (17, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (16, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (15, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (15, 3, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (14, 3, 104, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (13, 3, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (13, 3, 102, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (19, 3, 102, N'2022-01-12', N'2022-03-12', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (20, 4, 103, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (1, 4, 102, N'2022-01-12', N'2022-02-12', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (3, 4, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (18, 4, 107, N'2022-01-03', N'2022-02-03', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (12, 4, 102, N'2022-01-04', N'2022-02-04', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (11, 4, 103, N'2022-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (9, 4, 103, N'2022-01-05', N'2022-02-05', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (7, 4, 107, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (4, 4, 103, N'2022-01-01', N'2022-02-02', N'Done')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (1, 4, 103, N'2022-02-06', N'2022-03-06', N'In Progress')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (20, 4, 103, N'2022-03-06', N'2022-04-06', N'In Progress')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (1, 4, 102, N'2022-03-06', N'2022-04-06', N'In Progress')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (4, 4, 103, N'2022-03-06', N'2022-04-06', N'In Progress')
INSERT [dbo].[tbl_book_loans] ([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo], [book_loans_DateOut], [book_loans_DueDate], [book_loans_Status]) VALUES (5, 3, 101, N'2022-03-06', N'2022-04-06', N'In Progress')
GO
SET IDENTITY_INSERT [dbo].[tbl_borrower] ON 

INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (100, N'Joe Smith', N'1321 4th Street, New York, NY 10014', N'212-312-1234')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (101, N'Jane Smith', N'1321 4th Street, New York, NY 10014', N'212-931-4124')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (102, N'Tom Li', N'981 Main Street, Ann Arbor, MI 48104', N'734-902-7455')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (103, N'Angela Thompson', N'2212 Green Avenue, Ann Arbor, MI 48104', N'313-591-2122')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (104, N'Harry Emnace', N'121 Park Drive, Ann Arbor, MI 48104', N'412-512-5522')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (105, N'Tom Haverford', N'23 75th Street, New York, NY 10014', N'212-631-3418')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (106, N'Haley Jackson', N'231 52nd Avenue New York, NY 10014', N'212-419-9935')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (107, N'Michael Horford', N'653 Glen Avenue, Ann Arbor, MI 48104', N'734-998-1513')
INSERT [dbo].[tbl_borrower] ([borrower_CardNo], [borrower_BorrowerName], [borrower_BorrowerAddress], [borrower_BorrowerPhone]) VALUES (108, N'Phan Thanh Tung', N'Hanoi, Vietnam', N'0123-456-789')
SET IDENTITY_INSERT [dbo].[tbl_borrower] OFF
GO

INSERT [dbo].[tbl_library_branch] ([library_branch_BranchName], [library_branch_BranchAddress]) VALUES (N'Sharpstown', N'32 Corner Road, New York, NY 10012')
INSERT [dbo].[tbl_library_branch] ([library_branch_BranchName], [library_branch_BranchAddress]) VALUES (N'Central', N'491 3rd Street, New York, NY 10014')
INSERT [dbo].[tbl_library_branch] ([library_branch_BranchName], [library_branch_BranchAddress]) VALUES (N'Saline', N'40 State Street, Saline, MI 48176')
INSERT [dbo].[tbl_library_branch] ([library_branch_BranchName], [library_branch_BranchAddress]) VALUES (N'Ann Arbor', N'101 South University, Ann Arbor, MI 48104')
GO

INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Alfred A. Knopf', N'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019', N'212-940-7390')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Bantam', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Bloomsbury', N'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', N'212-419-5300')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Chalto & Windus', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Chilton Books', N'Not Available', N'Not Available')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'DAW Books', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'George Allen & Unwin', N'83 Alexander Ln, Crows Nest NSW 2065, Australia', N'+61-2-8425-0100')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Harcourt Brace Jovanovich', N'3 Park Ave, New York, NY 10016', N'212-420-5800')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Harper and Row', N'HarperCollins Publishers, 195 Broadway, New York, NY 10007', N'212-207-7000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Pan Books', N'175 Fifth Avenue, New York, NY 10010', N'646-307-5745')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Picador USA', N'175 Fifth Avenue, New York, NY 10010', N'646-307-5745')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Scholastic', N'557 Broadway, New York, NY 10012', N'800-724-6527')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Shinchosa', N'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan', N'+81-3-5577-6507')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Signet Books', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'Viking', N'375 Hudson Street, New York, NY 10014', N'212-366-2000')
INSERT [dbo].[tbl_publisher] ([publisher_PublisherName], [publisher_PublisherAddress], [publisher_PublisherPhone]) VALUES (N'W.W. Norton', N' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110', N'212-354-5500')
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
/****** Object:  StoredProcedure [dbo].[sp]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDURE TEMPLATE -- 
-- <>
CREATE PROCEDURE [dbo].[sp] (@id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_BranchID] = @id)
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
/****** Object:  StoredProcedure [dbo].[spAvailBookCopies_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
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
		GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
END
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_Get]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAvailBookCopiesByBranch_Get] (@branch_id int, @book_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_BranchID] = @branch_id AND l.[book_loans_BookID] = @book_id)
		BEGIN
			SET NOCOUNT ON;

			SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
				FROM db_LibraryManagement.dbo.tbl_book_copies bc
				JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
				WHERE bc.[book_copies_BranchID] = @branch_id AND l.[book_loans_BookID] = @book_id
				GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
		END
	ELSE
		BEGIN
			DECLARE @IN1 VARCHAR(500), @IN2 VARCHAR(500)
				SET @IN1 = 'There is no branch with the id = '
				SET @IN2 = ' and no book with the id = '
				PRINT @IN1 + CONVERT(varchar,@branch_id,100) + @IN2 + CONVERT(varchar,@book_id,100)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spAvailBookCopiesByBranch_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAvailBookCopiesByBranch_GetAll] (@branch_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_BranchID] = @branch_id)
		BEGIN
			SET NOCOUNT ON;

			SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
				FROM db_LibraryManagement.dbo.tbl_book_copies bc
				JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
				WHERE bc.[book_copies_BranchID] = @branch_id
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
/****** Object:  StoredProcedure [dbo].[spBook_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spBookAuthors_Search]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookAuthors_Search] (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.[book_authors_AuthorName] 'author_name', b.[book_Title] 'book_name', p.[publisher_PublisherName] 'publisher_name'
		FROM db_LibraryManagement.dbo.tbl_book_authors a
		JOIN db_LibraryManagement.dbo.tbl_book b ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
		WHERE a.[book_authors_AuthorName] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_GetAll]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT b.[book_Title] 'book_name', brw.[borrower_BorrowerName] 'customer_name', brw.[borrower_BorrowerPhone] 'customer_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', br.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
		JOIN db_LibraryManagement.dbo.tbl_library_branch br ON br.[library_branch_BranchID] = l.[book_loans_BranchID]
		JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
		ORDER BY b.[book_BookID]
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Insert]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_Insert] (@book_id int, @branch_id int, @customer_id int, @due_date date)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_borrower br WHERE br.[borrower_CardNo] = @customer_id)
		BEGIN
			SET NOCOUNT ON;

			INSERT INTO db_LibraryManagement.dbo.tbl_book_loans 
				([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo],[book_loans_DateOut],[book_loans_DueDate],[book_loans_Status])
				VALUES (@book_id,@branch_id,@customer_id,CONVERT(varchar,CURRENT_TIMESTAMP,101),CONVERT(varchar,@due_date,101),'In Progress')

			SELECT TOP 1 l.[book_loans_LoansID] 'loan_id',b.[book_Title] 'book_name',l.[book_loans_BranchID] 'branch_id',l.[book_loans_CardNo] 'customer_id',l.[book_loans_DateOut] 'loan_date',l.[book_loans_DueDate] 'due_date'
				FROM db_LibraryManagement.dbo.tbl_book_loans l
				JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
				ORDER BY l.[book_loans_LoansID] DESC
		END
	ELSE
		BEGIN
			DECLARE @IN VARCHAR(500)
				SET @IN = 'There is no customer with the id = '
				PRINT @IN + CONVERT(varchar,@customer_id,100)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookLoans_Return]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookLoans_Return] (@loan_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_LoansID] = @loan_id)
		BEGIN
			SET NOCOUNT ON;

			UPDATE db_LibraryManagement.dbo.tbl_book_loans
				SET [book_loans_Status] = 'Done'
				WHERE [book_loans_LoansID] = @loan_id

			SELECT TOP 1 l.[book_loans_LoansID] 'loan_id',b.[book_Title] 'book_name',l.[book_loans_BranchID] 'branch_id',l.[book_loans_CardNo] 'customer_id',l.[book_loans_DateOut] 'loan_date',l.[book_loans_DueDate] 'due_date'
				FROM db_LibraryManagement.dbo.tbl_book_loans l
				JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
				WHERE l.[book_loans_LoansID] = @loan_id
				ORDER BY l.[book_loans_LoansID] DESC
		END
	ELSE
		BEGIN
			PRINT 'Return function failed! Please try again!'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookOnLoans_Get]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookOnLoans_Get] (@customer_id int, @book_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book b WHERE b.[book_BookID] = @book_id)
		AND EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_borrower br WHERE br.[borrower_CardNo] = @customer_id)
		BEGIN
			SET NOCOUNT ON;
						
			SELECT l.[book_loans_LoansID] 'loan_id', l.[book_loans_BookID] 'book_id', b.[book_Title] 'book_name', p.[publisher_PublisherName] 'publisher_name'
				FROM db_LibraryManagement.dbo.tbl_book_loans l
				JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
				JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
				WHERE l.[book_loans_BookID] = @book_id AND l.[book_loans_CardNo] = @customer_id AND l.[book_loans_Status] = 'In Progress'
				GROUP BY l.[book_loans_BookID], b.[book_Title], p.[publisher_PublisherName], l.[book_loans_LoansID]
				ORDER BY l.[book_loans_LoansID] DESC
		END
	ELSE
		BEGIN
			DECLARE @IN VARCHAR(500)
				SET @IN = 'There is no book with the id = '
				PRINT @IN + CONVERT(varchar,@book_id,100)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spBookPublishers_Search]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookPublishers_Search] (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.[publisher_PublisherName] 'publisher_name', p.[publisher_PublisherAddress] 'publisher_address', p.[publisher_PublisherPhone] 'publisher_contact_number', b.[book_Title] 'book_name'
		FROM db_LibraryManagement.dbo.tbl_publisher p
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_PublisherID] = p.[publisher_PublisherID]
		WHERE p.[publisher_PublisherName] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBooks_Search]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBooks_Search] (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT b.[book_BookID] 'book_id', b.[book_Title] 'book_name', p.[publisher_PublisherName] 'publisher_name', a.[book_authors_AuthorName] 'author_name'
		FROM db_LibraryManagement.dbo.tbl_book b
		JOIN db_LibraryManagement.dbo.tbl_book_authors a ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
		WHERE b.[book_Title] LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spBooksLoanedOut_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCopiesAtAllBranches_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spCopiesFromSharpstown_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCopiesFromSharpstown_GetAll] 
(@bookTitle varchar(70) = 'The Lost Tribe', @branchName varchar(70) = 'Sharpstown')
AS
SELECT copies.book_copies_BranchID AS [Branch ID], branch.library_branch_BranchName AS [Branch Name],
	   copies.book_copies_No_Of_Copies AS [Number of Copies],
	   book.book_Title AS [Book Title]
	   FROM db_LibraryManagement.dbo.tbl_book_copies AS copies
			INNER JOIN db_LibraryManagement.dbo.tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID
	   WHERE book.book_Title = @bookTitle AND branch.library_branch_BranchName = @branchName
GO
/****** Object:  StoredProcedure [dbo].[spCustomer_Insert]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustomer_Insert](@customer_name varchar(200), @customer_address varchar(100), @customer_contact_number varchar(50))
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO db_LibraryManagement.dbo.tbl_borrower 
		([borrower_BorrowerName],[borrower_BorrowerAddress], [borrower_BorrowerPhone])
		VALUES (@customer_name,@customer_address,@customer_contact_number)

	SELECT br.[borrower_CardNo] 'customer_id', br.[borrower_BorrowerName] 'customer_name', br.[borrower_BorrowerAddress] 'customer_address', br.[borrower_BorrowerPhone] 'customer_contact_number'
		FROM db_LibraryManagement.dbo.tbl_borrower br
		ORDER BY 'customer_id' DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spCustomerOnLoans_Get]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCustomerOnLoans_Get] (@customer_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_borrower b WHERE b.[borrower_CardNo] = @customer_id)
		BEGIN
			SET NOCOUNT ON;

			SELECT l.[book_loans_BranchID] 'branch_id', l.[book_loans_CardNo] 'customer_card_number', l.[book_loans_BookID] 'book_id', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', l.[book_loans_Status] 'loan_status'
				FROM db_LibraryManagement.dbo.tbl_book_loans l
				WHERE l.[book_loans_CardNo] = @customer_id AND l.[book_loans_Status] = 'In Progress'
				ORDER BY l.[book_loans_BranchID], l.[book_loans_DateOut], l.[book_loans_DueDate]
		END
	ELSE
		BEGIN
			DECLARE @IN VARCHAR(500)
				SET @IN = 'There is no customer with the id = '
				PRINT @IN + CONVERT(varchar,@customer_id,100)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spLoanersInfo_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spLoanersInfo_GetAll]
(@DueDate date = NULL, @LibraryBranchName varchar(50) = 'Sharpstown')
AS
SET @DueDate = GETDATE()
SELECT Branch.library_branch_BranchName AS [Branch Name],  Book.book_Title [Book Name],
	   Borrower.borrower_BorrowerName AS [Borrower Name], Borrower.borrower_BorrowerAddress AS [Borrower Address],
	   Loans.book_loans_DateOut AS [Date Out], Loans.book_loans_DueDate [Due Date]
	   FROM db_LibraryManagement.dbo.tbl_book_loans AS Loans
			INNER JOIN db_LibraryManagement.dbo.tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
			INNER JOIN db_LibraryManagement.dbo.tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
			INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
		WHERE Loans.book_loans_DueDate = @DueDate AND Branch.library_branch_BranchName = @LibraryBranchName
GO
/****** Object:  StoredProcedure [dbo].[spNoLoans_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spNoLoans_GetAll]
AS
SELECT borrower_BorrowerName FROM tbl_borrower
	WHERE NOT EXISTS
		(SELECT * FROM db_LibraryManagement.dbo.tbl_book_loans
		WHERE book_loans_CardNo = borrower_CardNo)
GO
/****** Object:  StoredProcedure [dbo].[spTotalBookCopies_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spTotalBookCopiesByBranch_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTotalBookCopiesByBranch_GetAll] (@branch_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_BranchID] = @branch_id)
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
/****** Object:  StoredProcedure [dbo].[spTotalLoansPerBranch_GetAll]    Script Date: 6/21/2022 1:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spTotalLoansPerBranch_GetAll]
AS
SELECT  Branch.library_branch_BranchName AS [Branch Name], COUNT (Loans.book_loans_BranchID) AS [Total Loans]
		FROM db_LibraryManagement.dbo.tbl_book_loans AS Loans
			INNER JOIN db_LibraryManagement.dbo.tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
			GROUP BY library_branch_BranchName
GO
USE [master]
GO
ALTER DATABASE [db_LibraryManagement] SET  READ_WRITE 
GO
