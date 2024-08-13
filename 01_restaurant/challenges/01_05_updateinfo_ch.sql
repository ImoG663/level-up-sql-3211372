-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

--First I'm checking what the customerID is
-- for Taylor Jenkins
SELECT 
CustomerID,
FirstName,
LastName,
Address
FROM Customers
Where FirstName = 'Taylor' AND LastName = 'Jenkins';

-- This told me there were 2 Taylor Jenkins in
-- the database, but the one at 6th Avenue has 
-- the customerID number of 26.
--Next query is the actual update

UPDATE Customers
SET 
Address = '74 Pine St.',
City = 'New York',
State = 'NY'
WHERE CustomerID = 26;

--Then checking that this has been executed correctly
SELECT *
FROM Customers
WHERE CustomerID = 26