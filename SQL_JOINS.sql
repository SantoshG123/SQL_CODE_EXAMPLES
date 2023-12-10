SELECT dbo.titles.title, AVG(dbo.roysched.royalty) As NewRoyalty
From dbo.titles INNER JOIN dbo.roysched
ON dbo.titles.title_id = dbo.roysched.title_id
Where NewRoyalty >=25PERCENT;

--find the sales for each region 

SELECT dbo.Region.RegionDescription AS Region, SUM (dbo.Orders.OrderID) As
Sales
From dbo.Orders, dbo.Employees, dbo.EmployeeTerritories, dbo.Territories,
dbo.Region
Where dbo.Orders.EmployeeID = dbo.Employees.EmployeeID
AND dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
AND dbo.EmployeeTerritories.TerritoryID = dbo.Territories.TerritoryID
AND dbo.Territories.RegionID = dbo.Region.RegionID
Group by RegionDescription;

--find the region assigned to each employee ( join employees to employeeterritories to territories to region)
SELECT dbo.Employees.FirstName+LastName As EmployeeName,
dbo.Region.RegionDescription As RegionAssigned
From dbo.Employees, dbo.EmployeeTerritories, dbo.Territories, dbo.Region
Where dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
AND dbo.EmployeeTerritories.TerritoryID = dbo.Territories.TerritoryID
AND dbo.Territories.RegionID = dbo.Region.RegionID;

--find the territory assigned to each employee ( join employees to employeeterritories to territories)
SELECT dbo.Employees.FirstName+LastName As EmployeeName,
dbo.Territories.TerritoryDescription As TerritoryAssigned
From dbo.Employees, dbo.EmployeeTerritories, dbo.Territories
Where dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
AND dbo.EmployeeTerritories.TerritoryID = dbo.Territories.TerritoryID;

--find the most freight paid by a customer for a particular order for goods shipped via &quot;speedy express&quot;
(join orders and shippers)
SELECT dbo.Shippers.CompanyName, Max (dbo.Orders.Freight) As
FreightPaid,dbo.Orders.CustomerID, dbo.Orders.OrderID
From dbo.Shippers INNER JOIN dbo.Orders
On dbo.Shippers.ShipperID = dbo.Orders.ShipVia
Where CompanyName = "Speedy Express";
Group by CompanyName, CustomerID, OrderID
Order by FreightPaid DESC;


--find all the items which belong to beverage category (category and products)
SELECT dbo.Categories.CategoryName, dbo.Products.ProductName
From dbo.Categories Right Join dbo.Products
On dbo.Categories.CategoryID = Dbo.Products.CategoryID
where CategoryName = "Beverages";

--find the quantity of Queso Cabrales sold (join order details and products)
SELECT Northwind.dbo.Products.ProductName, Sum (Quantity)
FROM Northwind.dbo.Products LEFT JOIN Northwind.dbo.[Order Details] ON
Northwind.dbo.Products.ProductID = Northwind.dbo.[Order Details].ProductID where
ProductName = "Queso Cabrales"
 group by ProductName;