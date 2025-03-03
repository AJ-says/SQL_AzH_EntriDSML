-- 1. Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);

-- Insert sample data into teachers table
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Anjala ZH', 'Mathematics', 8, 50000),
(2, 'Jazeel Mohammed', 'Physics', 10, 60000),
(3, 'Amal Muhammed', 'Chemistry', 12, 65000),
(4, 'Hyza Jazeel', 'Biology', 6, 48000),
(5, 'Jaseem KT', 'Computer Science', 9, 70000),
(6, 'Shaheen KT', 'English', 7, 55000),
(7, 'Faeza Farha', 'History', 11, 58000),
(8, 'Fayha Zamrin', 'Geography', 5, 52000);

-- 2. Create BEFORE INSERT trigger to prevent negative salary
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

-- 3. 
-- Create teacher_log table for storing log records
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

-- Create AFTER INSERT trigger to log insert actions
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, log_timestamp)
    VALUES (NEW.id, 'INSERTED', NOW());
END //

DELIMITER ;

-- 4. Create BEFORE DELETE trigger to prevent deletion of experienced teachers
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END //

DELIMITER ;

-- 5. Create AFTER DELETE trigger to log delete actions
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, log_timestamp)
    VALUES (OLD.id, 'DELETED', NOW());
END //

DELIMITER ;

-- Testing the triggers

-- Test 1: Try inserting a teacher with a negative salary (Should Fail)
INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES (9, 'Haseena Flower', 'Physics', 8, -50000);

-- Test 2: Insert a new teacher (Should Log the Insertion)
INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES (9, 'Haseena Flower', 'Physics', 8, 55000);

-- Check the teacher_log table for INSERT action
SELECT * FROM teacher_log;

-- Test 3: Try deleting a teacher with more than 10 years of experience (Should Fail)
DELETE FROM teachers WHERE id = 3;

-- Test 4: Delete a teacher with less than 10 years of experience (Should Log the Deletion)
DELETE FROM teachers WHERE id = 4;

-- Check the teacher_log table for DELETE action
SELECT * FROM teacher_log;
