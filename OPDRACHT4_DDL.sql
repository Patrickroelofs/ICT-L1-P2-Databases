/* TODO: Add Foreign Keys & Primary Keys
    TODO: Check if foreign/Primary keys are correct */

/* ***************************** */
/*    Opdracht 4: Normaliseren   */
/* ***************************** */

USE Fletnix
GO

/* Drop tables for easy Execute */
DROP TABLE IF EXISTS Awards
DROP TABLE IF EXISTS Category
DROP TABLE IF EXISTS Nominees
DROP TABLE IF EXISTS Award_Status
GO


/* Opdracht 4B: Implementeer het model */
/* Table: Awards
   Award | Year | Country */
CREATE TABLE Awards (
    Award       VARCHAR(255)    NOT NULL,
    Year        NUMERIC(4)      NOT NULL,
    Country     VARCHAR(255)    NOT NULL,

    PRIMARY KEY (Award, Country)
)
GO

/* Table: Category
   Category | Award */
CREATE TABLE Category (
    Category    VARCHAR(255)    NOT NULL,
    Award       VARCHAR(255)    NOT NULL,

    PRIMARY KEY (Category, Award)
)
GO

/* Table: Nominees
   Award | Category | Movie_ID | Person_ID */
CREATE TABLE Nominees (
    Award       VARCHAR(255)    NOT NULL,
    Category    VARCHAR(255)    NOT NULL,
    Movie_id    INT             NOT NULL,
    Person_id   INT             NOT NULL,

    PRIMARY KEY (Award, Category, Movie_id, Person_id)
)
GO

/* Table: Status
   Category | Movie_ID | Person_ID | Status */
CREATE TABLE Status (
    Category    VARCHAR(255)    NOT NULL,
    Movie_id    INT             NOT NULL,
    Person_id   INT             NOT NULL,
    status      VARCHAR(1)      NOT NULL

    PRIMARY KEY (Category, Movie_id, Person_id)
)
GO




/* Opdracht 4C: Populeer de database met ontbrekende data */
/* Table Insert: Awards */
INSERT INTO Awards (Award, Year, Country)
VALUES
       ('Academy Awards',   '2000', 'The Netherlands'),
       ('BAFTA Awards',     '2000', 'New Zealand')
GO

/* Table Insert: Category */
INSERT INTO Category (Category, Award)
VALUES
	('Academy Awards',      'Best Film Editing'),
	('Academy Awards',      'Best Sound Effects Editing'),
	('Academy Awards',      'Best Visual Effects'),
	('BAFTA Awards',        'Best Sound'),
	('BAFTA Awards',        'Best Cinematography'),
	('BAFTA Awards',        'Best Production Design'),
	('BAFTA Awards',        'Best Editing')
GO

/* Table Insert: Nominees */
INSERT INTO Nominees (Award, Category, Movie_id, Person_id)
VALUES
	('Academy Awards', 'Best Film Editing', 207992, 550813),
	('Academy Awards', 'Best Film Editing', 160492, 276884),
	('Academy Awards', 'Best Film Editing', 160492, 950001),
	('Academy Awards', 'Best Film Editing', 160492, 68042),
	('Academy Awards', 'Best Film Editing', 303564, 54796),
	('Academy Awards', 'Best Sound Effects Editing', 112290, 351397),
	('Academy Awards', 'Best Sound Effects Editing', 112290, 950002),
	('Academy Awards', 'Best Sound Effects Editing', 207992, 950003),
	('Academy Awards', 'Best Sound Effects Editing', 313474, 165453),
	('Academy Awards', 'Best Visual Effects', 313474, 351981),
	('Academy Awards', 'Best Visual Effects', 313471, 191712),
	('Academy Awards', 'Best Visual Effects', 207992, 950004),
	('Academy Awards', 'Best Visual Effects', 207992, 540853),
	('Academy Awards', 'Best Visual Effects', 207992, 950005),
	('Academy Awards', 'Best Visual Effects', 207992, 950006),
	('BAFTA Awards', 'Best Sound', 207992, 950007),
	('BAFTA Awards', 'Best Sound', 207992, 950008),
	('BAFTA Awards', 'Best Sound', 207992, 950009),
	('BAFTA Awards', 'Best Sound', 207992, 950010),
	('BAFTA Awards', 'Best Sound', 207992, 950011),
	('BAFTA Awards', 'Best Sound', 313474, 165453),
	('BAFTA Awards', 'Best Sound', 313474, 950012),
	('BAFTA Awards', 'Best Sound', 13789, 950013),
	('BAFTA Awards', 'Best Cinematography', 207992, 950014),
	('BAFTA Awards', 'Best Cinematography', 19789, 950015),
	('BAFTA Awards', 'Best Production Design', 207992, 303143),
	('BAFTA Awards', 'Best Production Design', 304862, 550913),
	('BAFTA Awards', 'Best Editing', 207992, 550813),
	('BAFTA Awards', 'Best Editing', 13789, 950016),
	('BAFTA Awards', 'Best Editing', 13789, 283753)
GO

/* Table Insert: Award_Status */
INSERT INTO Status (Category, Movie_id, Person_id, status)
VALUES
	('Best Film Editing', 207992, 550813, 'W'),
	('Best Film Editing', 160492, 276884, 'N'),
	('Best Film Editing', 160492, 950001, 'N'),
	('Best Film Editing', 160492, 68042, 'N'),
	('Best Film Editing', 303564, 54796, 'N'),
	('Best Sound Effects Editing', 112290, 351397, 'N'),
	('Best Sound Effects Editing', 112290, 950002, 'N'),
	('Best Sound Effects Editing', 207992, 950003, 'W'),
	('Best Sound Effects Editing', 313474, 165453, 'N'),
	('Best Visual Effects', 313474, 351981, 'N'),
	('Best Visual Effects', 313471, 191712, 'N'),
	('Best Visual Effects', 207992, 950004, 'W'),
	('Best Visual Effects', 207992, 540853, 'W'),
	('Best Visual Effects', 207992, 950005, 'W'),
	('Best Visual Effects', 207992, 950006, 'W'),
	('Best Sound', 207992, 950007, 'W'),
	('Best Sound', 207992, 950008, 'W'),
	('Best Sound', 207992, 950009, 'W'),
	('Best Sound', 207992, 950010, 'W'),
	('Best Sound', 207992, 950011, 'W'),
	('Best Sound', 313474, 165453, 'N'),
	('Best Sound', 313474, 950012, 'N'),
	('Best Sound', 13789, 950013, 'N'),
	('Best Cinematography', 207992, 950014, 'N'),
	('Best Cinematography', 19789, 950015, 'W'),
	('Best Production Design', 207992, 303143, 'N'),
	('Best Production Design', 304862, 550913, 'W'),
	('Best Editing', 207992, 550813, 'N'),
	('Best Editing', 13789, 950016, 'W'),
	('Best Editing', 13789, 283753, 'W')
GO