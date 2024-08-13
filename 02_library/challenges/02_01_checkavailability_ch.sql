-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.
SELECT BookID,
Title,
Barcode
FROM Books
WHERE Title LIKE 'Dracula'

--There are 3 copies of the book. 
--BookIDs are 12, 60, and 73

SELECT LoanID,
BookID,
LoanDate,
ReturnedDate
FROM Loans
WHERE BookID = 12 OR BookID = 60 OR BookID = 73
ORDER BY ReturnedDate ASC;

--There is one null value for the return date, 
--so there is one book still out on loan, leaving
--2 books available for patrons to borrow
--this was solved in a different way to the 
--provided solution. Check the other way too.