-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

SELECT *
FROM Customers
WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Customers
('FirstName',
'LastName',
'Email',
'Phone')
VALUES 
('Sam',
'McAdam',
'smac@kinetecoinc.com',
'(555) 555-1232');

SELECT *
FROM Customers; 

UPDATE Customers
SET LastName = 'McAdams'
WHERE CustomerID = 102;

INSERT INTO Reservations
('CustomerID', 
'Date', 
'PartySize')
VALUES (102, 
'2022-08-12 18:00:00',
5);

SELECT *
FROM Reservations
ORDER BY Date DESC;

--Another way of checking that the reservation
--has been made is by using a join between the 
-- customers and reservations table on the 
--customerID, to check the name and email are correct