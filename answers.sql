CREATE DATABASE Electronics;
USE Electronics;
-- Question 1 Achieving 1NF (First Normal Form)
CREATE TABLE Orders ( 
OrderId INT PRIMARY KEY ,
CustomerName VARCHAR(255),
Products VARCHAR(255)

);
INSERT INTO  Orders( OrderId,CustomerName,Products)
VALUES(101,"John Doe","Laptop,Mouse"),
(102,"Jane Smith","Tablet,Keyboard,Mouse"),
(103,"Emily Clark","Phone");

SELECT *FROM orders;

ALTER TABLE Orders
DROP COLUMN Products;
SELECT *FROM orders;

CREATE TABLE ProductItems(
ProductId INT PRIMARY KEY AUTO_iNCREMENT,
productName VARCHAR(255),
OrderId INT,
FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

INSERT INTO ProductItems(productName,OrderId)
VALUES
('Laptop',101),
('Mouse',101),
('Tablet',102),
('Keyboard',102),
('Mouse',102),
( 'Phone',103);
SELECT *FROM ProductItems;
-- Question 2 Achieving 2NF (Second Normal Form)

-- Step 1: Create the normalized Orders table (removing Products column)
CREATE TABLE ordersDetails (
    orderId INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into Orders table
INSERT INTO OrdersDetails(orderId, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create ProductItems table with Quantity
CREATE TABLE Product_Items (
    ProductId INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255),
    orderId INT,
    Quantity INT,
    FOREIGN KEY (orderId) REFERENCES OrdersDetails(orderId)
);

-- Insert data with quantities from original table
INSERT INTO Product_Items(ProductName, orderId, Quantity)
VALUES
('Laptop', 101, 2),
('Mouse', 101, 1),
('Tablet', 102, 3),
('Keyboard', 102, 1),
('Mouse', 102, 2),
('Phone', 103, 1);

-- Verify the results
SELECT * FROM OrdersDetails;
SELECT * FROM Product_Items;
