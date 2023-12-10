Create procedure [dbo].[OrderID_rownumbersai]
(
@OrderID int ,
@CustomerID nchar (5),
@EmployeeID int ,
@OrderDate datetime ,
@RequiredDate datetime ,
@ShippedDate datetime ,
@ShipVia int,
@Freight money ,
@ShipName nvarchar(40) ,
@ShipAddress nvarchar(60),
@ShipCity nvarchar(15) ,
@ShipRegion nvarchar(15) ,
@ShipPostalCode nvarchar(10) ,
@ShipCountry nvarchar(15)
)
As
Select @OrderID = @@IDENTITY
BEGIN
INSERT into dbo.Orders_1 (CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry)
SELECT CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry
FROM dbo.Orders
INSERT into dbo.Orders_1 (CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry)
SELECT CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry
FROM dbo.Orders
INSERT into dbo.Orders_1 (CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry)
SELECT CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry
FROM dbo.Orders
INSERT into dbo.Orders_1 (CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry)
SELECT CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry
FROM dbo.Orders
INSERT into dbo.Orders_1 (CustomerID, EmployeeID,OrderDate,RequiredDate,

ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry)
SELECT CustomerID, EmployeeID,OrderDate,RequiredDate,
ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPost
alCode,ShipCountry
FROM dbo.Orders;
