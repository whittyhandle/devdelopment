-- Query 1 
SELECT FirstName, LastName, HomePhone
FROM employee
ORDER BY FirstName; 

-- Query 2
SELECT CompanyName, Country, City
FROM supplier
ORDER BY Country, City, CompanyName;

-- Query 3
SELECT Firstname, Lastname, BirthDate
FROM employee
WHERE MONTH(BirthDate) = 12;

-- Query 4 
SELECT ProductName, UnitPrice - UnitCost as Profit
FROM product;
