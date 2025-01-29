--  BMDB Data
-- insert movie records
USE BMDB
GO

INSERT INTO Movie (Title, [Year], Rating, Director)
VALUES	('Step Brothers', 2008, 'R', 'Adam McKay'), 
		('Elf', 2003, 'PG', 'Jon Favreau'),
		('Batman Begins', 2005, 'PG-13', 'Christopher Nolan'), ('Mrs.Doubtfire', 1993, 'PG-13', 'Chris Columbus'),
		('Tomorrow Never Dies', 1997, 'PG-13', 'Roger Spottiswoode');

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
	Values	('Will', 'Ferrell', 'M', '1967-07-16'), 
			('Zooey', 'Deschanel', 'F', '1980-01-17'),
			('Peter', 'Dinklage', 'M', '1969-06-11'),
			('John', 'Reilly', 'M', '1965-04-24'),
			('Mary', 'Steenburgen', 'F', '1953-02-08'), ('Robin', 'Williams', 'M', '2014-08-11'),
			('Sally', 'Fields', 'F', '1946-11-06'),
			('Pierce', 'Brosnan', 'M', '1953-04-16'),
			('Jonathan', 'Pryce', 'M', '1947-06-01'),
			('Michelle', 'Yeoh', 'F', '1962-08-06');

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(2, 1, 'Buddy'),
	(2, 2, 'Jovie'),
	(2, 3, 'Miles Finch'),
	(2, 5, 'Emily Hobbs'),
	(1, 1, 'Brennan Hobbs'),
	(1, 4, 'Dale Doback'),
	(1, 5, 'Nancy Huff'), (4,8, 'Mrs.Doubtfire / Daniel Hilliard'), (4, 9, 'Miranda Hilliard'), (4,10, 'Stuart Dunmeyer'),
		(5, 10, 'James Bond'), (5,12, 'Wai Lin'), (5, 11, 'Elliot Carver');

