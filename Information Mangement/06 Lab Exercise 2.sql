--create database Inventory_Management
use Inventory_Management

create table Category (
	Category_ID int primary key,
	Category_Name varchar(50),
	"Description" text,
);

create table Supplier (
	Supplier_ID int primary key,
	Supplier_Name varchar(50),
	Contact_Name varchar(50),
	Phone int,
	Email varchar(50),
	Address varchar(200),
);

create table "Sales Order" (
	Sales_Order_ID int primary key,
	Customer_Name varchar(50),
	Order_Date datetime,
	Total_Amount int,
	"Status" varchar(50),
);

create table "Product" (
	Product_ID int primary key,
	Category_ID int not null,
	Supplier_ID int not null,
	"Name" varchar(50),
	"Description" text,
	Price float check (Price >= 0.0),
	Quantity_Stock int check (Quantity_Stock >= 0.0),
	Reorder_level float,

	foreign key(Category_ID) references Category(Category_ID),
	foreign key(Supplier_ID) references Supplier(Supplier_ID)
);

create table "Purchase Order" (
	Purchase_Order_ID int primary key,
	Supplier_ID int not null,
	Order_Date datetime,
	Total_Amount int check (Total_Amount >= 0),
	"Status" varchar(50)

	foreign key (Supplier_ID) references Supplier(Supplier_ID)
);

create table "Inventory Transaction" (
	Transaction_ID int primary key,
	Product_ID int not null,
	Purchase_Order_ID int not null,
	Sales_Order_ID int not null,
	Quantity int check (Quantity >= 0),
	Transaction_Date datetime,

	foreign key (Product_ID) references Product(Product_ID),
	foreign key (Purchase_Order_ID)references "Purchase Order"(Purchase_Order_ID),
	foreign key (Sales_Order_ID) references "Sales Order"(Sales_Order_ID)
);

create table "Purchase Order Item" (
	Purchase_Order_Item_ID int primary key,
	Purchase_Order_ID int not null,
	Product_ID int not null,
	Quantity int,
	Unit_Price float,
	Total_Prce float

	foreign key (Product_ID) references "Product"(Product_ID),
	foreign key (Purchase_Order_ID) references "Purchase Order"(Purchase_Order_ID)
);