-- Create the database
CREATE DATABASE School;

-- Use the created database
USE School;

-- Create the STUDENT table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

-- Insert sample data
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Anjala', 85, 'A'),
(2, 'Jazeel', 78, 'B'),
(3, 'Amal', 90, 'A'),
(4, 'Hyza', 65, 'C');

-- 1. Display the table
SELECT * FROM STUDENT;

-- 2. Add a column named Contact
ALTER TABLE STUDENT ADD Contact VARCHAR(15);

-- 3. Remove the Grade column
ALTER TABLE STUDENT DROP COLUMN Grade;

-- 4. Rename the table to CLASSTEN
ALTER TABLE STUDENT RENAME TO CLASSTEN;

-- 5. Delete all rows from the table (TRUNCATE)
TRUNCATE TABLE CLASSTEN;

-- 6. Remove the table from the database
DROP TABLE CLASSTEN;

-- Drop the entire database (optional)
-- DROP DATABASE School;
