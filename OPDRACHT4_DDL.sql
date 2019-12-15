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

/* Table: Award_Status
   Category | Movie_ID | Person_ID | Status */
CREATE TABLE Award_Status (
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
       ('', '')
GO

/* Table Insert: Nominees */
INSERT INTO Nominees (Award, Category, Movie_id, Person_id)
VALUES
       ('', '', '', '')
GO

/* Table Insert: Award_Status */
INSERT INTO Award_Status (Category, Movie_id, Person_id, status)
VALUES
       ('', '', '', '')
GO