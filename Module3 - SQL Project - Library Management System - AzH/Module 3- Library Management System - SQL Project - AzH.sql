-- Step 1: Create the Database
CREATE DATABASE `library`;
USE `library`;

-- Step 2: Create Tables

-- 1. Create Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 4. Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Step 3: Insert Sample Data

-- Insert into Branch
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Downtown Library, NY', '123-456-7890'),
(2, 102, 'City Center Library, LA', '321-654-0987'),
(3, 103, 'West Side Library, TX', '987-654-3210');

-- Insert into Employee
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'Anjala ZH', 'Librarian', 55000, 1),
(202, 'Jazeel Mohammed', 'Assistant Librarian', 45000, 1),
(203, 'Amal Muhammed', 'Librarian', 60000, 2),
(204, 'Hyza Jazeel', 'Manager', 70000, 2),
(205, 'Pathu Aezal', 'Librarian', 52000, 3);

-- Insert into Books
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-0131101630', 'C Programming Language', 'Programming', 30, 'yes', 'Kernighan & Ritchie', 'Prentice Hall'),
('978-0451524935', '1984', 'Fiction', 20, 'no', 'George Orwell', 'Penguin'),
('978-0671027032', 'History of Time', 'Science', 35, 'yes', 'Stephen Hawking', 'Bantam'),
('978-0140449136', 'The Art of War', 'History', 25, 'yes', 'Sun Tzu', 'Penguin'),
('978-0262033848', 'Introduction to Algorithms', 'Computer Science', 50, 'no', 'Cormen', 'MIT Press');

-- Insert into Customer
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Jaseem KT', 'New York, USA', '2021-11-15'),
(302, 'Shaheen KT', 'Los Angeles, USA', '2023-03-10'),
(303, 'Faeza Farha', 'Chicago, USA', '2022-05-25'),
(304, 'Fayha Zamrin', 'Houston, USA', '2020-12-30');

-- Insert into IssueStatus
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, '1984', '2023-06-05', '978-0451524935'),
(402, 302, 'Introduction to Algorithms', '2023-05-15', '978-0262033848');

-- Insert into ReturnStatus
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, '1984', '2023-06-15', '978-0451524935');

-- Step 4: Display all the Tables 
SHOW TABLES;
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;


-- Step 5: Queries

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT I.Issued_book_name, C.Customer_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- 5. Retrieve employee names and positions for employees earning above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List customers who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

-- 7. Display branch numbers and employee count per branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- 8. Display names of customers who issued books in June 2023.
SELECT C.Customer_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- 9. Retrieve books with "History" in the title.
SELECT Book_title FROM Books WHERE Book_title LIKE '%History%';

-- 10. Retrieve branches with more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11. Retrieve names of employees who manage branches and their addresses.
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

-- 12. Display customers who issued books with rental price > Rs. 25.
SELECT C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE B.Rental_Price > 25;
