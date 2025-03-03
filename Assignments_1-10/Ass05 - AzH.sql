-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Area DECIMAL(10,2) NOT NULL
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3,1) NOT NULL,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id) ON DELETE SET NULL
);

-- Insert 10 rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 243610),
(4, 'India', 1393000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'China', 1441000000, 9596961),
(9, 'Brazil', 213000000, 8515767),
(10, 'Mexico', 126000000, 1964375);

-- Insert 10 rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Anjala', 'ZH', NULL, 4.5, 1, 'USA'),
(2, 'Jazeel', 'Mohammed', 500000, 3.9, 2, 'Canada'),
(3, 'Amal', 'Muhammed', 1000000, 4.8, 3, 'UK'),
(4, 'Hyza', 'Jazeel', 200000, 4.2, 4, 'India'),
(5, 'Jaseem', 'KT', NULL, 4.6, 5, 'Australia'),
(6, 'Shaheen', 'KT', 700000, 3.5, 6, 'Germany'),
(7, 'Faeza', 'Farha', NULL, 4.9, 7, 'France'),
(8, 'Fayha', 'Zamrin', 800000, 4.1, 8, 'China'),
(9, 'Eesa', 'Raidh', 1200000, 4.7, 9, 'Brazil'),
(10, 'Pathu', 'Aezal', NULL, 3.8, 10, 'Mexico');


-- 1. Print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS Short_Country FROM Country;

-- 2. Concatenate first name and last name from Persons table
SELECT CONCAT(Fname, ' ', COALESCE(Lname, '')) AS Full_Name FROM Persons;

-- 3. Count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;

-- 4. Print the maximum population from the Country table
SELECT MAX(Population) AS Max_Population FROM Country;

-- 5. Print the minimum population from Persons table
SELECT MIN(Population) AS Min_Population FROM Persons;

-- 6. 
-- Insert 2 new rows with NULL last names
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Aldin', NULL, 450000, 3.6, 3, 'UK'),
(12, 'Hadhi', NULL, 600000, 4.0, 5, 'Australia');
-- Count the number of Lname values from Persons table
SELECT COUNT(Lname) AS Count_Lname FROM Persons; -- COUNT() never counts NULL values.

-- 7. Find the number of rows in the Persons table
SELECT COUNT(*) AS Total_Persons FROM Persons;

-- 8. Show the population of the first 3 rows from the Country table
SELECT Population FROM Country LIMIT 3;

-- 9. Print 3 random rows of countries
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING Total_Population > 50000;

-- 13. List the total number of persons and average rating for each country,
-- but only for countries with more than 2 persons, ordered by average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;
