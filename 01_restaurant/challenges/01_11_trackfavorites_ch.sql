-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.
SELECT DishID,
Name
FROM Dishes
WHERE Name = 'Quinoa Salmon Salad';

--This is dish number 9
SELECT CustomerID,
FirstName,
LastName
FROM Customers
WHERE FirstName = 'Cleo' 
AND LastName = 'Goldwater';

--Cleo is customer 42
INSERT INTO CustomersDishes
(CustomerID, DishID)
VALUES (42, 9);

SELECT CustomersDishes.CustomerID,
Customers.FirstName,
Customers.LastName,
CustomersDishes.DishID
FROM CustomersDishes
JOIN Customers
ON Customers.CustomerID = CustomersDishes.CustomerID
WHERE Customers.CustomerID = 42;

--Update favourite dish
UPDATE Customers
SET FavoriteDish = 9
WHERE CustomerID = 42;

-- could also be done this way
UPDATE Customers
SET FavoriteDish = 
(SELECT DishID FROM Dishes WHERE Name = 
'Salmon Quinoa Salad')
WHERE CustomerID = 42;

--Similar response but slightly different join
SELECT Customers.FirstName,
Customers.LastName,
Customers.FavoriteDish
FROM Customers
JOIN Dishes 
ON Customers.FavoriteDish = Dishes.DishID;
