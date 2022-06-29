-- PROCEDURE TEMPLATE -- 
-- <>
CREATE PROCEDURE dbo.sp (@id int)
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

	SELECT b.[book_Title] 'book_title', brw.[borrower_BorrowerName] 'customer_name', brw.[borrower_BorrowerPhone] 'customer_contact_number', l.[book_loans_DateOut] 'loan_date', l.[book_loans_DueDate] 'due_date', br.[library_branch_BranchName] 'branch_name'
		FROM db_LibraryManagement.dbo.tbl_book_loans l
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_BookID] = l.[book_loans_BookID]
		JOIN db_LibraryManagement.dbo.tbl_library_branch br ON br.[library_branch_BranchID] = l.[book_loans_BranchID]
		JOIN db_LibraryManagement.dbo.tbl_borrower brw ON brw.[borrower_CardNo] = l.[book_loans_CardNo]
		ORDER BY b.[book_BookID]
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
CREATE PROCEDURE dbo.spTotalBookCopiesByBranch_GetAll (@branch_id int)
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
-- EXEC db_LibraryManagement.dbo.spTotalBookCopiesByBranch_GetAll 10

-- GET AVAILABLE BOOKS IN ALL BRANCHES
ALTER PROCEDURE dbo.spAvailBookCopies_GetAll
AS
BEGIN
	SET NOCOUNT ON;

	SELECT bc.[book_copies_BranchID] 'branch_id', bc.[book_copies_BookID] 'book_id', bc.[book_copies_No_Of_Copies] - COUNT(l.[book_loans_BookID]) 'available_count', bc.[book_copies_No_Of_Copies] 'total_count'
		FROM db_LibraryManagement.dbo.tbl_book_copies bc
		JOIN db_LibraryManagement.dbo.tbl_book_loans l ON l.[book_loans_BranchID] = bc.[book_copies_BranchID] AND l.[book_loans_BookID] = bc.[book_copies_BookID]
		GROUP BY bc.[book_copies_BranchID], bc.[book_copies_BookID], bc.[book_copies_No_Of_Copies], l.[book_loans_BookID]
END
GO
-- EXEC db_LibraryManagement.dbo.spAvailBookCopies_GetAll

-- GET AVAILABLE BOOKS IN BRANCH
CREATE PROCEDURE dbo.spAvailBookCopiesByBranch_GetAll (@branch_id int)
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
-- EXEC db_LibraryManagement.dbo.spAvailBookCopiesByBranch_GetAll 3

-- GET AVAILABLE BOOK IN BRANCH
CREATE PROCEDURE dbo.spAvailBookCopiesByBranch_Get (@branch_id int, @book_id int)
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
-- EXEC db_LibraryManagement.dbo.spAvailBookCopiesByBranch_Get 3,8

