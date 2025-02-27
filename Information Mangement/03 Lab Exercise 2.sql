CREATE DATABASE LIBRARY;
GO

USE LIBRARY;
GO

--Creating Tables
CREATE TABLE Members (
    CardNo CHAR(5) NOT NULL PRIMARY KEY,
    Surname CHAR(15) NOT NULL,
    Name CHAR(15) NOT NULL,
    Address CHAR(150),
    Birthday_date DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Phone_No CHAR(15)
);

CREATE TABLE Employees (
    EmpID CHAR(5) PRIMARY KEY,
    Surname CHAR(15) NOT NULL,
    Name CHAR(15) NOT NULL,
    Birthday_date DATE NOT NULL
);

CREATE TABLE Publishers (
    PubID CHAR(5) PRIMARY KEY,
    Name CHAR(50) NOT NULL,
    City CHAR(50) NOT NULL,
    Phone_num CHAR(15)
);

CREATE TABLE Books (
    BookID CHAR(5) PRIMARY KEY,
    Pub_ID CHAR(5),
    FOREIGN KEY (Pub_ID) REFERENCES Publishers(PubID),
    Type CHAR(20) CHECK (Type IN ('novel', 'historical', 'for kids', 'poems', 'crime story', 'science fiction', 'science')),
    Price MONEY NOT NULL,
    Title CHAR(40) NOT NULL
);

CREATE TABLE BOOK_LOANS (
    LoanID INT IDENTITY(1, 1) PRIMARY KEY,
    CardNo CHAR(5),
    FOREIGN KEY (CardNo) REFERENCES Members(CardNo),
    BookID CHAR(5),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    EmpID CHAR(5),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    DateOut DATE,
    DateDue DATE,
    Penalty DECIMAL(10, 2) CHECK (Penalty >= 0) DEFAULT 0
);

-- INSERTING VALUES
INSERT INTO Members (CardNo, Surname, Name, Address, Birthday_date, Gender, Phone_No) VALUES
('00001', 'Smith', 'John', '123 Elm St', '1985-01-01', 'M', '5551234567'),
('00002', 'Doe', 'Jane', '456 Oak St', '1990-02-14', 'F', '5552345678'),
('00003', 'Brown', 'Charlie', '789 Pine St', '1995-03-21', 'M', '5553456789'),
('00004', 'Johnson', 'Emily', '101 Maple St', '2000-04-30', 'F', '5554567890'),
('00005', 'Davis', 'Michael', '202 Birch St', '1988-05-15', 'M', '5555678901');

INSERT INTO Employees (EmpID, Surname, Name, Birthday_date) VALUES
('E0001', 'Clark', 'Amanda', '1983-06-10'),
('E0002', 'Taylor', 'Samuel', '1978-07-22'),
('E0003', 'Moore', 'Nancy', '1992-08-05'),
('E0004', 'Harris', 'George', '1986-09-13'),
('E0005', 'Lewis', 'Sophia', '1999-10-27');

INSERT INTO Publishers (PubID, Name, City, Phone_num) VALUES
('P0001', 'Penguin Books', 'New York', '5551112222'),
('P0002', 'HarperCollins', 'London', '5553334444'),
('P0003', 'Simon & Schuster', 'Los Angeles', '5555556666'),
('P0004', 'Macmillan', 'San Francisco', '5557778888'),
('P0005', 'Hachette', 'Paris', '5559990000');

INSERT INTO Books (BookID, Pub_ID, Type, Price, Title) VALUES
('B0001', 'P0001', 'novel', 19.99, 'The Great Adventure'),
('B0002', 'P0002', 'historical', 29.99, 'History of Time'),
('B0003', 'P0003', 'for kids', 9.99, 'Fun with Numbers'),
('B0004', 'P0004', 'science fiction', 24.99, 'Galactic Wars'),
('B0005', 'P0005', 'poems', 14.99, 'Whispers of the Soul');

INSERT INTO BOOK_LOANS(CardNo, BookID, EmpID, DateOut, DateDue, Penalty) VALUES
('00001', 'B0001', 'E0001', '2025-01-01', '2025-01-15', 0),
('00002', 'B0002', 'E0002', '2025-01-05', '2025-01-20', 0),
('00003', 'B0003', 'E0003', '2025-01-10', '2025-01-25', 0),
('00004', 'B0004', 'E0004', '2025-01-15', '2025-01-30', 0),
('00005', 'B0005', 'E0005', '2025-01-20', '2025-02-04', 0);
