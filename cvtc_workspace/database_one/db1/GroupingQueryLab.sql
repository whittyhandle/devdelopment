-- Query 1 `order`
SELECT ProductName, QuantityPerUnit, UnitPrice
FROM product
ORDER BY ProductName ASC; 

-- Query 2 
SELECT OrderID, CustomerID, OrderDate, RequiredDate
FROM northwind.`order` 
GROUP BY OrderDate, RequiredDate; 

-- Query 3 
SELECT OrderID, sum(round((UnitPrice * Quantity * (1 - Discount)), 2)) as SubTotal
FROM orderdetail
WHERE OrderId IN (10360, 10436, 10449)
GROUP BY OrderID;

-- Query 4
SELECT ProductName, QuantityPerUnit, SupplierID
FROM product
WHERE QuantityPerUnit LIKE '%500 g%';

-- Query 5 
SELECT Country, COUNT(Country) as NumOfCustomers
FROM customer
GROUP BY Country
ORDER BY NumOfCustomers DESC; 

-- Query 6
SELECT CustomerID, COUNT(OrderId) as TotalOrder
FROM northwind.`order`
GROUP BY CustomerId
ORDER BY TotalOrder DESC; 

-- Query 7
SELECT OrderID, EmployeeID, CustomerID, ShipAddress, ShipCity, ShipPostalCode 
FROM northwind.`order`
WHERE OrderId IN (10360, 10436, 10449); 

-- Query 8
SELECT datediff(ShippedDate, RequiredDate) AS DaysLate, 
COUNT((RequiredDate > ShippedDate)) as NumOrders
FROM northwind.`order`
WHERE datediff(RequiredDate, ShippedDate) > 0
GROUP BY DaysLate
ORDER BY DaysLate; 

-- Query 9 
SELECT CategoryID, UnitCost, UnitPrice, ROUND((UnitPrice - UnitCost), 2) AvergeProfit
FROM product
WHERE  ROUND((UnitPrice - UnitCost), 2) > 10;


