USE Libramonte_05TP1
GO

CREATE TABLE contact_type (
	id_contact_type INT NOT NULL PRIMARY KEY,
	"name" varchar(200) UNIQUE,
	validation_regroup varchar(200)
);

CREATE TABLE contact (
	id_contact INT null,
	id_person INT UNIQUE,
	id_contact_type INT UNIQUE,
	contact varchar(200) UNIQUE,
);

CREATE TABLE location (
	id_location INT NOT NULL PRIMARY KEY,
	city varchar(200),
	street_name varchar(200),
	street_number varchar(200),
	zip varchar(50),
	country varchar(200),
	"name" varchar(200),
	latitude float,
	longtitude float,
);

CREATE TABLE relation (
	id_relation INT PRIMARY KEY,
	id_person1 INT UNIQUE,
	id_person2 INT UNIQUE,
	description varchar(200),
	id_relation_type INT UNIQUE
);

CREATE TABLE person (
	id_person INT NOT NULL PRIMARY KEY,
	nickname varchar(200) UNIQUE,
	first_name varchar(200) UNIQUE,
	last_name varchar(200) UNIQUE,
	id_location INT,
	birth_day DATE,
	height INT,
	gender varchar(15)
);

CREATE TABLE relation_type (
	id_relation_type INT NOT NULL PRIMARY KEY,
	"name" varchar(200) UNIQUE
);

CREATE TABLE person_meeting (
	id_person INT,
	id_meeting INT,
	PRIMARY KEY(id_person, id_meeting)
);

CREATE TABLE meeting (
	id_meeting INT NOT NULL PRIMARY KEY,
	start DATETIMEOFFSET UNIQUE,
	description varchar(200),
	duration TIME UNIQUE,
	id_location INT UNIQUE
);

ALTER TABLE contact ADD FOREIGN KEY (id_person) REFERENCES person(id_person);
ALTER TABLE contact ADD FOREIGN KEY (id_contact) REFERENCES contact_type(id_contact_type);
ALTER TABLE relation ADD FOREIGN KEY (id_person1) REFERENCES person(id_person);
ALTER TABLE relation ADD FOREIGN KEY (id_person2) REFERENCES person(id_person);
ALTER TABLE relation ADD FOREIGN KEY (id_relation_type) REFERENCES relation(id_relation_type);
ALTER TABLE person ADD FOREIGN KEY (id_location) REFERENCES location(id_location);
ALTER TABLE person_meeting ADD FOREIGN KEY (id_person) REFERENCES person(id_person);
ALTER TABLE person_meeting ADD FOREIGN KEY (id_meeting) REFERENCES meeting(id_meeting);
ALTER TABLE meeting ADD FOREIGN KEY (id_location) REFERENCES location(id_location);

/*INSERT INTO contact_type (id_contact_type, "name", validation_regroup) VALUES
(1, 'Phone', '^\+\d{1,3}-\d{10}$'),
(2, 'Email', '^[\w.-]+@[\w.-]+\.\w{2,4}$'),
(3, 'Twitter', '^@\w{1,15}$'),
(4, 'LinkedIn', '^https:\/\/www\.linkedin\.com\/in\/[\w-]+$'),
(5, 'Facebook', '^https:\/\/www\.facebook\.com\/[\w.-]+$');*/

INSERT INTO contact (id_contact, id_person, id_contact_type, contact) VALUES
(1, 101, 1, '+1-1234567890'),
(2, 102, 2, 'john.doe@example.com'),
(3, 103, 3, '@jane_doe'),
(4, 104, 4, '@michaelsmith'),
(5, 105, 5, '@emilyjones');

/*INSERT INTO location (id_location, city, street_name, street_number, zip, country, "name", latitude, longtitude) VALUES
(1, 'New York', '5th Avenue', '742', '10001', 'USA', 'Times Square', 40.7580, -73.9855),
(2, 'Los Angeles', 'Sunset Blvd', '200', '90028', 'USA', 'Hollywood', 34.0928, -118.3287),
(3, 'London', 'Baker Street', '221B', 'NW1 6XE', 'UK', 'Sherlock Holmes Museum', 51.5238, -0.1586),
(4, 'Paris', 'Champs-Élysées', '150', '75008', 'France', 'Eiffel Tower', 48.8584, 2.2945),
(5, 'Tokyo', 'Shibuya', '1-1', '150-0002', 'Japan', 'Shibuya Crossing', 35.6595, 139.7004);

INSERT INTO relation (id_relation, id_person1, id_person2, description, id_relation_type) VALUES
(1, 101, 102, 'Friends', 1),
(2, 103, 104, 'Siblings', 2),
(3, 105, 101, 'Co-workers', 3),
(4, 102, 103, 'Married', 4),
(5, 104, 105, 'Neighbors', 5);

INSERT INTO person (id_person, nickname, first_name, last_name, id_location, birth_day, height, gender) VALUES
(101, 'Johnny', 'John', 'Doe', 1, '1990-05-15', 180, 'Male'),
(102, 'Janey', 'Jane', 'Doe', 2, '1992-08-20', 165, 'Female'),
(103, 'Mikey', 'Michael', 'Smith', 3, '1988-11-10', 175, 'Male'),
(104, 'Em', 'Emily', 'Jones', 4, '1995-07-25', 160, 'Female'),
(105, 'Alex', 'Alexander', 'Brown', 5, '1985-03-30', 185, 'Male');

INSERT INTO relation_type (id_relation_type, "name") VALUES
(1, 'Friendship'),
(2, 'Sibling'),
(3, 'Colleague'),
(4, 'Marriage'),
(5, 'Neighbor');

INSERT INTO person_meeting (id_person, id_meeting) VALUES
(101, 1),
(102, 1),
(103, 2),
(104, 3),
(105, 4);

INSERT INTO meeting (id_meeting, start, description, duration, id_location) VALUES
(1, '2025-03-20 10:00:00 +00:00', 'Project Kickoff', '01:30:00', 1),
(2, '2025-03-21 14:00:00 +00:00', 'Team Standup', '00:30:00', 2),
(3, '2025-03-22 16:00:00 +00:00', 'Client Call', '01:00:00', 3),
(4, '2025-03-23 09:00:00 +00:00', 'Board Meeting', '02:00:00', 4),
(5, '2025-03-24 12:00:00 +00:00', 'Networking Event', '03:00:00', 5);*/