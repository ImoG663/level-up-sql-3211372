-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT
Books.BookID,
Books.Title,
Books.Barcode,
Books.Published
FROM Books
JOIN Loans
  ON Books.BookID = Loans.BookID
WHERE Published <1900 AND Published >1889
  AND ReturnedDate IS NOT NULL;

--The solutions page for this challenge used a
--more concise method but this also acheived 
--the desired result
--Could have included ORDER BY Title
--That solution also used NOT IN rather than 
--IS NOT NULL