CREATE DATABASE eLMSAct802
GO
	
USE eLMSAct802
GO

CREATE TABLE Users (
	UserID int primary key,
	Username varchar(200),
	DateCreated date  -- (Alternatively, should be named as 'UsersDateCreated') to avoid confusion with the Picture table column
);

CREATE TABLE Pictures (
	PictureID int primary key,
	FileName varchar(200),
	UserID int,
	DateCreated date,  -- (Alternatively, should be named as 'PicDateCreated') to avoid confusion with the Picture table column

	FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (UserID, Username, DateCreated) VALUES 
	(001, 'sparsley0', '2019-02-19'),
	(002, 'dsumshon1', '2018-12-24'),
	(003, 'hpointing2', '2018-12-11'),
	(004, 'smannagh3', '2018-08-05'),
	(005, 'gstarsmore4', '2018-07-09'),
	(006, 'dzuann5', '2019-01-09');

INSERT INTO Pictures (PictureID, FileName, UserID, DateCREATED) VALUES 
	(1001, 'laptop.jpeg', 003, '2019-02-07'),
	(1002, 'sti_orca.jpeg', 007, '2019-09-04'),
	(1003, 'home.jpeg', 005, '2019-02-16'),
	(1004, 'bsit.jpeg', 001, '2019-10-19');

-- Full Join
Select Users.Username, Pictures.Filename FROM Users Full Join Pictures on Users.UserID = Pictures.PictureID;

-- Inner Join
Select Users.Username, Pictures.Filename FROM Users Inner Join Pictures on Users.UserID = Pictures.PictureID;

-- Left Join
Select Users.Username, Pictures.Filename FROM Users Left Join Pictures on Users.UserID = Pictures.PictureID;

-- Right Join
Select Users.Username, Pictures.Filename FROM Users Right Join Pictures on Users.UserID = Pictures.PictureID;
