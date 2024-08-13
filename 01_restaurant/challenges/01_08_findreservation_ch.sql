-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant
--Reservations table doesn't hold personal info
-- So we need to join ni the Cusotmers table
-- There are four people in the party. Today is June 14th.

SELECT Customers.FirstName,
Customers.LastName,
Reservations.Date,
Reservations.PartySize
FROM Reservations
JOIN Customers
ON Customers.CustomerID = Reservations.CustomerID 
WHERE Customers.LastName LIKE 'Ste%' 
AND Reservations.PartySize = 4;

--As I didn't know the year I had mistakenly used 
-- "AND Reservations.Date = '14-06-2024'". This
--was wrong as we can see there is a date for 14th
--June but this is in 2022, and is written 
--2022-06-14 18:30:00
--Also useful to use "ORDER BY Reservations.Date DESC"