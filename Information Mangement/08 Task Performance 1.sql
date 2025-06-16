CREATE DATABASE LAB801

use LAB801
go

CREATE TABLE StudentGrade (
	CourseCode varchar(200),
	CourseTitle varchar(200),
	Units int,
	Grade decimal(3,2)
);

INSERT INTO StudentGrade (CourseCode, CourseTitle, Units, Grade) VALUES
	('COSC1003', 'Data Structures and Algorithms', 3, 1.50),
	('GEDC1006', 'Readings in Philippine History', 3, 2.25),
	('PHED1003', 'Physical Education 3', 2, 1.25),
	('GEDC1014', 'Rizal�s Life and Works', 3, 1.50),
	('COSC1007', 'Human-Computer Interaction', 3, 1.25),
	('INTE1044', 'Object-Oriented Programming', 3, 1.75),
	('COSC1001', 'Principles of Communication', 3, 2.25),
	('COSC1008', 'Platform Technology', 3, 1.50);

-- a. The Number of Course / Subjects
SELECT COUNT(CourseCode) FROM StudentGrade;

-- b. Total Units
SELECT SUM(Units) FROM StudentGrade;

-- c. The number of courses with grades higher than 2.00
SELECT COUNT(Grade) FROM StudentGrade WHERE Grade < 2.00;

-- d. The number of courses with grades lower than 2.00 
SELECT COUNT(Grade) FROM StudentGrade WHERE Grade > 2.00;

-- e. The GWA (Sum of all the products of units and grades, then divide by the total unit
SELECT SUM(Units*Grade) / SUM(Units) FROM StudentGrade