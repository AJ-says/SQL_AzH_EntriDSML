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
    Lname VARCHAR(50) NOT NULL,
    Population INT,  -- This might refer to city population or NULL
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


-- 1. List the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

-- 2. Select first names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- 3. Find all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- 4. Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

-- 5. Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- 6. Find all persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- 9. Find all countries with a population between 5 lakhs (500,000) and 20 lakhs (2,000,000)
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
