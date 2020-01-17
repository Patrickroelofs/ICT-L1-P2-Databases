/* ***************************** */
/** Opdracht 1a: Create Database */
/* ***************************** */

/* Delete already existing Fletnix Database if it exists */
DROP DATABASE IF EXISTS Fletnix

/* Create new database called Fletnix */
CREATE DATABASE Fletnix
GO

/* Use the database Fletnix */
USE Fletnix
GO

/** Opdracht 1a: Create Tables */
/* Table: Person */
CREATE TABLE Person (
    person_id               INT             NOT NULL,
    lastname                VARCHAR(50)     NOT NULL,
    firstname               VARCHAR(50)     NOT NULL,
    gender                  CHAR(1),
    PRIMARY KEY (person_id)
)
GO

/* Table: Movie */
CREATE TABLE Movie (
    movie_id                INT             NOT NULL,
    title                   VARCHAR(255)    NOT NULL,
    duration                INT,
    description             VARCHAR(255),
    publication_year        INT,
    cover_image             VARCHAR(255),
    previous_part           INT,
    price                   numeric(5,2)    NOT NULL,
    URL                     VARCHAR(255),
    PRIMARY KEY (movie_id),
    CONSTRAINT fk_MovieMoviePrevious_MovieMovieID
    FOREIGN KEY (previous_part) REFERENCES Movie (movie_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
GO

/* Table: Movie Directors */
CREATE TABLE Movie_Directors (
    movie_id                INT             NOT NULL,
    person_id               INT             NOT NULL,
    PRIMARY KEY(movie_id, person_id),
    CONSTRAINT fk_MovieDirectorsmovieDirectors_PersonPersonID
    FOREIGN KEY (person_id) REFERENCES Person (Person_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_MovieDirectorsmovieDirectors_MovieMovieID
    FOREIGN KEY (movie_id) REFERENCES Movie (Movie_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

/* Table: Movie Cast */
CREATE TABLE Movie_Cast (
    movie_id                INT             NOT NULL,
    person_id               INT             NOT NULL,
    role                    VARCHAR(255)    NOT NULL,
    PRIMARY KEY(movie_id, person_id, role),
    CONSTRAINT fk_MovieCastPersonID_PersonPersonID
    FOREIGN KEY (person_id) REFERENCES person (person_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_MovieCastmovieID_MovieMovieID
    FOREIGN KEY (movie_id) REFERENCES Movie (Movie_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

/* Table: Genre */
CREATE TABLE Genre (
    genre_name              VARCHAR(255)    NOT NULL,
    description             VARCHAR(255),
    PRIMARY KEY(genre_name)
)
GO

/* Table: Movie Genre */
CREATE TABLE Movie_Genre (
    movie_id                INT             NOT NULL,
    genre_name              VARCHAR(255)    NOT NULL,
    PRIMARY KEY(movie_id, genre_name),
    CONSTRAINT fk_MovieGenreGenreName_GenreGenreName
    FOREIGN KEY (genre_name) REFERENCES Genre (genre_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_MovieGenreMovieID_MovieMovieID
    FOREIGN KEY (movie_id) REFERENCES Movie (movie_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
GO

/* Table: Country */
CREATE TABLE Country (
    country_name            VARCHAR(50)     NOT NULL,
    PRIMARY KEY(country_name)
)
GO

/* Table: Payment */
CREATE TABLE Payment (
    payment_method          VARCHAR(10)     NOT NULL,
    PRIMARY KEY(payment_method)
)
GO

/* Table: Contract */
CREATE TABLE Contract (
    contract_type           VARCHAR(10)     NOT NULL,
    price_per_month         NUMERIC(5,2)    NOT NULL,
    discount_percentage     NUMERIC(2)      NOT NULL,
    PRIMARY KEY(contract_type)
)
GO

/* Table: Customer */
CREATE TABLE Customer (
    customer_mail_address   VARCHAR(255)    NOT NULL,
    lastname                VARCHAR(50)     NOT NULL,
    firstname               VARCHAR(50)     NOT NULL,
    payment_method          VARCHAR(10)     NOT NULL,
    payment_card_number     VARCHAR(30)     NOT NULL,
    contract_type           VARCHAR(10)     NOT NULL,
    subscription_start      DATE            NOT NULL,
    subscription_end        DATE,
    user_name               VARCHAR(30)     NOT NULL,
    password                VARCHAR(50)     NOT NULL,
    country_name            VARCHAR(50)     NOT NULL,
    gender                  CHAR(1),
    birth_date              DATE,
    PRIMARY KEY(customer_mail_address),
    FOREIGN KEY (contract_type) REFERENCES Contract (contract_type)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
)
GO

/* Table: Watch History */
CREATE TABLE WatchHistory (
    movie_id                INT,
    customer_mail_address   VARCHAR(255)    NOT NULL,
    watch_date              DATE            NOT NULL,
    price                   NUMERIC(5,2)    NOT NULL,
    invoiced                BIT             NOT NULL,
    PRIMARY KEY(movie_id, customer_mail_address, watch_date),
    CONSTRAINT fk_WatchHistoryMovieID_MovieMovieID
    FOREIGN KEY (movie_id) REFERENCES Movie (movie_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT fk_WatchHistoryCustomerMailAddress_CustomerCustomerMailAdres
    FOREIGN KEY (customer_mail_address) REFERENCES Customer (customer_mail_address)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
)
GO



/* ***************************** */
/* Opdracht 1b: Constrains */
/* ***************************** */

/* Het geslacht (gender) van een persoon (Person) moet ‘M’ (male) of ‘F’ (female) zijn. */
ALTER TABLE Person
    ADD CONSTRAINT ck_persongender CHECK (gender IN ('M', 'F'))

/* Het publicatie jaar (publication_year) van een film (Movie) moet tussen 1890 en het huidige jaar zijn. */
ALTER TABLE Movie
    ADD CONSTRAINT ck_year CHECK (publication_year > 1890)

/* De aanmelddatum (subscription_start) van een klant (Customer) mag niet na de datum van afmelding (subscription_end) zijn. */
ALTER TABLE Customer
    ADD CONSTRAINT ck_subscription CHECK (subscription_start < subscription_end)

/* De gebruikernaam (user_name) van een klant (Customer) moet uniek zijn. */
ALTER TABLE Customer
    ADD CONSTRAINT ck_user_name UNIQUE (user_name)

/* De datum (watch_date) waarop een film (Movie) bekeken is moet tussen de aanmelddatum (subscription_start) en afmelddatum (subscription_end) van de klant (Customer) liggen.

ALTER TABLE Watchhistory
    ADD Constraint ck_watch_date CHECK (watch_date > subscription_start AND watch_date < subscription_end)

Dit is niet mogelijk ivm gegevens uit een andere tabel */




/* ***************************** */
/* Opdracht 1c: Eigen Constraints */
/* ***************************** */

/* Er mag alleen met VISA, Mastercard, Amex betaald worden anderen zijn niet beschikbaar */
ALTER TABLE Payment
    ADD CONSTRAINT ck_paymentmethod CHECK (payment_method = 'Visa' OR payment_method = 'Mastercard' OR payment_method = 'Amex')

/* de maximum korting op een product is 50% */
ALTER TABLE Contract
    ADD CONSTRAINT ck_maximumdiscount check (discount_percentage <= 50)

/* Het geslacht van een klant in Customer mag alleen 'M' of 'F' Zijn */
ALTER TABLE Customer
    ADD CONSTRAINT ck_customergender CHECK (gender IN ('M', 'F'))



/* ***************************** */
/* Opdracht 1d: Update & Delete regels */
/* ***************************** */

/* Toegevoegd aan DDL statements */