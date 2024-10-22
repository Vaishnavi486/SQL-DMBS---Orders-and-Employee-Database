--1 Within the PRODUCT schema, show all records from the Product.Category table. 
SELECT * FROM Category;

--2 Within the ORDERS schema, show all data from the CustomerOrder and ShipmentMethod tables: 
-- Only show records where there are row matches between the PK and FK fields. 
--The join of equality (“equijoin”) must be listed in the WHERE statement. 

SELECT * FROM PROJECT1.dbo.CustomerOrder co
JOIN 
PROJECT1.dbo.ShipmentMethod sm 
ON co.ShipmentMethodID= sm.ShipmentMethodID
WHERE co.ShipmentMethodID= sm.ShipmentMethodID;

--3 Within the Orders schema, without using a WHERE statement, write a single SQL statement that shows the following data: 
-- From the CustomerOrder table, show the OrderID and TotalPaid. 
-- From the ShipmentMethod table, show the shipment mode. 
-- Hint, you’ll need to make use of the ‘ON’ command.  
SELECT co.OrderID, co.TotalPaid, sm.ShipmentMode
FROM PROJECT1.dbo.CustomerOrder co
JOIN 
PROJECT1.dbo.ShipmentMethod sm
ON co.ShipmentMethodID = sm.ShipmentMethodID;

--4 Within the Orders schema, display all orders from the CustomerOrder table that have a total amount paid that is less than $1,000 Canadian dollars. 
-- Display all the fields from the CustomerOrder table in your output.  
SELECT *
FROM PROJECT1.dbo.CustomerOrder
WHERE TotalPaid < 1000;

--SELECT * FROM CustomerOrder;
--UPDATE CustomerOrder
--SET TotalPaid =500.00
--WHERE OrderID=4000303;

--5  Within the Orders schema, display shipment method records where Estimated date shipped is the same as the actual date shipped. 
SELECT sm.* FROM PROJECT1.dbo.ShipmentMethod sm 
JOIN
PROJECT1.dbo.CustomerOrder co
ON sm.ShipmentMethodID = co.ShipmentMethodID
WHERE co.EstDateShipped = co.ActualDateShipped;


--UPDATE CustomerOrder
--SET ActualDateShipped= EstDateShipped 
--WHERE EstDateShipped = '2023-09-23' OR EstDateShipped = '2023-09-02' OR EstDateShipped = '2023-09-04';


--6 Within the Orders schema, list the OrderID for all orders that have an order status of either in transit, or delayed.
SELECT co.OrderID AS [ASKED OrderID] FROM PROJECT1.dbo.CustomerOrder co 
JOIN
PROJECT1.dbo.OrderStatus os 
ON co.OrderStatusID = os.OrderStatusID
WHERE os.Description = 'In transit' OR os.Description = 'Delayed';

--SELECT * FROM OrderStatus;

--7 Within the PRODUCT schema, list the description for all products that have a product review rating of 4 or higher. 
SELECT p.Description FROM PROJECT1.dbo.Product p
JOIN
PROJECT1.dbo.Review r
ON p.ProductID = r.ProductID
WHERE r.Rating >= 4;

--8 Within the Orders schema, list the total number of orders grouped by the different types of shipment modes.
SELECT sm.ShipmentMode AS [Shipment Mode] ,COUNT(co.OrderID) AS [Total number of orders] FROM PROJECT1.dbo.CustomerOrder co 
JOIN
PROJECT1.dbo.ShipmentMethod sm 
ON co.ShipmentMethodID = sm.ShipmentMethodID
GROUP BY(sm.ShipmentMode);

--9 Within the PRODUCT and Orders schema, list all product details for products that are not included on any order.
SELECT p.* FROM PROJECT1.dbo.Product p 
WHERE p.ProductID IN
(
SELECT p.ProductID FROM PROJECT1.dbo.Product p 
EXCEPT 
SELECT ps.ProductID FROM PROJECT1.dbo.ProductSelection ps 
)

--DELETE FROM PROJECT1.dbo.ProductSelection WHERE ProductID = 300310;
--SELECT * FROM PROJECT1.dbo.ProductSelection ps

--10 Within the Orders schema, Display OrderID and CustomerID for any orders that have an actual shipping date that occurred in the month of September. 
SELECT OrderID, CustomerID FROM PROJECT1.dbo.CustomerOrder co where MONTH(co.ActualDateShipped) = 9;

--11 Within the Orders schema, Display OrderID and CustomerID for any orders that have an estimated shipping date that occurred before the year of 2022.
SELECT OrderID, CustomerID
FROM PROJECT1.dbo.CustomerOrder co
WHERE YEAR(co.EstDateShipped) < 2022;


--WHERE EstDateShipped = '2023-09-23' OR EstDateShipped = '2023-09-02' OR EstDateShipped = '2023-09-04';

--12 Within the Orders schema, Display OrderID and CustomerID for any orders that have an actual shipping date that occurred in the month of October but did not occur in the Year of 2023. 
SELECT OrderID, CustomerID
FROM PROJECT1.dbo.CustomerOrder co
WHERE MONTH(co.ActualDateShipped) = 10 AND YEAR(co.ActualDateShipped) <> 2023;


