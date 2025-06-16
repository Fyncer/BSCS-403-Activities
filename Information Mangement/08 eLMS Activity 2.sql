CREATE DATABASE eLMSAct802

use eLMSAct802
GO

CREATE TABLE Vendors (
	VendorID varchar(50) primary key not null,
	VendorName varchar(200),
	ContactNum varchar(200)
);

CREATE TABLE Items (
	ItemID varchar(200) primary key not null,
	ItemDesc text,
	VendorID varchar(50),

	FOREIGN KEY (VendorID) references Vendors(VendorID)
);

INSERT INTO Vendors (VendorID, VendorName, ContactNum) VALUES 
	('V00001', 'Universal Robina Corporation', '8633-7631'),
	('V00002', 'Liwayway Marketing Corporation', '8844-8441'),
	('V00003', 'Monde Nissin', '7759-7500'),
	('V00004', 'W.L FOOD PRODUCTS', '8800-3405');

INSERT INTO Items (ItemID, ItemDesc, VendorID) VALUES 
	('P000101', 'Jack n Jill Piatos', 'V00001'),
	('P000102', 'Jack n Jill Nova', 'V00001'),
	('P001005', 'Oishi Prawn Crackers', 'V00002'),
	('P030007', 'Regent Cheese Ring', 'V00004');

-- Full Join
Select Vendors.VendorName, Items.ItemDesc FROM Vendors Full Join Items on Vendors.VendorID = Items.VendorID;

-- Inner Join
Select Vendors.VendorName, Items.ItemDesc FROM Vendors Inner Join Items on Vendors.VendorID = Items.VendorID;

-- Left Join
Select Vendors.VendorName, Items.ItemDesc FROM Vendors Left Join Items on Vendors.VendorID = Items.VendorID;

-- Right Join
Select Vendors.VendorName, Items.ItemDesc FROM Vendors Right Join Items on Vendors.VendorID = Items.VendorID;