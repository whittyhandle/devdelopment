-- Query 1 
SELECT 
    manifestpassenger.FlightID,
    passenger.PassID,
    passenger.FirstName,
    passenger.LastName
FROM
    droneportation.manifestpassenger
        INNER JOIN
    droneportation.passenger USING (PassID)
WHERE
    FlightID = 39
ORDER BY Lastname;

-- Query 2 
SELECT 
    FlightID,
    flightreservation.PickUpTime,
    SUM(FLightID + manifestpassenger.SeatPrice) AS TotalSeatPrice,
    flightreservation.CostPerMile
FROM
    droneportation.manifestpassenger
        INNER JOIN
    droneportation.flightreservation USING (FlightID)
GROUP BY FlightID; 

-- Query 3 
SELECT 
    passenger.FirstName, 
    passenger.Lastname,
    manifestpassenger.FlightID,
    flightreservation.PickUpTime, 
    manifestpassenger.SeatPrice
FROM
    droneportation.passenger
        INNER JOIN
    droneportation.manifestpassenger USING (PassID)
        INNER JOIN
    droneportation.flightreservation USING (FlightID)
WHERE
    FirstName = 'Cody'
        AND LastName = 'Black'
GROUP BY FlightID
ORDER BY PickUpTime;

-- Query 4 
SELECT
FlightID, PickUpTime, ActDropOffTime, PackageID, Length, Width, Height, Weight 
FROM flightreservation
INNER JOIN manifestpackage USING (FlightID)
INNER JOIN package USING (PackageID)
WHERE FlightID = 20; 

-- Query 5
SELECT
DroneId, Color, AddedOn, Model, model.Description
FROM droneportation.model
LEFT JOIN drone USING (ModelID)
ORDER BY Model;

-- Query 6
SELECT LastName, FirstName, FlightID
FROM flightreservation
INNER JOIN remotepilot ON RemotePilotID = PilotID
ORDER BY  LastName, FirstName, FlightID; 

-- Query 7 
SELECT 
FlightID, PickUpTime, EstDropOffTime, CostPerMile, PickUpLat, PickUpLong, DropOffLat, DropOffLong, flighttype.Desc AS Type, flightstatus.Desc AS Status
, FirstName, LastName
FROM flightreservation
INNER JOIN flighttype USING (TypeID)
INNER JOIN flightstatus USING (StatusID)
INNER JOIN remotepilot ON RemotePilotID = PilotID