--13 Within the PRODUCT schema, list the item with the greatest (highest) price. 
SELECT TOP 1 *
FROM PROJECT1.dbo.Product
ORDER BY Price DESC;

--14 Within the Orders schema, using only the ProductSelection table, display the three Orders that have the greatest (highest) prices, grouped by OrderID. 

SELECT TOP(3) ps.OrderID, MAX(ps.UnitPriceSold) AS [Total Price]
FROM PROJECT1.dbo.ProductSelection ps 
GROUP BY ps.OrderID
ORDER BY [Total Price] DESC; -- ASEC ORDER SORTED BY PK


--15 Within the Orders schema, count the total number of products that have been purchased on all orders - Do not group orders.
SELECT DISTINCT(COUNT(ps.ProductID)) AS [Total Products Purchased]
FROM PROJECT1.dbo.ProductSelection ps;

--16 Within the Orders schema, count the number of orders placed by each customer. 
-- The number of items per order is irrelevant. 
-- Do not use a JOIN or subquery. 
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM PROJECT1.dbo.CustomerOrder
GROUP BY CustomerID;

--SELECT * FROM CustomerOrder;

--17 Within the PRODUCT schema, show the product information for any product that has a review rating between 3 and 5 with a product category name of either Perishable or Miscellaneous. 
-- You must utilize one, or more, subqueries for your response. 
-- You cannot use a JOIN anywhere within your query. 
SELECT p.*
FROM PROJECT1.dbo.Product p
WHERE p.ProductID IN (
    SELECT r.ProductID
    FROM PROJECT1.dbo.Review r
    WHERE r.Rating BETWEEN 3 AND 5
)
AND 
p.ProductCategoryID IN (
    SELECT c.ProductCategoryID
    FROM PROJECT1.dbo.Category c
    WHERE CategoryName IN ('Perishable', 'Miscellaneous')
);

--SELECT * FROM Review;
--SELECT * FROM Category;


--18 Within the PRODUCT and Orders schema, show orders that include any products that were packaged in a gift box. 
-- You must utilize one, or more, subqueries for your response. 
-- You cannot use a JOIN anywhere within your query. 
SELECT *
FROM PROJECT1.dbo.CustomerOrder
WHERE OrderID IN (
    SELECT DISTINCT OrderID
    FROM PROJECT1.dbo.ProductSelection
    WHERE ProductID IN (
        SELECT ProductID
        FROM PROJECT1.dbo.Product
        WHERE Package = 'Gift Box'
    )
);

--INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) 
--VALUES (3003011, N'Item17', 1022, N'Gift Box', 500, N'Gram', CAST(141.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-02-22' AS Date))

--INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) 
--VALUES (3003011, 4000307, CAST(672.00 AS Numeric(5, 2)), CAST(N'2023-07-31' AS Date))

--INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) 
--VALUES (3003012, N'Item21', 1022, N'Gift Box', 5, N'Kilogram', CAST(451.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-03-18' AS Date))

--INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) 
--VALUES (3003012, 4000303, CAST(942.00 AS Numeric(5, 2)), CAST(N'2024-01-17' AS Date))

--SELECT * FROM PROJECT1.dbo.ProductSelection;
--SELECT * FROM PROJECT1.dbo.Product;
--UPDATE Product
--SET Package ='Gift Box'
--WHERE Package='Gift bag';

--19 Within the ORDERS and PRODUCT schema, show any order [OrderID] and Customer [CustomerID] where there is a single item which has a weight greater than 1 kilogram. 
-- Evaluate the weight of each item independently, not the combined weight. 
-- Consider all possibilities. 
SELECT ps.ProductID,co.OrderID, co.CustomerID FROM PROJECT1.dbo.CustomerOrder co 
JOIN 
PROJECT1.dbo.ProductSelection ps
ON co.OrderID = ps.OrderID
WHERE ps.ProductID = (SELECT p.ProductID FROM Product p WHERE WeightUnits ='Kilogram' OR ( WeightUnits ='Gram' AND WeightQty > 1000));


--OR
SELECT co.OrderID, co.CustomerID
FROM PROJECT1.dbo.CustomerOrder co
WHERE co.OrderID IN (
    SELECT DISTINCT OrderID
    FROM PROJECT1.dbo.ProductSelection
    WHERE ProductID IN (
        SELECT ProductID
        FROM PROJECT1.dbo.Product
        WHERE WeightUnits ='Kilogram' OR ( WeightUnits ='Gram' AND WeightQty > 1000)
    )
    GROUP BY OrderID
    HAVING COUNT(DISTINCT ProductID) = 1
);

--SELECT * FROM ProductSelection WHERE OrderID= 4000300 OR OrderID= 4000302;
--select * from Product;

--20 Within the ORDERS and PRODUCT schemas, for each Customer Order, display the OrderID, CustomerID,ProductID and the Description for each of the products.ss
SELECT ps.OrderID, r.CustomerID, ps.ProductID, p.Description
FROM PROJECT1.dbo.Product p 
INNER JOIN PROJECT1.dbo.Review r ON r.ProductID = p.ProductID
INNER JOIN PROJECT1.dbo.ProductSelection ps ON ps.ProductID = p.ProductID;
