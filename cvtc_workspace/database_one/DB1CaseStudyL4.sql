-- Query 1 
SELECT Model, Brand, Model, TopSpeed 
FROM model 
ORDER BY TopSpeed DESC;

-- Query 2 
SELECT AVG(Salary) AS AverageSalary
FROM remotepilot;

-- Query 3
SELECT PassID, FirstName, LastName
FROM passenger
WHERE State = 'MI'
ORDER BY Lastname, FirstName; 

-- Query 4
SELECT ModelID, Brand, Model
FROM model
WHERE Description LIKE '%package%'
ORDER BY Brand, Model; 

-- Query 5
SELECT * 
FROM flightreservation
WHERE YEAR(PickUpTime) = '2017'
ORDER BY PickUpTime;

-- Query 7 
SELECT FlightID, TypeID, PickUpTime 
FROM flightreservation
WHERE StatusID = 3
ORDER BY TypeID, PickUpTime;

-- Query 8 
SELECT EstDropOffTime - ActDropOffTime AS AvgTimeDifference
FROM flightreservation;