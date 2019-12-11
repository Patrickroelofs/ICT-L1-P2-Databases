use Fletnix
GO

/* ***************************** */
/*    Opdracht 2A: Deletescript  */
/* ***************************** */
DELETE FROM Movie_Cast;
DELETE FROM Movie_Directors;
DELETE FROM Movie_Genre;
DELETE FROM Watchhistory;
DELETE FROM Person;
DELETE FROM Genre;
DELETE FROM Movie;
DELETE FROM Customer;
DELETE FROM Payment;
DELETE FROM Contract;
DELETE FROM Country;
GO

/* ***************************** */
/* Opdracht 2B: Conversiescripts  */
/* ***************************** */

/* Conversiescript: Person */
INSERT  INTO Person
SELECT  CAST(Id AS int) AS person_id,
        LEFT(Lname, 50) AS lastname,
        LEFT(Fname, 50) AS firstname,
        Gender AS gender

FROM MYIMDB.dbo.Imported_Person
GO

/* Conversiescript: Movie */
INSERT  INTO Movie
SELECT  CAST(Id AS INT) AS movie_id,
        LEFT(Name, 255) AS title,
        NULL AS Duration,
        CAST('The Description of' + Name AS VARCHAR(255)) AS Description,
        Year AS publication_year,
        NULL AS cover_image,
        NULL AS previous_part,
        (7) AS price,
        NULL AS URL

FROM MYIMDB.dbo.Imported_Movie
GO

/* Conversiescript: Customer */
/* MYIMDB DATABASE Heeft geen Customers dus import ik Customer uit Opdracht 1 Insertscript */
INSERT  INTO Customer
SELECT  customer_mail_address   AS customer_mail_address,
        lastname                AS lastname,
        firstname               AS firstname,
        payment_method          AS payment_method,
        payment_card_number     AS payment_card_number,
        contract_type           AS contract_type,
        subscription_start      AS subscription_start,
        subscription_end        AS subscription_end,
        user_name               AS user_name,
        password                AS password,
        country_name            AS country_name,
        gender                  AS gender,
        birth_date              AS birth_date

FROM FLETNIX_DOCENT.dbo.Customer
GO

/* Conversiescript: Genre */
INSERT  INTO Genre
SELECT  DISTINCT Genre AS genre_name,
        NULL AS description

FROM MYIMDB.dbo.Imported_Genre
GO

/* ***************************** */
/* Opdracht 2C: Conversiescripts child tables  */
/* ***************************** */

/* Conversiescript: Movie_Genre */
INSERT INTO Movie_Genre
SELECT DISTINCT CAST(Id AS INT) AS movie_id,
                CAST(Genre AS VARCHAR(255)) AS genre_name

FROM MYIMDB.dbo.Imported_Genre
GO

/* Conversiescript: Movie_Cast */
INSERT INTO Movie_Cast
SELECT DISTINCT Mid AS Movie_id,
                Pid AS Person_id,
                Role as role

FROM MYIMDB.dbo.Imported_Cast
GO

/* Conversiescript: Person */
INSERT INTO Person
SELECT  DISTINCT    CAST(Id as INT)+845465 as person_id,
                    LEFT(Lname, 50) AS lastname,
                    LEFT(Fname, 50) AS firstname,
                    NULL AS gender

FROM MYIMDB.dbo.Imported_Directors
GO

/* Conversiescript: Movie_Directors */
INSERT INTO Movie_Directors
SELECT      CAST (Mid AS INT) AS Movie_id,
            CAST (Did AS INT)+845465 as Person_id

FROM MYIMDB.dbo.Imported_movie_directors
GO

/* Conversiescript: Country */
INSERT INTO Country
SELECT      country_name AS country_name

FROM FLETNIX_DOCENT.dbo.country
GO

/* Conversiescript: Payment */
INSERT INTO Payment
SELECT  payment_method as payment_method

FROM FLETNIX_DOCENT.dbo.Payment
GO

/* Conversiescript: Contract */
INSERT  INTO Contract
SELECT  contract_type AS contract_type,
        price_per_month AS price_per_month,
        discount_percentage AS discount_percentage

FROM FLETNIX_DOCENT.dbo.Contract
GO

/* TODO: insert watchhistory from Fletnix_docent */