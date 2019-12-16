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
    Movie_id    INT             NOT NULL,
    Person_id   INT             NOT NULL,
    Award       VARCHAR(255)    NOT NULL,
    Category    VARCHAR(255)    NOT NULL,
    Year        INT             NOT NULL,
    Status      VARCHAR(1)      NOT NULL,

    PRIMARY KEY (Movie_id, Person_id, Award, Category, Year),
    FOREIGN KEY (Movie_id)      REFERENCES Movie (Movie_id),
-- TODO: Gives error
--     FOREIGN KEY (Award)         REFERENCES Awards (Award),
--     FOREIGN KEY (Year)          REFERENCES Awards (Year),
    FOREIGN KEY (Person_id)     REFERENCES Person (Person_id),
    FOREIGN KEY (Status)        REFERENCES Status (Status)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
GO

/* Opdracht 4C: Populeer de database met ontbrekende data */

/* INSERT INTO: Status */
INSERT INTO Status (Status, StatusName) VALUES
    ('W', 'Won'),
    ('N', 'Nominated')
GO

/* INSERT INTO: Awards
   Alter Country "The Netherlands" because of Foreign Key conflict (wrong name in Fletnix_DOCENT database) */
UPDATE  Country
SET     country_name = 'The Netherlands'
WHERE   country_name = 'Netherlands'
GO

INSERT INTO Awards (Award, Year, Country) VALUES
    ('Academy Awards',  '2000', 'The Netherlands'),
    ('BAFTA Awards',    '2000', 'New Zealand')