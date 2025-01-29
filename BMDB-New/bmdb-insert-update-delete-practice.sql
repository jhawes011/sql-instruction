--  ch7 
-- update and delete

SELECT *
	FROM Movie;

-- insert a dummy record

INSERT INTO Movie (Title, Year, Rating, Director)
	VALUES ('TEST', 2025, 'R', 'Test Director')

	-- retrieve movie from id

SELECT * FROM Movie WHERE ID = 4

-- update test movie to test movie 2, year 2026

UPDATE Movie 
SET Title = 'Test 2', 
Year = 2026
WHERE ID = 4

--delete data

DELETE Movie
WHERE ID = 4

-- add actor into table

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
	Values	('Will', 'Ferrell', 'M', '1967-07-16'), 
			('Zooey', 'Deschanel', 'F', '1980-01-17'),
			('Peter', 'Dinklage', 'M', '1969-06-11'),
			('John', 'Reilly', 'M', '1965-04-24'),
			('Mary', 'Steenburgen', 'F', '1953-02-08');

SELECT * FROM Actor; 
SELECT * FROM Movie;
SELECT * FROM Credit;

--  xredits:
-- Elf (2):
-- Will Ferrell (4) - Buddy
-- Zooey Deschanel (5) - Jovie
-- Peter Dinklage (6) - Miles Finch
-- Mary Steenburgen (8) - Emily Hobbs

-- Step Brothers (1)
--	Will Ferrell (4) - Brennan Huff
--	John Reilly (7) - Dale Doback
--	Mary Steenburgen (8) - Nancy Huff
		
INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(2, 1, 'Buddy'),
	(2, 2, 'Jovie'),
	(2, 3, 'Miles Finch'),
	(2, 5, 'Emily Hobbs'),
	(1, 1, 'Brennan Hobbs'),
	(1, 4, 'Dale Doback'),
	(1, 5, 'Nancy Huff');

-- ALTER TABLE add foreign key

