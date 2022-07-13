use db_LibraryManagement;
-- PROCEDURE TEMPLATE -- 
-- <>
CREATE PROCEDURE dbo.sp
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
-- EXEC db_LibraryManagement.dbo.sp

-- GET RELATED INFORMATION --
-- GET ALL INFORMATION OF BOOKS
CREATE PROCEDURE dbo.spBook_GetAll
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
-- EXEC db_LibraryManagement.dbo.spBook_GetAll

-- GET ALL INFORMATION OF BOOKS ON LOANS
ALTER PROCEDURE dbo.spBookLoans_GetAll
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
-- EXEC db_LibraryManagement.dbo.spBookLoans_GetAll

-- GET TOTAL BOOKS IN ALL BRANCHES
ALTER PROCEDURE dbo.spTotalBookCopies_GetAll
AS
BEGIN
	SET NOCOUNT ON;

	SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] 'total_count'
	FROM db_LibraryManagement.dbo.tbl_book_copies bc
		JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
	GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies]
END
GO
-- EXEC db_LibraryManagement.dbo.spTotalBookCopies_GetAll

-- GET TOTAL BOOKS IN BRANCH
CREATE PROCEDURE dbo.spTotalBookCopiesByBranch_GetAll
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
-- EXEC db_LibraryManagement.dbo.spTotalBookCopiesByBranch_GetAll 1

-- GET AVAILABLE BOOKS IN ALL BRANCHES
ALTER PROCEDURE dbo.spAvailBookCopies_GetAll
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
-- EXEC db_LibraryManagement.dbo.spAvailBookCopies_GetAll

-- GET AVAILABLE BOOKS IN BRANCH
ALTER PROCEDURE dbo.spAvailBookCopiesByBranch_GetAll
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
-- EXEC db_LibraryManagement.dbo.spAvailBookCopiesByBranch_GetAll 4

-- GET AVAILABLE BOOK IN BRANCH
ALTER PROCEDURE dbo.spAvailBookCopiesByBranch_Get
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
-- EXEC db_LibraryManagement.dbo.spAvailBookCopiesByBranch_Get 3,8

-- SEARCH FUNCTION --
-- SEARCH FOR BOOKS
ALTER PROCEDURE dbo.spBooks_Search
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
-- EXEC db_LibraryManagement.dbo.spBooks_Search 'harry potter'

-- SEARCH FOR PUBLISHERS
ALTER PROCEDURE dbo.spBookPublishers_Search
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
-- EXEC db_LibraryManagement.dbo.spBookPublishers_Search ''

-- SEARCH FOR AUTHORS
ALTER PROCEDURE dbo.spBookAuthors_Search
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
-- EXEC db_LibraryManagement.dbo.spBookAuthors_Search ''

-- MAIN FUNCTIONS --
-- CHECK FOR BOOKS ON LOANS by ID
ALTER PROCEDURE dbo.spBookOnLoans_Get
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
-- EXEC db_LibraryManagement.dbo.spBookOnLoans_Get 103, 1

-- CHECK FOR LOAN INFORMATION BY BORROWER
ALTER PROCEDURE dbo.spBorrowerOnLoans_Get
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
-- EXEC db_LibraryManagement.dbo.spBorrowerOnLoans_Get 103

-- CREATE NEW BORROWER
ALTER PROCEDURE dbo.spBorrower_Insert(@borrower_name varchar(200),
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
-- EXEC db_LibraryManagement.dbo.spBorrower_Insert N'Hoàng Văn Việt','Hanoi, Vietnam','0913275388'

-- CREATE BOOK LOAN FOR BORROWER (insert into book_loans_Status='In Progress')
ALTER PROCEDURE dbo.spBookLoans_Insert
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
-- EXEC db_LibraryManagement.dbo.spBookLoans_Insert 7,4,101

-- RETURN BOOK LOANS FOR BORROWER (book_loans_Status='Done')
ALTER PROCEDURE dbo.spBookLoans_Return
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
--EXEC db_LibraryManagement.dbo.spBookLoans_Return 1,1

-- MANAGE USER ACCOUNTS
ALTER PROCEDURE dbo.spUsers_GetAll
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.userID, u.userFullname, u.userEmail, u.userRole, u.userToken
	FROM db_LibraryManagement.dbo.tbl_user u
	ORDER BY u.userRole DESC, u.userToken
END
GO
-- EXEC db_LibraryManagement.dbo.spUsers_GetAll

-- MANAGE USER ACCOUNT FROM EMAIL
ALTER PROCEDURE dbo.spUser_Get
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
-- EXEC db_LibraryManagement.dbo.spUser_Get 'admin'

-- CREATE NEW USER ACCOUNT
CREATE PROCEDURE dbo.spUser_Create
	(@userFullname varchar(200), @userEmail varchar(100), @userPassword varchar(60), @userRole int)
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
-- EXEC db_LibraryManagement.dbo.spUser_Create 'fullName', 'email', 'password', role(1/0)

-- CHECK USER PASSWORD FROM EMAIL
CREATE PROCEDURE dbo.spUserPwd_Get
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
-- EXEC db_LibraryManagement.dbo.spUserPwd_Get 'admi'

-- CREATE USER TOKEN AFTER LOG IN SUCCESSFULLY
ALTER PROCEDURE dbo.spUserToken_Insert
	(@userEmail varchar(100), @userToken varchar(200))
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
-- EXEC db_LibraryManagement.dbo.spUserToken_Insert 'admin', ''

-- CLEAR USER TOKEN AFTER LOG OUT SUCCESSFULLY
ALTER PROCEDURE dbo.spUserToken_Clear
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
-- EXEC db_LibraryManagement.dbo.spUserToken_Clear 'admin'