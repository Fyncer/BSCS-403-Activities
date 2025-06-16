CREATE DATABASE LAB702
GO

USE LAB702
GO

CREATE TABLE studentList (
	ID_NO int primary key not null,
	LastName varchar(50),
	FirstName varchar(50),
	MI char(1) CHECK (MI BETWEEN 'A' AND 'Z'), 
	Section varchar(10),
	Quiz1 int check (Quiz1 >= 0 and Quiz1 <= 100), 
	Quiz2 int check (Quiz2 >= 0 and Quiz2 <= 100),
	Quiz3 int check (Quiz3 >= 0 and Quiz3 <= 100),
	Total int check (Total >= 0 and Total <= 300)
);

INSERT INTO studentList (ID_NO, LastName, FirstName, MI, Section, Quiz1, Quiz2, Quiz3, Total) VALUES 
(2000012345, 'Brenan', 'Creek', 'T', 'CS101', 100, 98, 63, 261),
(2000150485, 'Alba', 'Horatio', 'G', 'CS102', 75, 54, 85, 214), 
(2000132512, 'Shakleford', 'Beauden', 'A', 'CS103', 50, 61, 75, 186), 
(2000001256, 'Asher', 'Troy', 'B', 'CS102', 35, 45, 81, 161), 
(2000015247, 'Hennesy', 'Fabio', 'L', 'CS101', 48, 23, 82, 153), 
(2000075463, 'Appleton', 'Zechariah', 'C', 'CS101', 65, 80, 94, 239),
(2000143575, 'Edgar', 'Banks', 'M', 'CS103', 89, 87, 83, 259),
(2000124756, 'Ramsay', 'Zach', 'S', 'CS102', 91, 94, 84, 269),
(2000046510, 'Harry', 'Dallas', 'M', 'CS103', 100, 86, 95, 281),
(2000364585, 'Fox', 'Ronin', 'I', 'CS101', 53, 75, 100, 228);

/* Selecting Values */

--1. List down all students that have passed all 3 quizzes
SELECT LastName, FirstName FROM studentList WHERE Quiz1 >= (100*0.5) AND Quiz2 >= (100*0.5) AND Quiz3 >= (100*0.5);

--2. Compute for the average scores of the students in all 3 quizzes and list them in alphabetical order
SELECT LastName, FirstName, (Total / 3) AS Average FROM studentList ORDER BY lastName;

--3. List down all passing students (in terms of total points scored) in Section CS101
SELECT * FROM studentList WHERE Total >= (Total*0.50) AND SECTION = 'CS101'

--4. List down all students from section CS102
SELECT * FROM studentList WHERE Section = 'CS102'

--5. List down all students who have failed in one or more quizzes
SELECT * FROM studentList WHERE Quiz1 < (100*0.5) or Quiz2 < (100 * 0.5) or Quiz3 < (100 * 0.5)

--6. List down all students from section CS103 that have scored 75 and above in all 3 quizzes
SELECT * FROM studentList WHERE Section = 'CS103' AND Quiz1 >= 75 AND Quiz2 >= 75 AND Quiz3 >= 75

--7. List down all students that have last names starting with A until H and have passed all 3 quizzes
SELECT * FROM studentList WHERE (LastName Between 'A' and 'I') AND Quiz1 > (100*0.5) AND Quiz2 > (100 * 0.5) AND Quiz3 > (100 * 0.5)

--8 List down all students starting from CS101 up to CS103
SELECT * FROM studentList ORDER BY Section

--9. Display the ID Numbers of those who have failed Quiz no. 3
SELECT ID_NO FROM studentList WHERE Quiz3 < (100*0.5)

--10. Display the Names of Students who had passed Quiz no. 1 and 2
Select LastName, FirstName FROM studentList WHERE Quiz1 > 100*0.5 AND Quiz2 > 100*0.5