-- SEARCH FUNCTION --
-- SEARCH FOR BOOKS
ALTER PROCEDURE dbo.spBooks_Search (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT b.[book_BookID] 'book_id', b.[book_Title] 'book_title', p.[publisher_PublisherName] 'publisher_name', a.[book_authors_AuthorName] 'author_name'
		FROM db_LibraryManagement.dbo.tbl_book b
		JOIN db_LibraryManagement.dbo.tbl_book_authors a ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
		WHERE b.[book_Title] LIKE '%' + @search_string + '%'
END
GO
-- EXEC db_LibraryManagement.dbo.spBooks_Search 'harry potter'

-- SEARCH FOR PUBLISHERS
ALTER PROCEDURE dbo.spBookPublishers_Search (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT p.[publisher_PublisherName] 'publisher_name', p.[publisher_PublisherAddress] 'publisher_address', p.[publisher_PublisherPhone] 'publisher_contact_number', b.[book_Title] 'book_title'
		FROM db_LibraryManagement.dbo.tbl_publisher p
		JOIN db_LibraryManagement.dbo.tbl_book b ON b.[book_PublisherID] = p.[publisher_PublisherID]
		WHERE p.[publisher_PublisherName] LIKE '%' + @search_string + '%'
END
GO
-- EXEC db_LibraryManagement.dbo.spBookPublishers_Search ''

-- SEARCH FOR AUTHORS
ALTER PROCEDURE dbo.spBookAuthors_Search (@search_string varchar)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.[book_authors_AuthorName] 'author_name', b.[book_Title] 'book_title', p.[publisher_PublisherName] 'publisher_name'
		FROM db_LibraryManagement.dbo.tbl_book_authors a
		JOIN db_LibraryManagement.dbo.tbl_book b ON a.[book_authors_BookID] = b.[book_BookID]
		JOIN db_LibraryManagement.dbo.tbl_publisher p ON p.[publisher_PublisherID] = b.[book_PublisherID]
		WHERE a.[book_authors_AuthorName] LIKE '%' + @search_string + '%'
END
GO
-- EXEC db_LibraryManagement.dbo.spBookAuthors_Search ''

-- MAIN FUNCTIONS --
-- CHECK FOR BOOKS ON LOANS by ID
ALTER PROCEDURE dbo.spBookOnLoans_Get (@customer_id int, @book_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book b WHERE b.[book_BookID] = @book_id)
		AND EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_borrower br WHERE br.[borrower_CardNo] = @customer_id)
		BEGIN
			SET NOCOUNT ON;
						
			SELECT l.[book_loans_LoansID] 'loan_id', l.[book_loans_BookID] 'book_id', b.[book_Title] 'book_title', p.[publisher_PublisherName] 'publisher_name'
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
-- EXEC db_LibraryManagement.dbo.spBookOnLoans_Get 103, 1

-- CHECK FOR LOAN INFORMATION BY CUSTOMER
ALTER PROCEDURE dbo.spCustomerOnLoans_Get (@customer_id int)
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
-- EXEC db_LibraryManagement.dbo.spCustomerOnLoans_Get 103

-- CREATE NEW CUSTOMERS
CREATE PROCEDURE dbo.spCustomer_Insert(@customer_name varchar(200), @customer_address varchar(100), @customer_contact_number varchar(50))
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

-- CREATE BOOK LOAN FOR CUSTOMERS (insert into book_loans_Status='In Progress')
ALTER PROCEDURE dbo.spBookLoans_Insert (@book_id int, @branch_id int, @customer_id int, @due_date date)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_borrower br WHERE br.[borrower_CardNo] = @customer_id)
		BEGIN
			SET NOCOUNT ON;

			INSERT INTO db_LibraryManagement.dbo.tbl_book_loans 
				([book_loans_BookID], [book_loans_BranchID], [book_loans_CardNo],[book_loans_DateOut],[book_loans_DueDate],[book_loans_Status])
				VALUES (@book_id,@branch_id,@customer_id,CONVERT(varchar,CURRENT_TIMESTAMP,101),CONVERT(varchar,@due_date,101),'In Progress')

			SELECT TOP 1 l.[book_loans_LoansID] 'loan_id',b.[book_Title] 'book_title',l.[book_loans_BranchID] 'branch_id',l.[book_loans_CardNo] 'customer_id',l.[book_loans_DateOut] 'loan_date',l.[book_loans_DueDate] 'due_date'
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
-- EXEC db_LibraryManagement.dbo.spBookLoans_Insert 5,3,101,'06/25/2022'

-- RETURN BOOK LOANS FOR CUSTOMERS (book_loans_Status='Done')
--check for customer
--check for book_id
--update book_loans_Status = 'Done'

ALTER PROCEDURE dbo.spBookLoans_Return (@loan_id int)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM db_LibraryManagement.dbo.tbl_book_loans l WHERE l.[book_loans_LoansID] = @loan_id)
		BEGIN
			SET NOCOUNT ON;

			UPDATE db_LibraryManagement.dbo.tbl_book_loans
				SET [book_loans_Status] = 'Done'
				WHERE [book_loans_LoansID] = @loan_id

			SELECT TOP 1 l.[book_loans_LoansID] 'loan_id',b.[book_Title] 'book_title',l.[book_loans_BranchID] 'branch_id',l.[book_loans_CardNo] 'customer_id',l.[book_loans_DateOut] 'loan_date',l.[book_loans_DueDate] 'due_date'
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
--EXEC db_LibraryManagement.dbo.spBookLoans_Return 1,1
