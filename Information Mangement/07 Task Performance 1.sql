CREATE DATABASE TP701
GO

USE TP701
GO

CREATE TABLE Films (
    Rank INT PRIMARY KEY,
    Peak INT,
    Title VARCHAR(100),
    "Worldwide Gross" BIGINT,
    Year INT,
    Studio VARCHAR(100)
);

INSERT INTO Films (Rank, Peak, Title, "Worldwide Gross", Year, Studio) VALUES
(1, 1, 'Avatar', 2923706026, 2009, '20th Century Fox'),
(2, 1, 'Avengers: Endgame', 2797501328, 2019, 'Marvel Studios'),
(3, 2, 'Avatar: The Way of Water', 2320250281, 2022, '20th Century Fox'),
(4, 1, 'Titanic', 2257844554, 1997, 'Paramount Pictures'),
(5, 5, 'Ne Zha 2', 215756692, 2025, 'Beijing Enlight Pictures'),
(6, 3, 'Star Wars: The Force Awakens', 2068223624, 2015, 'Lucasfilm'),
(7, 4, 'Avengers: Infinity War', 2048359754, 2018, 'Marvel Studios'),
(8, 6, 'Spider-Man: No Way Home', 1922598800, 2021, 'Marvel Studios'),
(9, 8, 'Inside Out 2', 1698633816, 2024, 'Pixar Animation Studios'),
(10, 3, 'Jurassic World', 1671537444, 2015, 'Universal Pictures'),
(11, 7, 'The Lion King', 1656943394, 2019, 'Buena Vista Pictures'),
(12, 3, 'The Avengers', 1518815515, 2012, 'Marvel Studios'),
(13, 4, 'Furious 7', 1515341399, 2015, 'Universal Pictures'),
(14, 11, 'Top Gun: Maverick', 1495696292, 2022, 'Paramount Pictures'),
(15, 10, 'Frozen 2', 1450026933, 2019, 'Walt Disney Pictures'),
(16, 14, 'Barbie', 1447038421, 2023, 'Warner Bros. Pictures'),
(17, 5, 'Avengers: Age of Ultron', 1402809540, 2015, 'Marvel Studios'),
(18, 15, 'The Super Mario Bros. Movie', 1360847665, 2023, 'Universal Pictures'),
(19, 9, 'Black Panther', 1347280838, 2018, 'Marvel Studios'),
(20, 3, 'Harry Potter and the Deathly Hallows � Part 2', 1342139727, 2011, 'Warner Bros. Pictures'),
(21, 22, 'Deadpool & Wolverine', 1338073645, 2024, 'Marvel Studios'),
(22, 9, 'Star Wars: The Last Jedi', 1332539389, 2017, 'Lucasfilm'),
(23, 12, 'Jurassic World: Fallen Kingdom', 1308473425, 2018, 'Universal Pictures'),
(24, 25, 'Frozen', 1290000000, 2013, 'Walt Disney Pictures'),
(25, 10, 'Beauty and the Beast', 1263521126, 2017, 'Walt Disney Pictures');

/* Selecting Values */

--1. The Top 3 Films released by Marvel Studios based on gross earnings.
SELECT TOP 3 * FROM Films WHERE Studio = 'Marvel Studios' ORDER BY "Worldwide Gross" DESC;

--2. The Top 5 Films based on gross and were released 2021 up to this year.
SELECT TOP 5 * FROM Films WHERE Year >= 2021 ORDER BY "Worldwide Gross" DESC;

--3. Films Titles that start with the word "The".
SELECT * FROM Films WHERE Title Like 'The%'

--4. Average earnings of the Star Wars movies.
SELECT AVG("Worldwide Gross") AS "Star Wars - Average WorldWide Gross" FROM Films WHERE Title Like 'Star Wars%'

--5. Average earnings of the "Walt Disney Pictures" Studio.
SELECT AVG("Worldwide Gross") AS "Disney Movies - Average WorldWide Gross" FROM Films WHERE Studio = 'Walt Disney Pictures'

--6. Top movie of all time based on Current Rank and Peak Rank during its release.
SELECT * FROM Films WHERE (Rank = 1) AND (Peak = 1)

--7. Average earnings of all movies which peak at the Number 1 position
SELEcT AVG("Worldwide Gross") AS "Average Worldwide Gross - Movies with Highest Peak" FROM FIlms WHERE Peak = 1

--8. Movies released between 2010 and 2019 and reached a Top 10 spot based on Gross earnings
SELECT TOP 10 * FROM Films WHERE (Year between 2010 and 2019) ORDER BY "Worldwide Gross" DESC

--9. List of movies that never made it to the Top 10 but earned more that 1 Billion dollars
SELECT * FROM Films WHERE (Peak < 10) and ("Worldwide Gross" > 1000000000)

--10. The top movie that peaked at the no. 3 position based on gross earnings.
SELECT TOP 1 * FROM Films WHERE Peak = 3 Order By "Worldwide Gross" Desc