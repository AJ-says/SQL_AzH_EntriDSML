
-- 1. Find the number of persons in each country
SELECT Country_name, COUNT(*) AS Num_Persons FROM Persons GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS Num_Persons FROM Persons GROUP BY Country_name ORDER BY Num_Persons DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS Avg_Rating FROM Persons GROUP BY Country_name HAVING Avg_Rating > 3.0;

-- 4. Find the countries with the same rating as the USA
SELECT Country_name FROM Persons WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations
SELECT Country_name, Population FROM Country WHERE Population > (SELECT AVG(Population) FROM Country);



-- Create Product database
CREATE DATABASE Product;
USE Product;

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_no VARCHAR(20) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Insert sample customer data
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'Zakkeer', 'Husain', 'zakkeer@fb.com', '123-456-7890', '1725 Slough Ave', 'Scranton', 'Pennsylvania', '18505', 'USA'),
(2, 'Seenath', 'PS', 'seenath@fb.com', '987-654-3210', '1725 Slough Ave', 'Scranton', 'Pennsylvania', '18505', 'USA'),
(3, 'Fazeer', 'Khan', 'fazeer@fb.com', '456-789-1234', '123 Paper St', 'Stamford', 'Connecticut', '06901', 'USA'),
(4, 'Zeenath', 'VN', 'zeenath@fb.com', '111-222-3333', 'Schrute Farms', 'Honesdale', 'Pennsylvania', '18431', 'USA'),
(5, 'Abdul', 'Jaleel', 'jaleel@corporate.com', '222-333-4444', 'Corporate HQ', 'New York', 'New York', '10001', 'USA'),
(6, 'Haseena', 'Flower', 'haseena@corporate.com', '333-444-5555', 'Corporate HQ', 'New York', 'New York', '10001', 'USA'),
(7, 'Lazima', 'KT', 'lazima@corporate.com', '444-555-6666', 'Corporate HQ', 'Stamford', 'Connecticut', '06901', 'USA');


-- 1. Create a view named customer_info for Full Name and Email
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email FROM Customer;
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';

-- 3. Create another view named Customer_details with full name, email, phone_no, and state
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State FROM Customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view
UPDATE Customer SET Phone_no = '000-000-0000' WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS Num_Customers FROM Customer GROUP BY State HAVING COUNT(*) > 5;

-- 6. Count the number of customers in each state based on "Customer_details" view
SELECT State, COUNT(*) AS Num_Customers FROM Customer_details GROUP BY State;

-- 7. Retrieve all columns from "Customer_details" view sorted by "State" in ascending order
SELECT * FROM Customer_details ORDER BY State ASC;
