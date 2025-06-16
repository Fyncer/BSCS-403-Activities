-- 06 Lab Exercise 3

create database ENROLLEMENT_MANAGEMENT_SYSTEM
GO
use ENROLLEMENT_MANAGEMENT_SYSTEM;
GO

create table "School Year" (
	school_yr_ID int primary key,
	school_yr varchar(13) -- to store year formats until 99999 - 99999
);

create table Course (
	course_ID int primary key,
	"name" varchar(50),
	"description" text
);

create table Instructors (
	instructor_ID int primary key,
	"name" varchar(50),
	age int check (age > 0 and age < 130), --negative numbers and beyond 130 are invalid
	gender varchar(50), --constraints not applied for genders beyond male and female
	birthdate date,
	contact_address varchar(50),
	"status" varchar(10),
);

create table Subjects (
	subject_ID int primary key,
	subject_name varchar(50),
	instructor_ID int not null,
	
	foreign key (instructor_ID) references Instructors(instructor_ID)
);

create table Students (
	stud_ID int primary key,
	fname varchar(50),
	lname varchar(50),
	gender varchar(50),
	age int check (age > 0 and age < 130),
	contact_add varchar(50),
);

create table Enrollment (
	enrollment_ID int primary key,
	stud_ID int not null,
	course_ID int not null,
	subject_ID int not null,
	school_yr_ID int not null,
	"date" date,

	foreign key (stud_ID) references Students(stud_ID),
	foreign key(course_ID) references Course(course_ID),
	foreign key(subject_ID) references Subjects(subject_ID),
	foreign key(stud_ID) references "School Year"(school_yr_ID)
);


