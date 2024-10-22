INSERT [dbo].[Category] ([ProductCategoryID], [Categoryname], [Description], [DateModified]) VALUES (1021, N'Perishable', N'Description Perished', CAST(N'2023-07-11' AS Date))
INSERT [dbo].[Category] ([ProductCategoryID], [Categoryname], [Description], [DateModified]) VALUES (1022, N'Accessory', N'Desrip Accessory', CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Category] ([ProductCategoryID], [Categoryname], [Description], [DateModified]) VALUES (1023, N'Miscellaneous', N'Miscellaneous', CAST(N'2023-07-13' AS Date))
INSERT [dbo].[Category] ([ProductCategoryID], [Categoryname], [Description], [DateModified]) VALUES (1024, N'Machinery', N'Machinery', CAST(N'2023-08-14' AS Date))

--SELECT * FROM Category;

INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300301, N'item5', 1022, N'Tin', 123, N'Gram', CAST(122.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300302, N'item1', 1023, N' Paper bag', 200, N'Kilogram', CAST(200.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-02-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300303, N'item2', 1024, N'Foil bag', 100, N'Gram', CAST(125.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300304, N'item6', 1021, N'Tin', 123, N'Gram', CAST(122.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300305, N'item7', 1023, N'Gift Box', 140, N'Gram', CAST(120.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-02-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300306, N'Item8', 1024, N'Paper bag', 120, N'Gram', CAST(102.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-01-03' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300307, N'Item9', 1022, N'Foil bag', 123, N'Gram', CAST(122.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300308, N'Item10', 1021, N'Tin', 122, N'Gram', CAST(121.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300309, N'Item11', 1024, N'Foil bag', 123, N'Gram', CAST(126.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Product] ([ProductID], [Description], [ProductCategoryID], [Package], [WeightQty], [WeightUnits], [Price], [Dimensions], [DateModified]) VALUES (300310, N'Item12', 1022, N'Gift bag', 122, N'Gram', CAST(141.00 AS Numeric(8, 2)), N'cm', CAST(N'2023-12-12' AS Date))

--SELECT * FROM Product;

INSERT [dbo].[OrderStatus] ([OrderStatusID], [Description], [DateModified]) VALUES (20002300, N'Processing order', CAST(N'2023-03-14' AS Date))
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Description], [DateModified]) VALUES (30002300, N'Preparing to ship', CAST(N'2023-03-14' AS Date))
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Description], [DateModified]) VALUES (40002300, N'In transit', CAST(N'2023-03-14' AS Date))
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Description], [DateModified]) VALUES (10002300, N'Delayed', CAST(N'2023-03-14' AS Date))
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Description], [DateModified]) VALUES (50002300, N'Delivered', CAST(N'2023-03-14' AS Date))

--SELECT * FROM OrderStatus;
--DELETE FROM OrderStatus;

INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000300, 2000045, 10002300, 20002300, 20456300, 3403001, CAST(90000.00 AS Numeric(10, 2)), CAST(1230.00 AS Numeric(10, 2)), CAST(45000.00 AS Numeric(10, 2)), CAST(N'2023-08-12' AS Date), CAST(N'2012-10-23' AS Date), CAST(N'2012-10-23' AS Date), CAST(N'2023-09-12' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000301, 2000046, 10002301, 30002300, 20456301, 3403002, CAST(120000.00 AS Numeric(10, 2)), CAST(34000.00 AS Numeric(10, 2)), CAST(60000.00 AS Numeric(10, 2)), CAST(N'2023-08-09' AS Date), CAST(N'2023-09-23' AS Date), CAST(N'2023-09-01' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000302, 2000047, 10002302, 40002300, 20456302, 3403003, CAST(5000.00 AS Numeric(10, 2)), CAST(230.00 AS Numeric(10, 2)), CAST(4500.00 AS Numeric(10, 2)), CAST(N'2023-08-01' AS Date), CAST(N'2023-09-02' AS Date), CAST(N'2023-09-02' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000303, 2000048, 10002303, 10002300, 20456303, 3403004, CAST(50000.00 AS Numeric(10, 2)), CAST(12530.00 AS Numeric(10, 2)), CAST(35000.00 AS Numeric(10, 2)), CAST(N'2023-08-11' AS Date), CAST(N'2023-09-04' AS Date), CAST(N'2023-09-04' AS Date), CAST(N'2023-09-06' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000304, 2000049, 10002304, 50002300, 20456304, 3403005, CAST(235000.00 AS Numeric(10, 2)), CAST(56230.00 AS Numeric(10, 2)), CAST(144500.00 AS Numeric(10, 2)), CAST(N'2023-08-03' AS Date), CAST(N'2023-09-12' AS Date), CAST(N'2023-10-06' AS Date), CAST(N'2023-09-07' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000305, 2000050, 10002305, 30002300, 20456302, 3403006, CAST(25000.00 AS Numeric(10, 2)), CAST(9930.00 AS Numeric(10, 2)), CAST(14500.00 AS Numeric(10, 2)), CAST(N'2023-08-05' AS Date), CAST(N'2022-09-20' AS Date), CAST(N'2023-09-15' AS Date), CAST(N'2023-09-19' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000306, 2000051, 10002306, 40002300, 20456309, 3403007, CAST(5000.00 AS Numeric(10, 2)), CAST(230.00 AS Numeric(10, 2)), CAST(4500.00 AS Numeric(10, 2)), CAST(N'2023-08-01' AS Date), CAST(N'2023-09-02' AS Date), CAST(N'2023-09-02' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000307, 2000052, 10002307, 10002300, 20456305, 3403008, CAST(345000.00 AS Numeric(10, 2)), CAST(22530.00 AS Numeric(10, 2)), CAST(254500.00 AS Numeric(10, 2)), CAST(N'2023-08-04' AS Date), CAST(N'2023-09-14' AS Date), CAST(N'2023-10-07' AS Date), CAST(N'2023-09-12' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (4000308, 2000053, 10002308, 50002300, 20456306, 1403003, CAST(55000.00 AS Numeric(10, 2)), CAST(13230.00 AS Numeric(10, 2)), CAST(25000.00 AS Numeric(10, 2)), CAST(N'2023-08-07' AS Date), CAST(N'2023-09-03' AS Date), CAST(N'2023-08-29' AS Date), CAST(N'2023-09-05' AS Date))
INSERT [dbo].[CustomerOrder] ([OrderID], [CustomerID], [PaymentID], [OrderStatusID], [ShipmentMethodID], [ShippingAddressID], [SubTotal], [Tax], [TotalPaid], [DatePaid], [EstDateShipped], [ActualDateShipped], [DateModified]) VALUES (400030, 2000053, 10002308, 50002300, 20456306, 1403003, CAST(55000.00 AS Numeric(10, 2)), CAST(13230.00 AS Numeric(10, 2)), CAST(25000.00 AS Numeric(10, 2)), CAST(N'2023-08-07' AS Date), CAST(N'2010-09-03' AS Date), CAST(N'2023-08-29' AS Date), CAST(N'2023-09-05' AS Date))

DELETE FROM CustomerOrder
--SELECT * FROM CustomerOrder;

INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300301, 4000300, CAST(199.00 AS Numeric(5, 2)), CAST(N'2023-09-12' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300301, 4000301, CAST(200.00 AS Numeric(5, 2)), CAST(N'2023-08-04' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300302, 4000300, CAST(203.22 AS Numeric(5, 2)), CAST(N'2023-08-11' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300302, 4000302, CAST(442.00 AS Numeric(5, 2)), CAST(N'2023-08-02' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300303, 4000300, CAST(230.00 AS Numeric(5, 2)), CAST(N'2023-09-10' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300303, 4000307, CAST(142.00 AS Numeric(5, 2)), CAST(N'2023-08-14' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300304, 4000301, CAST(134.00 AS Numeric(5, 2)), CAST(N'2023-08-01' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300304, 4000302, CAST(100.00 AS Numeric(5, 2)), CAST(N'2023-08-05' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300306, 4000305, CAST(23.00 AS Numeric(5, 2)), CAST(N'2023-08-02' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300307, 4000306, CAST(134.00 AS Numeric(5, 2)), CAST(N'2023-08-01' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300308, 4000301, CAST(34.00 AS Numeric(5, 2)), CAST(N'2023-08-04' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300308, 4000306, CAST(134.00 AS Numeric(5, 2)), CAST(N'2023-08-03' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300309, 4000308, CAST(342.00 AS Numeric(5, 2)), CAST(N'2023-08-05' AS Date))
INSERT [dbo].[ProductSelection] ([ProductID], [OrderID], [UnitPriceSold], [DateModified]) VALUES (300310, 4000307, CAST(442.00 AS Numeric(5, 2)), CAST(N'2023-08-09' AS Date))

--SELECT * FROM ProductSelection;

INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000230, 2000036, 300301, 4, N'Review 3', N'Review 3 Description', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000231, 2000021, 300303, 3, N'Review 3', N'Review 4 Description', CAST(N'2023-04-13' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000232, 2000024, 300304, 2, N'Review 4', N'Review 2 Description ', CAST(N'2023-02-13' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000233, 2000025, 300305, 2, N'Review 2', N'Review 2 Description', CAST(N'2023-01-12' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000234, 2000026, 300306, 1, N'Review 4', N'Review 1 Description', CAST(N'2023-03-15' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000236, 2000027, 300307, 4, N'Review 5', N'Review 3 Description', CAST(N'2023-02-19' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000239, 2000045, 300302, 2, N'Review 1', N'Reveiw 1 Description', CAST(N'2023-06-12' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000240, 2000046, 300303, 3, N'Review 2', N'Review 2 Description', CAST(N'2023-04-13' AS Date))
INSERT [dbo].[Review] ([ProductReviewID], [CustomerID], [ProductID], [Rating], [Title], [Description], [ReviewDate]) VALUES (1000242, 2000023, 300302, 5, N'Review 4', N'Review 4 Description', CAST(N'2023-03-14' AS Date))

--SELECT * FROM Review;

INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456300, N'Air ', N'Overnight', CAST(N'12:12:24' AS Time), CAST(200.00 AS Numeric(5, 2)), CAST(N'2023-10-14' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456301, N'Ground', N'Standard', CAST(N'13:12:21' AS Time), CAST(150.00 AS Numeric(5, 2)), CAST(N'2023-04-12' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456302, N'Air', N'Standard', CAST(N'23:22:24' AS Time), CAST(200.00 AS Numeric(5, 2)), CAST(N'2023-10-14' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456303, N'Air', N'Priority', CAST(N'12:13:24' AS Time), CAST(230.00 AS Numeric(5, 2)), CAST(N'2022-10-13' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456304, N'Ground', N'Overnight', CAST(N'01:23:21' AS Time), CAST(120.00 AS Numeric(5, 2)), CAST(N'2022-09-10' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456305, N'Ground', N'Priority', CAST(N'10:12:31' AS Time), CAST(221.00 AS Numeric(5, 2)), CAST(N'2022-02-13' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456306, N'Pickup', N'Overnight', CAST(N'12:14:31' AS Time), CAST(234.00 AS Numeric(5, 2)), CAST(N'2023-01-13' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456309, N'Pickup', N'Standard', CAST(N'14:12:31' AS Time), CAST(134.00 AS Numeric(5, 2)), CAST(N'2023-01-14' AS Date))
INSERT [dbo].[ShipmentMethod] ([ShipmentMethodID], [ShipmentMode], [ShipmentClass], [ShipmentTime], [FreightCost], [DateModified]) VALUES (20456310, N'Pickup', N'Priority', CAST(N'13:12:31' AS Time), CAST(142.00 AS Numeric(5, 2)), CAST(N'2022-01-13' AS Date))

--DELETE FROM ShipmentMethod WHERE ShipmentMethodID= 20456300  ;
--SELECT * FROM ShipmentMethod;
