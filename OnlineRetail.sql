CREATE DATABASE OnlineRetail;
USE OnlineRetail;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customers (FirstName, LastName, Email,PhoneNumber, Address, City, State, ZipCode, Country) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'New York', 'NY', '10001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'USA'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5551234567', '789 Pine Road', 'Chicago', 'IL', '60601', 'USA'),
('Bob', 'Brown', 'bob.brown@example.com', '6667778888', '321 Maple Drive', 'Houston', 'TX', '77001', 'USA'),
('Charlie', 'Davis', 'charlie.davis@example.com', '7778889999', '654 Cedar Lane', 'Phoenix', 'AZ', '85001', 'USA'),
('David', 'Miller', 'david.miller@example.com', '1112223333', '987 Birch Blvd', 'Philadelphia', 'PA', '19101', 'USA'),
('Eve', 'Wilson', 'eve.wilson@example.com', '2223334444', '135 Palm Way', 'San Antonio', 'TX', '78201', 'USA'),
('Frank', 'Moore', 'frank.moore@example.com', '3334445555', '246 Spruce Circle', 'San Diego', 'CA', '92101', 'USA'),
('Grace', 'Taylor', 'grace.taylor@example.com', '4445556666', '369 Ash Plaza', 'Dallas', 'TX', '75201', 'USA'),
('Hank', 'Anderson', 'hank.anderson@example.com', '5556667777', '481 Poplar Street', 'San Jose', 'CA', '95101', 'USA');


CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Tablet', 'Electronics', 299.99, 75),
('Headphones', 'Accessories', 49.99, 200),
('Smartwatch', 'Accessories', 199.99, 150),
('Camera', 'Electronics', 499.99, 30),
('Bluetooth Speaker', 'Accessories', 89.99, 120),
('Monitor', 'Electronics', 199.99, 60),
('Keyboard', 'Accessories', 29.99, 250),
('Mouse', 'Accessories', 19.99, 300);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders (OrderDate, CustomerID, TotalAmount) VALUES
('2024-01-10', 1, 1349.98),
('2024-01-12', 2, 749.98),
('2024-01-15', 3, 1349.97),
('2024-01-20', 4, 1499.98),
('2024-01-22', 5, 199.98),
('2024-01-25', 6, 1049.98),
('2024-01-28', 7, 229.98),
('2024-01-30', 8, 729.98),
('2024-02-02', 9, 269.98),
('2024-02-05', 10, 1099.98);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 999.99),
(1, 4, 2, 49.99),
(2, 2, 1, 699.99),
(2, 7, 1, 49.99),
(3, 1, 1, 999.99),
(3, 3, 1, 299.99),
(3, 5, 2, 199.99),
(4, 6, 1, 499.99),
(4, 7, 2, 89.99),
(5, 8, 1, 199.99),
(6, 2, 1, 699.99),
(6, 4, 3, 49.99),
(7, 9, 3, 29.99),
(8, 5, 1, 199.99),
(8, 10, 1, 19.99),
(9, 3, 1, 299.99),
(9, 7, 1, 49.99),
(10, 1, 1, 999.99),
(10, 3, 1, 299.99);

