CREATE DATABASE LAB501
GO

USE LAB501
GO

CREATE TABLE contact_type (
	id_contact_type int primary key,
	contact_name varchar(200),
	validation_regexp varchar(200)
);

CREATE TABLE relation_type (
	id_relation_type int primary key,
	relation_name varchar(200)
);

CREATE TABLE "location" (
	id_location int primary key,
	city varchar(200),
	street_name varchar(200),
	street_number int,
	zip varchar(50),
	country varchar(200),
	location_name varchar(200),
	latitude numeric,
	longtitude numeric
);

CREATE TABLE person (
	id_person int primary key,
	nickname varchar(200),
	first_name varchar(200),
	last_name varchar(200),
	id_location int, --connect to location
	birth_day date,
	height int,
	gender varchar(50)

	foreign key (id_location) references location(id_location)
);

CREATE TABLE contact (
	id_contact int primary key,
	id_person int,
	id_contact_type int, 
	contact varchar(200)

	foreign key (id_person) references person(id_person),
	foreign key (id_contact_type) references contact_type(id_contact_type)
);

CREATE TABLE meeting (
	id_meeting int primary key,
	"start" datetimeoffset,
	meeting_description varchar(200),
	duration time,
	id_location int,

	foreign key (id_location) references location(id_location)
);

CREATE TABLE relation (
	id_relation int primary key,
	id_person1 int,
	id_person2 int,
	relation_description varchar(200),
	id_relation_type int,

	foreign key (id_person1) references person(id_person),
	foreign key (id_person2) references person(id_person),
	foreign key (id_relation_type) references relation_type(id_relation_type)
);

CREATE TABLE person_meeting (
	id_person int,
	id_meeting int,

	foreign key (id_person) references person(id_person),
	foreign key (id_meeting) references meeting(id_meeting)
);


