/* ***************************** */
/*    Opdracht 4: Normaliseren   */
/* ***************************** */

USE Fletnix
GO

/* Drop tables for easy Execute */
DROP TABLE IF EXISTS Nominations
DROP TABLE IF EXISTS Awards
DROP TABLE IF EXISTS Status
GO


/* Opdracht 4B: Implementeer het model */
/* Table: Status
   Status | StatusName */
CREATE TABLE Status (
    Status      VARCHAR(1)      NOT NULL,
    StatusName  VARCHAR(255)    NOT NULL,

    PRIMARY KEY (Status)
)
GO

/* Table: Awards
   Award | Year | Country */
CREATE TABLE Awards (
    Award       VARCHAR(255)    NOT NULL,
    Year        INT             NOT NULL,
    Country     VARCHAR(50)     NOT NULL,

    PRIMARY KEY (Award, Year),

    FOREIGN KEY (Country) REFERENCES Country (country_name)
)
GO

/* Table: Nominations
   Award | Year | Category | Movie_ID | Person_ID | Status */
CREATE TABLE Nominations (
    Award       VARCHAR(255)    NOT NULL,
    Year        INT             NOT NULL,
    Category    VARCHAR(255)    NOT NULL,
    Movie_id    INT             NOT NULL,
    Person_id   INT             NOT NULL,
    Status      VARCHAR(1)      NOT NULL,

    PRIMARY KEY (Award, Year, Category, Movie_id, Person_id),

    FOREIGN KEY (Award, Year)   REFERENCES Awards (Award, Year),
    FOREIGN KEY (Movie_id)      REFERENCES Movie (Movie_id),
    FOREIGN KEY (Person_id)     REFERENCES Person (Person_id),
    FOREIGN KEY (Status)        REFERENCES Status (Status)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

/* Opdracht 4C: Populeer de database met ontbrekende data */

/* INSERT INTO: Status */
INSERT INTO Status (Status, StatusName)
VALUES ('W', 'Won'),
       ('N', 'Nominated')
GO

/* INSERT INTO: Awards
   Alter Country "The Netherlands" because of Foreign Key conflict (wrong name in Fletnix_DOCENT database) */
UPDATE  Country
SET     country_name = 'The Netherlands'
WHERE   country_name = 'Netherlands'
GO

INSERT INTO Awards (Award, Year, Country)
VALUES ('Academy Awards',  2000, 'The Netherlands'),
       ('BAFTA Awards',    2000, 'New Zealand')
GO

/* Persons who do not exist in Awards Model */
/*
    SELECT * FROM Person WHERE firstname = 'Paul' AND lastname = 'Rubell'
    SELECT * FROM Person WHERE firstname = 'Richard' AND lastname = 'Hymns'
    SELECT * FROM Person WHERE firstname = 'Dane' AND lastname = 'Davis'
    SELECT * FROM Person WHERE firstname = 'John' AND lastname = 'Gaeta'
    SELECT * FROM Person WHERE firstname = 'Steve' AND lastname = 'Courtley'
    SELECT * FROM Person WHERE firstname = 'Jon' AND lastname = 'Thum'
    SELECT * FROM Person WHERE firstname = 'David' AND lastname = 'Lee'
    SELECT * FROM Person WHERE firstname = 'John' AND lastname = 'Reitz'
    SELECT * FROM Person WHERE firstname = 'Gregg' AND lastname = 'Rudloff'
    SELECT * FROM Person WHERE firstname = 'David' AND lastname = 'Campbell'
    SELECT * FROM Person WHERE firstname = 'Dane' AND lastname = 'Davis'
    SELECT * FROM Person WHERE firstname = 'Tom' AND lastname = 'Bellfort'
    SELECT * FROM Person WHERE firstname = 'Bob' AND lastname = 'Beemer'
    SELECT * FROM Person WHERE firstname = 'Bill' AND lastname = 'Pope'
    SELECT * FROM Person WHERE firstname = 'Conrad' AND lastname = 'Hall'
    SELECT * FROM Person WHERE firstname = 'Tariq' AND lastname = 'Anwar'
*/

/* Insert the persons who do not exist into Person with corresponding ID from Awards Model */
INSERT INTO Person (person_id, lastname, firstname, gender)
VALUES (950001, 'Rubell', 'Paul', 'M'),
       (950002, 'Hymns', 'Richard', 'M'),
       (950003, 'Davis', 'Dane', 'M'),
       (950004, 'Gaeta', 'John', 'M'),
       (950005, 'Steve', 'Courtley', 'M'),
       (950006, 'Thum', 'John', 'M'),
       (950007, 'Lee', 'David', 'M'),
       (950008, 'Reitz', 'John', 'M'),
       (950009, 'Rudloff', 'Gregg', 'M'),
       (950010, 'Campbell', 'David', 'M'),
       (950011, 'Davis', 'Dane', 'M'),
       (950012, 'Bellfort', 'Tom', 'M'),
       (950013, 'Beemer', 'Bob', 'M'),
       (950014, 'Pope', 'Bill', 'M'),
       (950015, 'Hall', 'Conrad', 'M'),
       (950016, 'Anwar', 'Tariq', 'M')
GO

INSERT INTO Nominations (Award, Year, Category, Movie_id, Person_id, Status)
VALUES ('Academy Awards',  2000, 'Best Film Editing',          207992,     450813, 'W'),
       ('Academy Awards',  2000, 'Best Film Editing',          160492,     176884, 'N'),
       ('Academy Awards',  2000, 'Best Film Editing',          160492,     950001, 'N'),
       ('Academy Awards',  2000, 'Best Film Editing',          160492,     913507, 'N'),
       ('Academy Awards',  2000, 'Best Film Editing',          303564,     900261, 'N'),
       ('Academy Awards',  2000, 'Best Sound Effects Editing', 112290,     251397, 'N'),
       ('Academy Awards',  2000, 'Best Sound Effects Editing', 112290,     950002, 'N'),
       ('Academy Awards',  2000, 'Best Sound Effects Editing', 207992,     950003, 'W'),
       ('Academy Awards',  2000, 'Best Sound Effects Editing', 313474,     856354, 'N'),
       ('Academy Awards',  2000, 'Best Visual Effects',        313474,     251981, 'N'),
       ('Academy Awards',  2000, 'Best Visual Effects',        313474,     91712, 'N'),
       ('Academy Awards',  2000, 'Best Visual Effects',        207992,     950004, 'N'),
       ('Academy Awards',  2000, 'Best Visual Effects',        207992,     440853, 'W'),
       ('Academy Awards',  2000, 'Best Visual Effects',        207992,     950005, 'N'),
       ('Academy Awards',  2000, 'Best Visual Effects',        207992,     950006, 'N'),

       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950007, 'W'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950008, 'W'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950009, 'W'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950010, 'W'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950011, 'W'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     856354, 'N'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950012, 'N'),
       ('BAFTA Awards',    2000, 'Best Sound',                 207992,     950013, 'N'),
       ('BAFTA Awards',    2000, 'Best Cinematography',        207992,     950014, 'N'),
       ('BAFTA Awards',    2000, 'Best Cinematography',        13789,      950015, 'W'),
       ('BAFTA Awards',    2000, 'Best Production Design',     207992,     364716, 'N'),
       ('BAFTA Awards',    2000, 'Best Production Design',     304862,     203143, 'W'),
       ('BAFTA Awards',    2000, 'Best Editing',               207992,     450813, 'N'),
       ('BAFTA Awards',    2000, 'Best Editing',               13789,      950016, 'W'),
       ('BAFTA Awards',    2000, 'Best Editing',               13789,      183753, 'W')
GO
