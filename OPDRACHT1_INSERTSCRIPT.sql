/* ***************************** */
/** Opdracht 1f: Voorbeeldpopulatie */
/* ***************************** */
USE Fletnix
GO

/** Table: Movie
    Records voor de films 'Matrix', 'Matrix Reloaded' en 5 anderen */
INSERT INTO Movie
    (movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL)
VALUES
    (11, 'Matrix, The', 122, 'Description of Matrix, The', 1999, NULL, NULL, 2.50, 'https://www.youtube.com/watch?v=m8e-FF8MsqU'),
    (12, 'Matrix Reloaded, The', 106, 'Description of Matrix Reloaded, The', 2003, NULL, 11, 2.50, 'https://www.youtube.com/watch?v=kYzz0FSgpSU'),
    (13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 2003, NULL, 12, 2.50, 'https://www.youtube.com/watch?v=hMbexEPAOQI'),

    /* (6) andere films */
    (14, 'The Lord of the Rings: The fellowship of the Ring', 208, 'Description of The Lord of the Rings: The fellowship of the Ring', 2001, NULL, NULL, 1.10, 'https://www.youtube.com/watch?v=V75dMMIW2B4'),
    (15, 'The Lord of the Rings: The Two Towers', 235, 'Description of The Lord of the Rings: The Two Towers', 2002, NULL, 14, 2.40, 'https://www.youtube.com/watch?v=LbfMDwc4azU'),
    (16, 'The Lord of the Rings: The Return of the King', 263, 'Description of The Lord of the Rings: The Return of the King', 2003, NULL, 15, 6.50, 'https://www.youtube.com/watch?v=r5X-hFf6Bwo'),
    (17, 'The Hobbit: An Unexpected Journey', 179, 'Description of The Hobbit: An Unexpected Journey', 2012, NULL, NULL, 4.20, 'https://www.youtube.com/watch?v=JTSoD4BBCJc'),
    (18, 'The Hobbit: The Desolation of Smaug', 186, 'Description of The Hobbit: The Desolation of Smaug', 2013, NULL, 17, 3.50, 'https://www.youtube.com/watch?v=SDnYMbYB-nU'),
    (19, 'The Hobbit: The Battle of the Five Armies', 144, 'Description of The Hobbit: The Battle of the Five Armies', 2014, NULL, 18, 3.00, 'https://www.youtube.com/watch?v=iVAgTiBrrDA')

/** Table: Person
    Elke film heeft een acteur of Director. */
INSERT INTO Person
    (person_id, lastname, firstname, gender)
VALUES
    (83616, 'Wachowski', 'Andy', 'M'),
    (83617, 'Wachowski', 'Larry', 'M'),
    (393411, 'Reeves', 'Keanu', 'M'),
    (729933, 'Moss', 'Carrie-Anne', 'F'),
    (151786, 'Fishburne', 'Laurence', 'M'),

    /* Cast van twee films */
    (83614, 'Wood', 'Elijah', 'M'),
    (83618, 'McKellen', 'Ian', 'M'),
    (83619, 'Freeman', 'Martin', 'M'),
    (83612, 'Cumberbatch', 'Benedict', 'M'),

    /* Directors van twee films */
    (83611, 'Jackson', 'Peter', 'M'),
    (83613, 'Walsh', 'Fran', 'M')

/*  Table: Movie Directors
    De Director in person wordt gekoppeld aan een film */
INSERT INTO Movie_Directors
    (movie_id, person_id)
VALUES
    (11, 83616),
    (11, 83617),
    (12, 83614),
    (12, 83617),

    /* Movie directors van eigen toegevoegde films */
    (16, 83611),
    (19, 83613)

/*  Table: Movie Cast
    De Acteur wordt gekoppeld aan de film. */
INSERT INTO Movie_Cast
    (movie_id, person_id, role)
VALUES
    (11, 393411, 'Neo'),
    (11, 729933, 'Trinity'),
    (11, 151786, 'Morpheus'),

    /* Movie Cast van eigen toegevoegde films */
    (14, 83617, 'Frodo'),
    (15, 83618, 'Gandalf'),
    (17, 83619, 'Bilbo'),
    (18, 83612, 'Smaug')

/* Table: Genre
    De genre die bij de films horen */
INSERT INTO Genre
    (genre_name, description)
VALUES
    ('Action',      'Creative works characterized by emphasis on exciting action sequences'),
    ('Drama',       'Fictional division between comedy and tragedy'),
    ('Family',      'Movies suitable for a wide range of age groups'),
    ('Sci-Fi',      'Fictional movies  dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, paralleluniverses, and extraterrestrial life'),

    /* Genre van eigen toegevoegde Films */
    ('Adventure',   'The character travels and goes on an adventure'),
    ('Fantasy',     'A fictional fantasy setting with magical powers')

/* Table: Movie Genre
    Elke film wordt aan een correcte Genre gekoppeld */
INSERT INTO Movie_Genre
    (movie_id, genre_name)
VALUES
    (11, 'Action'),
    (11, 'Sci-Fi'),

    /* Movie Genre van eigen toegevoegde Films */
    (14, 'Fantasy'),
    (15, 'Fantasy'),
    (16, 'Fantasy'),
    (17, 'Adventure'),
    (18, 'Adventure'),
    (19, 'Adventure')

/* Table: Country
    Elke persoon komt uit een land */
INSERT INTO Country
    (country_name)
VALUES
    ('The Netherlands'),
    ('Belgium')

/* Table: Payment
    Betaalmethodes */
INSERT INTO Payment
    (payment_method)
VALUES
    ('Mastercard'),
    ('Visa')
    /* Onder eigen ontworpen opdracht 1B constraint is AMEX Niet beschikbaar */
    /*('Amex') */

/* Table: Contract
    De contract die de Person heeft */
INSERT INTO Contract
    (contract_type, price_per_month, discount_percentage)
VALUES
    ('Basic',   4, 0),
    ('Premium', 5, 20),
    ('Pro',     6, 40)

/* Table: Customer
    De klanten
    10 eigen customers */
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


/* Table: Watch History
    Elke customer heeft een watch history
    10 eigen customers met WatchHistory */
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