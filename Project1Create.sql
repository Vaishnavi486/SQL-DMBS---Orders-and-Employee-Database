CREATE TABLE [dbo].[Category]
(
	ProductCategoryID bigint NOT NULL,
	Categoryname varchar(20) NOT NULL,
	[Description] varchar(20) NOT NULL,
	DateModified date NOT NULL,
	CONSTRAINT PK_Category PRIMARY KEY(ProductCategoryID)
 );

 --DROP TABLE [dbo].[ProductSelection];
 --Desc [dbo].[Category];
 
CREATE TABLE [dbo].[CustomerOrder]
(
	[OrderID] [bigint] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[PaymentID] [bigint] NOT NULL,
	[OrderStatusID] [bigint] NOT NULL,
	[ShipmentMethodID] [bigint] NOT NULL,
	[ShippingAddressID] [bigint] NOT NULL,
	[SubTotal] [numeric](10, 2) NOT NULL,
	[Tax] [numeric](10, 2) NOT NULL,
	[TotalPaid] [numeric](10, 2) NOT NULL,
	[DatePaid] [date] NOT NULL,
	[EstDateShipped] [date] NOT NULL,
	[ActualDateShipped] [date] NOT NULL,
	[DateModified] [date] NOT NULL,
	CONSTRAINT [PK_CustomerOrder] PRIMARY KEY(OrderID)
);

CREATE TABLE [dbo].[OrderStatus]
(
	[OrderStatusID] [bigint] NOT NULL,
	[Description] [varchar](20) NULL,
	[DateModified] [date] NULL,
	CONSTRAINT [OrderStatusID_PK] PRIMARY KEY(OrderStatusID)
);

CREATE TABLE [dbo].[Product]
(
	[ProductID] [bigint] NOT NULL,
	[Description] [varchar](20) NOT NULL,
	[ProductCategoryID] [bigint] NOT NULL,
	[Package] [varchar](20) NOT NULL,
	[WeightQty] [bigint] NOT NULL,
	[WeightUnits] [varchar](20) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Dimensions] [varchar](20) NOT NULL,
	[DateModified] [date] NOT NULL,
	CONSTRAINT [PK_Product] PRIMARY KEY(ProductID)
 );

 CREATE TABLE [dbo].[ProductSelection]
 (
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[UnitPriceSold] [numeric](5, 2) NOT NULL,
	[DateModified] [date] NOT NULL,
	CONSTRAINT [PK_ProductSelection] PRIMARY KEY(ProductID,OrderID)
);

CREATE TABLE [dbo].[Review](
	[ProductReviewID] [bigint] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Rating] [int] NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Description] [varchar](20) NOT NULL,
	[ReviewDate] [date] NOT NULL,
	CONSTRAINT [PK_Review] PRIMARY KEY(ProductReviewID)
 );

 CREATE TABLE [dbo].[ShipmentMethod](
	[ShipmentMethodID] [bigint] NOT NULL,
	[ShipmentMode] [varchar](20) NOT NULL,
	[ShipmentClass] [varchar](20) NOT NULL,
	[ShipmentTime] [time](7) NOT NULL,
	[FreightCost] [numeric](5, 2) NOT NULL,
	[DateModified] [date] NOT NULL,
 CONSTRAINT [PK_ShipmentMethod] PRIMARY KEY(ShipmentMethodID)
 );

