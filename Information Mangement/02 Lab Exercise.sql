USE Lab201
GO

CREATE TABLE Customers (
	CustomerID int primary key,
	Customer_Name varchar(50),
	Address varchar(200),
	Contact_Number int,
	Email varchar(100)
);

CREATE TABLE Orders (
	OrderID int primary key,
	CustomerID int,
	Order_Date date,
	Date_Received date,
	Cost float,

	Foreign Key (CustomerID) References Customers(CustomerID)
);

CREATE TABLE Suppliers (
	SupplierID int primary key,
	Supplier_Name varchar(200),
	Address varchar(200),
	Contact_Number int,
	Email varchar(100),
);

CREATE TABLE Products (
	ProductID int primary key,
	Product_Name varchar(100),
	Category varchar(50),
	Description text,
	Price float,
	SupplierID int

	Foreign Key (SupplierID) References Suppliers(SupplierID)
);

CREATE TABLE Ordered_Products (
	OrderID int,
	ProductID int

	FOREIGN KEY (OrderID) References Orders(OrderID),
	FOREIGN KEY (ProductID) References Products(ProductID)
);
