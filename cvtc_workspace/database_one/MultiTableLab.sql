-- Query 1 
SELECT  CompanyName,  COUNT(CustomerID) AS NumOrder
FROM northwind.`order`
INNER JOIN northwind.customer USING (CustomerID)
GROUP BY CustomerID
ORDER BY NumOrder DESC; 

-- Query 2 
SELECT ProductName, ROUND(SUM(((orderdetail.UnitPrice - (orderdetail.UnitPrice * orderdetail.Discount)) * Quantity)), 2) AS TotalSales
FROM northwind.orderdetail
INNER JOIN northwind.product USING (ProductID)
GROUP By ProductID 
ORDER BY TotalSales DESC; 

-- Query 3 
SELECT *, ROUND(SUM(((orderdetail.UnitPrice - (orderdetail.UnitPrice * orderdetail.Discount)) * Quantity)), 2) AS TotalSales
FROM northwind.orderdetail
INNER JOIN northwind.product USING (ProductID)
INNER JOIN northwind.category USING (CategoryID)
GROUP By CategoryName 
ORDER BY TotalSales DESC;

-- Query 4 
SELECT FirstName, LastName, COUNT(DISTINCT(OrderId)) AS NumOrder, ROUND(SUM(((orderdetail.UnitPrice - (orderdetail.UnitPrice * orderdetail.Discount)) * Quantity)), 2) AS TotalSales 
FROM northwind.orderdetail
INNER JOIN northwind.`order` USING (OrderID)
	INNER JOIN northwind.employee USING (EmployeeID) 
GROUP BY FirstName
ORDER BY TotalSales DESC; 

-- Query 5
SELECT ProductName, COUNT(orderdetail.OrderID) AS TimesOrdred, SUM(orderdetail.Quantity) AS TotalOrdered
FROM northwind.orderdetail
INNER JOIN northwind.product USING (ProductID)
GROUP BY ProductName
ORDER BY TotalOrdered DESC;

-- Query 6
-- this one doesn't work as expected 
SELECT ProductName, ROUND(AVG(orderdetail.UnitPrice)) AS UnitPrice, 
ROUND(AVG((orderdetail.UnitPrice - (orderdetail.UnitPrice * orderdetail.Discount))), 2)  AS AvgSalesPrice, 
ROUND(AVG((orderdetail.UnitPrice - (orderdetail.UnitPrice - (orderdetail.UnitPrice * orderdetail.Discount)))), 2) AS DiffInPrice
FROM northwind.orderdetail
INNER JOIN northwind.product USING (ProductID)
group by ProductID;