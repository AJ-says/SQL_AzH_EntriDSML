-- Create the Worker table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

-- Insert sample data into Worker table
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'Anjala', 'ZH', 50000, '2020-01-15 09:00:00', 'IT'),
(2, 'Jazeel', 'Mohammed', 55000, '2019-03-25 09:30:00', 'HR'),
(3, 'Amal', 'Muhammed', 60000, '2018-07-10 10:00:00', 'Finance'),
(4, 'Hyza', 'Jazeel', 62000, '2021-09-12 11:00:00', 'IT'),
(5, 'Jaseem', 'KT', 45000, '2017-12-05 08:30:00', 'Marketing'),
(6, 'Shaheen', 'KT', 58000, '2022-04-20 12:00:00', 'Finance');

-- 1.
-- Create a Stored Procedure to Insert a Worker
DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

-- Call the procedure to insert a new worker
CALL AddWorker(7, 'Faeza', 'Farha', 52000, '2023-05-10 10:30:00', 'HR');

-- 2.
-- Create a Stored Procedure to Retrieve Worker Salary 
DELIMITER //

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Declare a variable and call the procedure to get salary of Worker ID 3
SET @worker_salary = 0;
CALL GetSalary(3, @worker_salary);
SELECT @worker_salary AS Salary;

-- 3.
-- Create a Stored Procedure to Update Worker Department
DELIMITER //

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Call the procedure to update department of Worker ID 4
CALL UpdateDepartment(4, 'HR');

-- 4.
-- Create a Stored Procedure to Count Workers in a Department
DELIMITER //

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

-- Declare a variable and call the procedure to get worker count for HR department
SET @worker_count = 0;
CALL GetWorkerCount('HR', @worker_count);
SELECT @worker_count AS Worker_Count;

-- 5.
-- Create a Stored Procedure to Get Average Salary in a Department
DELIMITER //

CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

-- Declare a variable and call the procedure to get average salary for Finance department
SET @avg_salary = 0;
CALL GetAverageSalary('Finance', @avg_salary);
SELECT @avg_salary AS Average_Salary;
