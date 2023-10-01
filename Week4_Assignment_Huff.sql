/*
IT 3060C-002
Week 4 - Assignment

Levi Huff
*/

Use HuffStore;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerLast NVARCHAR(50),
    CustomerFirst NVARCHAR(50),
    CustomerDOB DATE
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    OrderPayType NVARCHAR(20),
    CustomerID INT,
    PaymentTypeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
);

-- Menu table
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    ItemName NVARCHAR(100),
    ItemDescription NVARCHAR(255),
    ItemPrice DECIMAL(10, 2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    MenuID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- PaymentType table
CREATE TABLE PaymentType (
    PaymentTypeID INT PRIMARY KEY,
    PaymentType NVARCHAR(50)
);