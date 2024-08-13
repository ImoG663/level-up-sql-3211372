-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.
SELECT Email,CustomerID
FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com';

-- Now we know this is customerID 92
INSERT INTO AnniversaryAttendees 
('CustomerID', 'PartySize')
VALUES (92, 3);
 -- Now check the code
 SELECT *
 FROM AnniversaryAttendees

--The reservation was added twice- when running
--the query, its worth just selecting 'run selected
--query' as this avoids the issue I made.

UPDATE AnniversaryAttendees
SET PartySize = 4
WHERE CustomerID = 92;

SELECT *
FROM AnniversaryAttendees;
