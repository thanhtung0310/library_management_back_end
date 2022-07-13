1. spBook_GetAll

- out: book_id, book_title, author_name, publisher_name

2. spBookLoans_GetAll

- out: loan_id, book_title, borrower_name, borrower_contact_number, loan_date, due_date, branch_name

3. spTotalBookCopies_GetAll

- out: branch_id, book_id, total_count

4. spTotalBookCopiesByBranch_GetAll

- in: @branch_id
- out: branch_id, book_id, total_count

5. spAvailBookCopies_GetAll

- out: branch_id, book_id, available_count, total_count

6. spAvailBookCopiesByBranch_GetAll

- in: @branch_id
- out: branch_id, book_id, available_count, total_count

7. spAvailBookCopiesByBranch_Get

- in: @branch_id, @book_id
- out: branch_id, book_id, available_count, total_count

8. spBooks_Search

- in: @search_string
- out: book_id, book_title, author_name, publisher_name

9. spBookPublishers_Search

- in: @search_string
- out: publisher_id, publisher_name, publisher_address, publisher_contact_number, book_title

10. spBookAuthors_Search

- in: @search_string
- out: author_id, author_name, book_title, publisher_name

11. spBookOnLoans_Get

- in: @borrower_id, @book_id
- out: loan_id, book_title, borrower_name, borrower_contact_number, loan_date, due_date, branch_name

12. spBorrowerOnLoans_Get

- in: @borrower_id
- out: loan_id, book_title, borrower_name, borrower_contact_number, loan_date, due_date, branch_name

13. spBorrower_Insert

- in: @borrower_name, @borrower_address, @borrower_contact_number
- out: borrower_id, borrower_name, borrower_address, borrower_contact_number

14. spBookLoans_Insert

- in: @book_id, @branch_id, @borrower_id
- out: loan_id, book_title, borrower_name, borrower_contact_number, loan_date, due_date, branch_name

15. spBookLoans_Return

- in: @loan_id
- out: loan_id, book_title, borrower_name, borrower_contact_number, loan_date, due_date, branch_name

16. spUsers_GetAll

- out: userID, userFullname, userEmail, userRole, userToken

17. spUser_Get

- in: @userEmail
- out: userID, userFullname, userEmail, userRole, userToken

18. spUser_Create

- in: @userFullname, @userEmail, @userPassword, @userRole
- out: userID, userFullname, userEmail, userRole, userToken

19. spUserPwd_Get

- in: @userEmail
- out: userPassword

20. spUserToken_Insert

- in: @userEmail, @userToken
- out: userID, userFullname, userEmail, userRole, userToken

21. spUserToken_Clear

- in: @userEmail
- out: userID, userFullname, userEmail, userRole, userToken
