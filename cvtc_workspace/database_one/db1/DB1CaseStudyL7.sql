-- Qeury 1 
SELECT LastName, FirstName, COUNT(RemotePilotID) AS NumOfFlights
FROM droneportation.flightreservation
INNER JOIN droneportation.remotepilot ON flightreservation.RemotePilotID = remotepilot.PilotID
GROUP BY LastName
ORDER BY LastName; 

-- Query 2 
SELECT flighttype.Desc, COUNT(flighttype.Desc) AS NumOFlights
FROM droneportation.flightreservation
INNER JOIN droneportation.flighttype USING (TypeID)
GROUP BY flighttype.Desc; 

-- Query 3
SELECT DroneID, Brand, Model, COUNT(flightstatus.Desc) NumOfFights
FROM droneportation.flightreservation
INNER JOIN droneportation.flightstatus USING (StatusID)
	INNER JOIN droneportation.drone USING (DroneID)
    INNER JOIN droneportation.model USING (ModelID)
WHERE flightstatus.Desc IN ("In Progress","Complete")
GROUP BY DroneID; 

-- ALT Query 3
SELECT DroneID, Brand, Model, COUNT(flightstatus.Desc) NumOfFights
FROM droneportation.flightreservation
INNER JOIN droneportation.flightstatus USING (StatusID)
	INNER JOIN droneportation.drone USING (DroneID)
    INNER JOIN droneportation.model USING (ModelID)
WHERE flightstatus.Desc = "In Progress" OR flightstatus.Desc ="Complete"
GROUP BY DroneID; 


-- Query 4
SELECT GroupID, Nickname, flightgroup.Description, FirstName, LastName
FROM droneportation.passengergroup
INNER JOIN droneportation.flightgroup USING (GroupID)
INNER JOIN droneportation.passenger USING (PassID)
INNER JOIN droneportation.grouptype USING (GroupTypeID)
WHERE GroupID = 61 AND grouptype.Description = "Business"; 

-- Query 5 
SELECT grouptype.Description, COUNT(PassID) as numOfPass
FROM droneportation.passengergroup
INNER JOIN droneportation.flightgroup USING (GroupID)
INNER JOIN droneportation.grouptype USING (GroupTypeID)
GROUP BY grouptype.Description;