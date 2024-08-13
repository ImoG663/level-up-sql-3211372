-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022 (2 weeks later).

-- We want to add 2 rows to the loans table. 
-- we want to find out the bookID we want from the barcode
--This can all be done in 2 queries.

--To add Dorian Gray

INSERT INTO Loans
(BookID, PatronID, LoanDate, DueDate)
VALUES (
(SELECT BookID
  FROM Books
  WHERE Barcode = 2855934983),
(SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com'),
'2022-08-25',
'2022-09-08');

--The last bit of that code are the dates for checkout
--and due back. These ones didn't require a search

--Now for the second query for the second book
--Great Expectations. Only thing to change is 
--the book barcode.

INSERT INTO Loans
(BookID, PatronID, LoanDate, DueDate)
VALUES (
(SELECT BookID
  FROM Books
  WHERE Barcode = 4043822646),
(SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com'),
'2022-08-25',
'2022-09-08');


--Checking things have been entered correctly

SELECT *
FROM Patrons
WHERE Email = 'jvaan@wisdompets.com';

SELECT *
FROM Loans
WHERE ReturnedDate IS NULL 
AND PatronID = 50;

--This could be done in one more sophisticated query
-- see below
SELECT * 
FROM Loans
JOIN Books 
ON Loans.BookID = Books.BookID
WHERE PatronID = (
  SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com');

-- The two records with null returned date values
-- are the two which have just been added