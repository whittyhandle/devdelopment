-- Query 1 
SELECT DroneID, CostPerMile AS AvgCostPerMile
FROM flightreservation
JOIN flightstatus ON flightreservation.StatusId=flightstatus.StatusId
WHERE flightreservation.StatusId = 5
ORDER BY AvgCostPerMile;

-- Query 2 
SELECT *
FROM flightreservation
WHERE DropOffLat >= 47.785228
LIMIT 3; 

-- Query 3
SELECT State, COUNT(STATE) AS NumPassengers
FROM passenger
Group By State;

-- Query 4
-- asked for help on Wed the 24 at 7:20 pm 
SELECT AVG(TopSpeed) as Avg , MIN(TopSpeed)as Min, MAX(TopSpeed) as Max
 FROM model
 WHERE Description LIKE '%pass%'
 group by TopSpeed; 

-- Query 5 
SELECT FlightId, COUNT(DISTINCT(PassID)) AS PassengerCount
FROM manifestpassenger
GROUP BY FLightID
ORDER BY PassengerCount DESC
