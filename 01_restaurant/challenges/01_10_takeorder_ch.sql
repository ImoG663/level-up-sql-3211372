-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

-- This is going to involve 4 separate tables
--This is what an order processing app does but
--this exercise shows what's going on behind the
--scenes

--Find customer
SELECT
CustomerID,
FirstName,
LastName,
Address
FROM Customers
WHERE FirstName = 'Loretta' AND LastName = 'Hundey';

--This is customer 70
--Create order record
INSERT INTO Orders (
'CustomerID', 'OrderDate')
VALUES (70, '2022-09-20 14:00:00');

SELECT *
FROM Orders 
ORDER BY OrderDate DESC;

--Add items to the order 1001
SELECT 
DishID,
Name
FROM Dishes
WHERE NAME = 'House Salad'
OR NAME = 'Mini Cheeseburgers'
OR NAME = 'Tropical Blue Smoothie';

-- DishIDs are 4, 7, and 20. 
--Could skip the previous query using the 
--following query.

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES 
(1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

SELECT OrderID, DishID
FROM OrdersDishes
WHERE OrderID = 1001;

-- A better way of checking would have been to do
-- a join to include the dish name as well as ID

--Next, find the price
SELECT SUM(Dishes.Price) AS OrderTotal
FROM Dishes
JOIN OrdersDishes 
ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;
