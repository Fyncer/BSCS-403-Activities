-- Create the database
CREATE DATABASE LIBRAMONTE_03LAB4;
GO

USE LIBRAMONTE_03LAB4;
GO

/* Create tables and specify primary keys */
CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY NOT NULL,
    textDescription VARCHAR(MAX), 
    htmldescription VARCHAR(MAX),
    image VARBINARY(MAX) 
);

CREATE TABLE products (
    productCode INT PRIMARY KEY NOT NULL,
    productName VARCHAR(50),
    productLine VARCHAR(50) NULL,
    productScale VARCHAR(20),
    productVendor VARCHAR(50),
    productDescription VARCHAR(MAX),
    quantityInStock INT,
    buyPrice DECIMAL(10, 2), 
    MSRP DECIMAL(10, 2)
);

CREATE TABLE orderdetails (
    orderNumber INT NOT NULL,
    productCode INT,
    quantityOrdered INT,
    priceEach DECIMAL(10, 2),
    orderLineNumber INT,
    PRIMARY KEY (orderNumber, productCode)
);

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY NOT NULL,
    orderDate DATETIME,
    requiredDate DATETIME,
    shippedDate DATETIME,
    status VARCHAR(20), -- Increased size for flexibility
    comments VARCHAR(MAX), -- Changed from TEXT for better compatibility
    customerNumber INT NULL
);

CREATE TABLE customers (
    customerNumber INT PRIMARY KEY NOT NULL,
    customerName VARCHAR(50),
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50), 
    phone VARCHAR(20), 
    addressLine1 VARCHAR(100), 
    addressLine2 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(20),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit DECIMAL(10, 2)
);

CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50), 
    firstName VARCHAR(50), 
    extension VARCHAR(20),
    email VARCHAR(100),
    officeCode INT NULL,
    reportsTo INT NULL,
    jobTitle VARCHAR(50)
);

CREATE TABLE offices (
    officeCode INT PRIMARY KEY NOT NULL,
    city VARCHAR(50),
    phone VARCHAR(20),
    addressLine1 VARCHAR(100), -- Increased size for flexibility
    addressLine2 VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(50),
    postalCode VARCHAR(20),
    territory VARCHAR(50)
);

CREATE TABLE payments (
    customerNumber INT,
    checkNumber VARCHAR(20), 
    paymentDate DATETIME,
    amount DECIMAL(10, 2),
    PRIMARY KEY (customerNumber, checkNumber)
);


ALTER TABLE products ADD FOREIGN KEY (productLine) REFERENCES productlines(productLine);

ALTER TABLE orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber);
ALTER TABLE orderdetails ADD FOREIGN KEY (productCode) REFERENCES products(productCode);

ALTER TABLE orders ADD FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber);

ALTER TABLE customers ADD FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber);

ALTER TABLE payments ADD FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber);

ALTER TABLE employees ADD FOREIGN KEY (officeCode) REFERENCES offices(officeCode);
ALTER TABLE employees ADD FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber);

/* Insert 5 values per record */

INSERT INTO productlines (productLine, textDescription, htmldescription, image) VALUES
('Casual Wear', 'Everyday comfortable clothing', '<p>Everyday comfortable clothing</p>', NULL),
('Formal Wear', 'Elegant attire for special occasions', '<p>Elegant attire for special occasions</p>', NULL),
('Sportswear', 'Activewear for various sports', '<p>Activewear for various sports</p>', NULL),
('Outerwear', 'Jackets and coats for different seasons', '<p>Jackets and coats for different seasons</p>', NULL),
('Accessories', 'Fashionable additions to outfits', '<p>Fashionable additions to outfits</p>', NULL);

INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) VALUES
(1, 'Los Angeles', '+19876543210', '500 Sunset Blvd', NULL, 'CA', 'USA', '90001', 'West Coast'),
(2, 'New York', '+18765432109', '123 Broadway St', NULL, 'NY', 'USA', '10001', 'East Coast'),
(3, 'Chicago', '+17654321098', '456 Lakeshore Dr', NULL, 'IL', 'USA', '60007', 'Midwest'),
(4, 'Miami', '+16543210987', '789 Ocean Blvd', NULL, 'FL', 'USA', '33101', 'Southeast'),
(5, 'San Francisco', '+15432109876', '321 Bay St', NULL, 'CA', 'USA', '94101', 'West Coast');

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) VALUES
(101, 'Smith', 'John', 'Jr.', 'john.smith@example.com', 1, NULL, 'Manager'),
(102, 'Doe', 'Jane', NULL, 'jane.doe@example.com', 1, 101, 'Sales Representative'),
(103, 'Taylor', 'Chris', NULL, 'chris.taylor@example.com', 2, 101, 'Logistics Coordinator'),
(104, 'Anderson', 'Kelly', NULL, 'kelly.anderson@example.com', 3, 103, 'Fashion Designer'),
(105, 'Martinez', 'Luis', 'III', 'luis.martinez@example.com', 4, 102, 'Sales Representative');

INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) VALUES
(3001, 'Salvador Gascon Jr.', 'Gascon', 'Salvador', '+1234567890', '123 Flame Tree Rd,', 'Ortigas Ave Ext, Cainta, 1900 Rizal', 'Makati', 'Metro Manila', '1220', 'Philippines', 101, 5000.00),
(3002, 'Black Man', 'Brown', 'Mike', '+2345678901', '456 Fashion Ln', NULL, 'New York', 'NY', '10001', 'USA', 102, 4000.00),
(3003, 'Tanaka Hiroshi', 'Tanaka', 'Hiroshi', '+81345678901', '789 Fashion Blvd', 'Shibuya', 'Tokyo', NULL, '150-0002', 'Japan', 103, 6000.00),
(3004, 'Mumbai Shower Department', 'Patel', 'Priya', '+91226789012', '321 Designer Rd', 'Andheri', 'Mumbai', 'MH', '400053', 'India', 104, 7000.00),
(3005, 'Trendy Accessories', 'Wilson', 'Laura', '+5678901234', '654 Chic Dr', NULL, 'San Francisco', 'CA', '94101', 'USA', 105, 8000.00);

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) VALUES
(5001, '2024-03-10', '2025-03-15', '2025-03-12', 'Shipped', 'Delivered on time', 3001),
(5002, '2024-03-11', '2025-03-16', '2025-03-14', 'Shipped', 'No issues', 3002),
(5003, '2024-03-12', '2025-03-17', '2025-03-15', 'Shipped', 'Fast delivery', 3003),
(5004, '2024-03-13', '2025-03-18', '2025-03-16', 'Shipped', 'Customer requested gift wrap', 3004),
(5005, '2024-03-14', '2025-03-19', '2025-03-17', 'Shipped', 'No comments', 3005);

INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) VALUES
(101, 'Denim Jacket', 'Outerwear', 'M', 'Levi''s', 'Stylish and durable denim jacket', 50, 60.00, 80.00),
(102, 'Running Shoes', 'Sportswear', '10', 'Nike', 'Lightweight and comfortable running shoes', 30, 90.00, 120.00),
(103, 'Tuxedo Suit', 'Formal Wear', 'L', 'Armani', 'Premium tuxedo for formal occasions', 20, 300.00, 400.00),
(104, 'Graphic T-shirt', 'Casual Wear', 'M', 'H&M', 'Trendy graphic print t-shirt', 100, 20.00, 30.00),
(105, 'Leather Handbag', 'Accessories', 'One Size', 'Gucci', 'Luxury leather handbag', 15, 500.00, 700.00);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) VALUES
(5001, 101, 2, 80.00, 1),
(5001, 102, 1, 120.00, 2),
(5002, 103, 3, 400.00, 3),
(5003, 104, 1, 30.00, 7),
(5004, 105, 2, 700.00, 9);

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
(3001, '987654321', '2025-03-12', 500.00),
(3002, '876543210', '2025-03-14', 400.00),
(3003, '765432109', '2025-03-15', 600.00),
(3004, '654321098', '2025-03-16', 700.00),
(3005, '543210987', '2025-03-17', 800.00);
