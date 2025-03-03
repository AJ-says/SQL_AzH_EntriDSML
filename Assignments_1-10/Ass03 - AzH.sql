-- Create the Managers table with constraints
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age >= 25 AND Age <= 65), -- Age should be between 25 and 65
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')), -- Ensures only 'M' or 'F'
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

-- 1. Insert 10 rows into Managers
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'Anjala', 'ZH', '1985-05-12', 39, 'F', 'IT', 30000),
(2, 'Jazeel', 'Mohammed', '1990-08-25', 34, 'M', 'HR', 28000),
(3, 'Amal', 'Muhammed', '1978-02-10', 46, 'M', 'Finance', 32000),
(4, 'Hyza', 'Jazeel', '1982-11-15', 42, 'F', 'IT', 27000),
(5, 'Jaseem', 'KT', '1995-07-22', 29, 'M', 'Marketing', 22000),
(6, 'Shaheen', 'KT', '1989-09-30', 35, 'M', 'IT', 26000),
(7, 'Faeza', 'Farha', '1975-12-05', 49, 'F', 'Sales', 35000),
(8, 'Aaliya', 'Zamrin', '1991-03-18', 33, 'F', 'HR', 25000), --  Manager named ‘Aaliya’
(9, 'Eesa', 'Raidh', '1980-06-14', 44, 'M', 'Finance', 29000),
(10, 'Pathu', 'Aezal', '1987-04-28', 37, 'F', 'Operations', 31000);

-- 2. Retrieve the name and date of birth of the manager with Manager_Id 1
SELECT First_name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

-- 3. Display the annual income of all managers
SELECT First_name, Last_Name, Salary * 12 AS Annual_Income FROM Managers;

-- 4. Display records of all managers except ‘Aaliya’
SELECT * FROM Managers WHERE First_name <> 'Aaliya';

-- 5. Display details of managers whose department is IT and earn more than 25000 per month
SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

-- 6. Display details of managers whose salary is between 10000 and 35000
SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;
