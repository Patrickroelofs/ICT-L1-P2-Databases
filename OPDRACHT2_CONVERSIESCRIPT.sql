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
INSERT INTO Customer
    (customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
VALUES
	('peter@pan.de',            'Pan',          'Peter',        'Mastercard',   0123456789,     'basic',    '01-oct-2014',      '28-oct-2014',   'pp123',           'peterpass',       'The Netherlands',      'M',    '26-jun-1971'),  
	('guy@monk.nl',             'Threepwood',   'Guybrus',      'Visa',         333555777,      'Premium',  '01-jan-2014',      NULL,            'gm4ever',         'guypass',         'Belgium',              'M',    '03-mar-1972'),
	('lamprecht@live.com',      'Hunt',         'Renee',        'Mastercard',   9876543210,     'Premium',  '02-oct-2014',      NULL ,           'lamprecht',       'Y159GWOf',        'The Netherlands',      'M',    '12-feb-1990'),
	('markjugg@sbcglobal.net',  'Webster',      'George',       'Mastercard',   4204204204,     'Premium',  '01-oct-2015',      '28-oct-2016',   'markjugg',        'bDWxiHyy',        'The Netherlands',      'M',    '1-jun-1977'),
	('gslondon@aol.com',        'Hicks',        'Mckenzie',     'Mastercard',   3603603603,     'basic',    '21-oct-2013',      '23-oct-2016',   'gslondon',        'N1zzMj1c',        'The Netherlands',      'F',    '3-jan-1980'),
	('mrobshaw@msn.com',        'Yu',           'Cyrus',        'Mastercard',   7575757575,     'Premium',  '21-oct-2013',      NULL,            'mrobshaw',        '0eELiz4x',        'Japan',                'M',    '26-jun-1985'),
	('monopole@gmail.com',      'Bowman',       'Yael',         'Mastercard',   6667778889,     'Premium',  '21-oct-2014',      NULL,            'monopole',        '04NxEvH6',        'Japan',                'M',    '11-jun-1985'),
	('staikos@aol.com',         'Oconnell',     'Beckham',      'Mastercard',   0192837465,     'basic',    '01-oct-2014',      NULL,            'staikos',         '1p879rlI',        'The United States',    'M',    '2-sep-1981'),
	('jfinke@att.net',          'Hawkins',      'Mohammed',     'Mastercard',   6758493021,     'basic',    '01-oct-2014',      '28-oct-2017',   'jfinke',          '39BJxEb1',        'Norway',               'M',    '11-feb-1973'),
	('morain@icloud.com',       'Cowan',        'Peyton',       'Mastercard',   666766666,      'Premium',  '11-apr-2016',      NULL,            'morain',          '2alHX9hz',        'The Netherlands',      'F',    '9-dec-1994')
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




/* DATABASE OPVULLEN MET (NEP) INFORMATIE UIT OPDRACHTEN1_INSERTSCRIPT */
INSERT INTO Country
    (country_name)
VALUES
    ('The Netherlands'),
    ('Belgium')
GO


INSERT INTO Payment
    (payment_method)
VALUES
    ('Mastercard'),
    ('Visa')
GO

INSERT INTO Contract
    (contract_type, price_per_month, discount_percentage)
VALUES
    ('Basic',   4, 0),
    ('Premium', 5, 20),
    ('Pro',     6, 40)
GO

INSERT INTO WatchHistory
    (movie_id, customer_mail_address, watch_date, price, invoiced)
VALUES
	(11, 'peter@pan.de',            '15-jan-2018', 2.50, 1),
	(14, 'peter@pan.de',            '02-jan-2018', 2.50, 1),
	(15, 'peter@pan.de',            '07-jan-2018', 2.50, 1),
	(16, 'peter@pan.de',            '14-jan-2018', 2.50, 0),
	(11, 'guy@monk.nl',             '12-jan-2018', 2.50, 0),
	(12, 'guy@monk.nl',             '13-jan-2018', 2.50, 0),
	(13, 'guy@monk.nl',             '14-jan-2018', 2.50, 0),
	(17, 'guy@monk.nl',             '06-jan-2018', 2.50, 1),
	(11, 'lamprecht@live.com',      '16-jan-2018', 2.50, 0),
	(12, 'lamprecht@live.com',      '16-jan-2018', 2.50, 0),
	(17, 'lamprecht@live.com',      '06-jan-2018', 2.50, 1),
	(18, 'lamprecht@live.com',      '08-jan-2018', 2.50, 0),
	(11, 'markjugg@sbcglobal.net',  '15-jan-2018', 2.50, 0),
	(15, 'markjugg@sbcglobal.net',  '01-jan-2018', 2.50, 1),
	(18, 'markjugg@sbcglobal.net',  '05-jan-2018', 2.50, 1),
	(13, 'markjugg@sbcglobal.net',  '13-jan-2018', 2.50, 0),
	(11, 'gslondon@aol.com',        '13-jan-2018', 2.50, 0),
	(12, 'gslondon@aol.com',        '13-jan-2018', 2.50, 0),
	(13, 'gslondon@aol.com',        '13-jan-2018', 2.50, 0),
	(14, 'gslondon@aol.com',        '03-jan-2018', 2.50, 1),
	(11, 'mrobshaw@msn.com',        '12-jan-2018', 2.50, 0),
	(14, 'mrobshaw@msn.com',        '04-jan-2018', 2.50, 1),
	(15, 'mrobshaw@msn.com',        '05-jan-2018', 2.50, 1),
	(16, 'mrobshaw@msn.com',        '06-jan-2018', 2.50, 1),
	(11, 'monopole@gmail.com',      '16-jan-2018', 2.50, 0),
	(14, 'monopole@gmail.com',      '01-jan-2018', 2.50, 1),
	(17, 'monopole@gmail.com',      '08-jan-2018', 2.50, 0),
	(18, 'monopole@gmail.com',      '08-jan-2018', 2.50, 0),
	(11, 'staikos@aol.com',         '14-jan-2018', 2.50, 0),
	(15, 'staikos@aol.com',         '03-jan-2018', 2.50, 1),
	(16, 'staikos@aol.com',         '04-jan-2018', 2.50, 1),
	(12, 'staikos@aol.com',         '16-jan-2018', 2.50, 0),
	(11, 'jfinke@att.net',          '12-jan-2018', 2.50, 0),
	(16, 'jfinke@att.net',          '02-jan-2018', 2.50, 1),
	(17, 'jfinke@att.net',          '02-jan-2018', 2.50, 1),
	(18, 'jfinke@att.net',          '06-jan-2018', 2.50, 1),
	(11, 'morain@icloud.com',       '14-jan-2018', 2.50, 0),
	(17, 'morain@icloud.com',       '05-jan-2018', 2.50, 1),
	(18, 'morain@icloud.com',       '07-jan-2018', 2.50, 1),
	(13, 'morain@icloud.com',       '10-jan-2018', 2.50, 0)
GO