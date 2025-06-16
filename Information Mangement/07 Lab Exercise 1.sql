CREATE DATABASE LAB701
GO

use LAB701
GO

CREATE TABLE Salesman (
	Salesman_ID int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	City varchar(50), 
	Commission float
);

INSERT INTO Salesman (Salesman_ID, FirstName, LastName, City, Commission) VALUES 
	(5001, 'James', 'Paul', 'New York', 15.00),
	(5002, 'Nail', 'Knite', 'Paris', 10.00), 
	(5003, 'Pit', 'Alex', 'London', 11.00), 
	(5004, 'Mc', 'Lyon', 'Paris', 12.00), 
	(5005, 'Adam', 'Paul', 'New York', 10.00), 
	(5006, 'Lauson', 'Peters', 'Rome', 16.00);


-- 1. Retrieve all the records from the table
SELECT * FROM Salesman;

-- 2. Select all the unique values from the "city" values
SELECT DISTINCT City FROM Salesman;

-- 3. List down all agent names starting with the Last Name followed by the First Name and arranged alphabetically.
SELECT LastName, FirstName FROM Salesman ORDER BY LastName ASC;

-- 4. Select all salesman's first name and last name with a commission that is higher than $12.
SELECT FirstName, LastName FROM Salesman WHERE Commission > 12.00;

-- 5. List down the commission of the two salesman whose last name is "Paul".
SELECT Commission FROM Salesman WHERE LastName = 'Paul';

-- 6. Select all records of salesmen in the Paris area.
SELECT * FROM Salesman WHERE City = 'Paris'