-- 1. 
-- Perform INNER JOIN between Country and Persons table
SELECT P.Id, P.Fname, P.Lname, P.Rating, P.Country_name, C.Population, C.Area
FROM Persons P
INNER JOIN Country C ON P.Country_Id = C.Id;

-- Perform LEFT JOIN
SELECT P.Id, P.Fname, P.Lname, P.Rating, P.Country_name, C.Population, C.Area
FROM Persons P
LEFT JOIN Country C ON P.Country_Id = C.Id; -- (includes all persons and matches country details if available)

-- Perform RIGHT JOIN 
SELECT P.Id, P.Fname, P.Lname, P.Rating, P.Country_name, C.Population, C.Area
FROM Persons P
RIGHT JOIN Country C ON P.Country_Id = C.Id; -- (includes all countries and matches persons if available)

-- 2. List all distinct country names from both Country and Persons tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

-- 3. List all country names from both tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- 4. Round the ratings of all persons to the nearest integer
SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating, Country_name
FROM Persons;
