-- 06 Lab Exercise 1

create database myDB;
use myDB;

create table Customers (
	CustomerID int primary key not null,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	Email varchar(150) not null,
	Gender varchar(20), -- No constraints to cater genders beyond male and female
	Birthdate date
);

create table Product (
	ProductID int primary key not null,
	"Description" text,
	Quantity int not null check (Quantity >= 0),
	Price float not null check (Price >= 0),
	VendorID int,
);

create table Vendors (
	VendorID int primary key not null,
	"name" varchar(50) not null,
	ContactNum varchar(15) not null,
	CityAddress varchar(200) not null
);

alter table Product add foreign key(VendorID) references Vendors(VendorID);