-- Create the Sales database
CREATE DATABASE Sales;

-- Use the Sales database
USE Sales;

-- Create the Orders table with constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,  -- Primary Key Constraint
    Customer_name VARCHAR(100) NOT NULL,  -- Not Null Constraint
    Product_Category VARCHAR(50) NOT NULL,  -- Not Null Constraint
    Ordered_item VARCHAR(100) NOT NULL,  -- Not Null Constraint
    Contact_No VARCHAR(15) UNIQUE  -- Unique Constraint
);

-- 1. Add a new column "order_quantity" to the Orders table
ALTER TABLE Orders ADD order_quantity INT NOT NULL;

-- 2. Rename the Orders table to sales_orders
ALTER TABLE Orders RENAME TO sales_orders;

-- 3. Insert 10 rows into sales_orders
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Anjala', 'Electronics', 'Laptop', '9876543210', 2),
(2, 'Jazeel', 'Electronics', 'Smartphone', '9876543211', 1),
(3, 'Amal', 'Furniture', 'Chair', '9876543212', 4),
(4, 'Hyza', 'Clothing', 'T-Shirt', '9876543213', 3),
(5, 'Jaseem', 'Electronics', 'Tablet', '9876543214', 1),
(6, 'Shaheen', 'Furniture', 'Sofa', '9876543215', 1),
(7, 'Faeza', 'Clothing', 'Jeans', '9876543216', 2),
(8, 'Fayha', 'Footwear', 'Sneakers', '9876543217', 2),
(9, 'Eesa', 'Books', 'Novel', '9876543218', 5),
(10, 'Pathu', 'Appliances', 'Microwave', '9876543219', 1);

-- 4. Retrieve customer_name and Ordered_Item from sales_orders
SELECT Customer_name, Ordered_item FROM sales_orders;

-- 5. Update the Ordered_item for any specific row (e.g., change "Tablet" to "Smartwatch" for Order_Id 5)
UPDATE sales_orders SET Ordered_item = 'Smartwatch' WHERE Order_Id = 5;

-- 6. Delete the sales_orders table from the database
DROP TABLE sales_orders;

-- Drop the Sales database (optional)
-- DROP DATABASE Sales;
