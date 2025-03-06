/* Create Database */

CREATE DATABASE Libramonte_03Lab3
GO

/* Use Database */

USE Libramonte_03Lab3
GO

/* Table Creation */

CREATE TABLE genre (
    id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

CREATE TABLE game (
    id INT PRIMARY KEY,
    genre_id INT,
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    genre_name VARCHAR(50)
);

CREATE TABLE publisher (
    id INT PRIMARY KEY,
    publisher_name VARCHAR(50)
);

CREATE TABLE game_publisher (
    id INT PRIMARY KEY,
    game_id INT,
    FOREIGN KEY(game_id) REFERENCES game(id),
    publisher_id INT,
    FOREIGN KEY(publisher_id) REFERENCES publisher(id)
);

CREATE TABLE platform (
    id INT PRIMARY KEY,
    platform_name VARCHAR(50)
);

CREATE TABLE game_platform (
    id INT PRIMARY KEY,
    game_publisher_id INT,
    FOREIGN KEY(game_publisher_id) REFERENCES game_publisher(id),
    platform_id INT,
    FOREIGN KEY(platform_id) REFERENCES platform(id),
    release_year INT
);

CREATE TABLE region (
    id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

CREATE TABLE region_sales (
    region_id INT,
    FOREIGN KEY(region_id) REFERENCES region(id),
    game_platform_id INT,
    FOREIGN KEY(game_platform_id) REFERENCES game_platform(id),
	PRIMARY KEY (region_id, game_platform_id),
    num_sales INT
);

/* Value insertion */

INSERT INTO genre (id, genre_name) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'RPG'),
(4, 'Simulation'),
(5, 'Strategy');

INSERT INTO game (id, genre_id, genre_name) VALUES
(1, 1, 'Call of Duty: Black Ops 6'),
(2, 2, 'Split Fiction'),
(3, 3, 'Baldur''s Gate 3'),
(4, 4, 'Microsoft Flight Simulator'),
(5, 5, 'Civilization 7');

INSERT INTO publisher (id, publisher_name) VALUES
(1, 'Activision'),
(2, 'Electronic Arts'),
(3, 'Laurian Studios'),
(4, 'Microsoft'),
(5, '2K');

INSERT INTO game_publisher (id, game_id, publisher_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO platform (id, platform_name) VALUES
(1, 'PC'),
(2, 'Xbox'),
(3, 'PlayStation'),
(4, 'Switch'),
(5, 'Mobile');

INSERT INTO game_platform (id, game_publisher_id, platform_id, release_year) VALUES
(1, 1, 3, 2024),
(2, 2, 3, 2025),
(3, 3, 3, 2023),
(4, 4, 3, 2024),
(5, 5, 3, 2025);

INSERT INTO region (id, region_name) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'South America'),
(5, 'Australia');

INSERT INTO region_sales (region_id, game_platform_id, num_sales) VALUES
(1, 3, 2360245),
(2, 3, 550407),
(3, 3, 600832),
(4, 3, 373916),
(5, 3, 151301);