-- 1. Add a new column called DOB in the Persons table
ALTER TABLE Persons ADD DOB DATE;

-- 2. 
-- Insert sample DOB values (for existing records)
UPDATE Persons SET DOB = '1990-05-12' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-07-23' WHERE Id = 2;
UPDATE Persons SET DOB = '1992-03-14' WHERE Id = 3;
UPDATE Persons SET DOB = '1988-09-08' WHERE Id = 4;
UPDATE Persons SET DOB = '1995-11-30' WHERE Id = 5;
UPDATE Persons SET DOB = '1980-06-22' WHERE Id = 6;
UPDATE Persons SET DOB = '1997-04-05' WHERE Id = 7;
UPDATE Persons SET DOB = '1983-01-17' WHERE Id = 8;
UPDATE Persons SET DOB = '1991-12-09' WHERE Id = 9;
UPDATE Persons SET DOB = '1986-08-26' WHERE Id = 10;
UPDATE Persons SET DOB = '1993-10-15' WHERE Id = 11;
UPDATE Persons SET DOB = '1984-02-03' WHERE Id = 12;

-- Create a User-Defined Function (UDF) to calculate Age from DOB
DELIMITER //

CREATE FUNCTION Calculate_Age(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- 3. Fetch the Age of all persons using the function
SELECT Id, Fname, Lname, DOB, Calculate_Age(DOB) AS Age FROM Persons;

-- 4. Find the length of each country name in the Country table
SELECT Country_name, LENGTH(Country_name) AS Name_Length FROM Country;

-- 5. Extract the first three characters of each country's name
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars FROM Country;

-- 6. Convert all country names to uppercase and lowercase
SELECT Country_name, 
       UPPER(Country_name) AS Upper_Case, 
       LOWER(Country_name) AS Lower_Case 
FROM Country;
