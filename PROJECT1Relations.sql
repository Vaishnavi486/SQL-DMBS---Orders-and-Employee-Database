--ALTER TABLE Orders
--ADD CONSTRAINT FK_PersonOrder
--FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

--1
ALTER TABLE [dbo].[CustomerOrder][OrderStatusID]  WITH CHECK ADD CONSTRAINT [FK_Cust_Order_Order_Sts_ID] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_Cust_Order_Order_Sts_ID]
GO

--ALTER TABLE dbo.[CustomerOrder]
--DROP CONSTRAINT FK_Cust_Order_Order_Sts_ID;

--2
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_Cust_Order_Shipment_Mtd_ID] FOREIGN KEY([ShipmentMethodID])
REFERENCES [dbo].[ShipmentMethod] ([ShipmentMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_Cust_Order_Shipment_Mtd_ID]
GO
--SELECT * FROM CustomerOrder;
--SELECT * FROM ShipmentMethod;
--SELECT * FROM OrderStatus;
--SELECT * FROM Product;
--SELECT * FROM Category;

--3
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[Category] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO

--4
ALTER TABLE [dbo].[ProductSelection]  WITH CHECK ADD  CONSTRAINT [FK_ProductSelection_Cust_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[CustomerOrder] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSelection] CHECK CONSTRAINT [FK_ProductSelection_Cust_Order]
GO

--5
ALTER TABLE [dbo].[ProductSelection]  WITH CHECK ADD  CONSTRAINT [FK_ProductSelection_Prod] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSelection] CHECK CONSTRAINT [FK_ProductSelection_Prod]
GO

--6
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Prod] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Prod]
GO

