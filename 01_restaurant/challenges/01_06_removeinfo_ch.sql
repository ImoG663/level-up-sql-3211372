-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

--First finding out Norby's customer number
SELECT 
CustomerID,
FirstName,
LastName
FROM Customers
WHERE FirstName = 'Norby';
 
 -- Norby Sleight ID number = 64

SELECT 
CustomerID,
ReservationID,
Date,
PartySize
FROM Reservations
WHERE CustomerID = 64 AND Date > '2022-07-24';

--This tells us that the reservation is #2000
--Now to delete it

DELETE FROM Reservations
WHERE ReservationID = 2000;

--This was not the way that is written in the
--solution but it acheived the same result. 
--Another method may be required if we wanted 
--to blank out the reservation but keep it in
--the system e.g. for checking if a customer
--keeps cancelling
--e.g. the code below instead of delete
UPDATE Reservations SET Date= NULL 
WHERE ReservationID = 2000;
-- This way the reservation doesn't show up on 
--the daily list