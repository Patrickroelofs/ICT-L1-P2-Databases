/* ***************************** */
/*    Opdracht 3: Selectscript    */
/* ***************************** */

/* A */
/* Alle films gesorteerd naar genre [movie title, publication year, genre] */
SELECT		title, publication_year, genre_name
FROM		Movie, Movie_Genre
WHERE 		Movie.movie_id = Movie_genre.movie_id
ORDER BY 	genre_name
GO

/* B */
/* Alle movies die tussen 1990 en 2010 geproduceerd zijn. */
SELECT 		*
FROM 		Movie
WHERE 		publication_year BETWEEN 1990 AND 2010
GO

/* C */
/* Alle klanten die op dit moment actief zijn (i.e. subscription_end moet leeg zijn, of subscription_end ligt in de toekomst) [customer lastname, firstname, subscription_start] */
SELECT 		lastname, firstname, subscription_start
FROM 		Customer
WHERE 		subscription_end IS NULL
OR 			subscription_end >= '23-oct-2016'
GO

/* D */
/* De cast uit alle Terminator movies uit het jaar 1991 [id, title, firstname, lastname, role] */
SELECT 		Movie_Cast.person_id, title, firstname, lastname, role
FROM 		Movie_Cast, Person, Movie
WHERE 		title LIKE '%Terminator%' 
AND 		Person.person_id = Movie_cast.Person_id
AND 		Movie.Movie_id = Movie_cast.Movie_id
AND 		Movie.publication_year = 1991
GO

/* E */
/* Alle movies waarin de acteur “Arnold Schwarzenegger” een rol speelt [movie title, publication year] */
SELECT 	movie.title, movie.publication_year
FROM 	Movie  	INNER JOIN Movie_Cast on Movie.Movie_id = Movie_Cast.Movie_id
            	INNER JOIN Person on Movie_Cast.person_id = Person.Person_id
WHERE 	Person.firstname = 'Arnold' AND Person.lastname = 'Schwarzenegger'
GO

/* F */
/*  Alle gebruikers met openstaande kosten [Customer lastname, firstname, total price]Maak een View voor deze informatiebehoefte. */
DROP VIEW IF EXISTS openstaande_kosten
GO

CREATE VIEW openstaande_kosten AS
	SELECT SUM(WatchHistory.price) AS total_price, Customer.lastname, Customer.firstname
	FROM Customer INNER JOIN WatchHistory ON Customer.customer_mail_address = WatchHistory.customer_mail_address
	WHERE WatchHistory.invoiced = 0
	GROUP BY WatchHistory.customer_mail_address, Customer.lastname, Customer.firstname
GO

SELECT * from openstaande_kosten
GO

/* G */
/* Toon 100 movies die tot nu toe het minst bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Dit houdt ook 0 keer in [movie title, number of times watched].Maak een View voor deze informatiebehoefte. */
DROP VIEW IF EXISTS top_100_least_watched
GO

CREATE VIEW top_100_least_watched AS
	SELECT top(100) movie.title, count(WatchHistory.movie_id) AS [number of times watched]
	FROM Movie LEFT OUTER JOIN WatchHistory ON Movie.movie_id = WatchHistory.movie_id
	GROUP BY WatchHistory.movie_id, Movie.title
	ORDER BY [number of times watched]
GO

SELECT * FROM top_100_least_watched
GO

/* H */
/* Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched]. */
DROP VIEW IF EXISTS most_watched_2Months
GO

CREATE VIEW most_watched_2Months AS
	SELECT Movie.title, Movie.publication_year, COUNT(WatchHistory.Movie_id) AS [number of times watched]
	FROM Movie LEFT OUTER JOIN WatchHistory ON Movie.movie_id = WatchHistory.movie_id
	WHERE WatchHistory.Watch_date > DATEADD(month, -2, GETDATE())
	GROUP BY WatchHistory.movie_id, Movie.title, Movie.publication_year
GO

SELECT * FROM most_watched_2Months ORDER BY [number of times watched]
GO

/* I */
/* Alle movies die meer dan 8 genres hebben [title, publication_year] */
SELECT title, publication_year
FROM Movie
WHERE movie_id in (
	SELECT movie_id
	FROM Movie_Genre
	GROUP BY movie_id
	HAVING COUNT(genre_name) > 8
)
GO

/* J */
/* Alle vrouwen die in Horror movies en Family movies gespeeld hebben [firstname,lastname]. */
/* Vrouwen die in horror films en Family spelen */
SELECT DISTINCT Person.firstname, Person.lastname
FROM Movie_Cast LEFT OUTER JOIN Person ON Movie_Cast.person_id = Person.person_id
WHERE person.gender = 'F'
AND Movie_Cast.Movie_id in (
	SELECT Movie_id
	FROM Movie_Genre
	WHERE genre_name = 'Horror'
	OR genre_name = 'Family'
)
GO

/* Je kan de vraag ook zo zien */
/* Vrouwen die in horror, family spelen. */
SELECT DISTINCT Person.firstname, Person.lastname
FROM Movie_Cast LEFT OUTER JOIN Person ON Movie_Cast.person_id = Person.person_id
WHERE person.gender = 'F'
AND Movie_Cast.Movie_id in (
	SELECT Movie_id
	FROM Movie_Genre
	WHERE genre_name = 'Horror'
	AND movie_id in (
        SELECT Movie_id
        FROM Movie_Genre
        WHERE genre_name = 'Family'
	)
)
GO

/* K */
/* De director die tot nu toe de meeste films geproduceerd heeft [firstname, lastname]. */
SELECT TOP(1) Person.firstname, Person.lastname, COUNT(Movie_Directors.movie_id) as amount
FROM Movie_Directors LEFT OUTER JOIN Person on Movie_Directors.person_id = Person.person_id
GROUP BY Movie_Directors.person_id, firstname, lastname
ORDER BY amount DESC
GO

/* L */
/* Alle Genres en het percentage dat de films uit het bepaalde genre uitmaken t.o.v. het totale aantalfilms [genre, percentage], gesorteerd op meest populaire genre */
DROP VIEW IF EXISTS percentage_films
GO

CREATE VIEW percentage_films AS
	SELECT genre_name,
		COUNT(genre_name) AS amount,
		COUNT(genre_name) * 100 / (SELECT COUNT(*) FROM Movie_Genre) as movie_percentage
	FROM Movie_Genre
	GROUP BY genre_name
GO

SELECT * FROM percentage_films ORDER BY movie_percentage DESC
GO

/* M */
/* Gebruikers [mail_adress] en het gemiddelde aantal films die elke gebruiker per dag kijkt. Toon alleen gebruikers die gemiddeld 2 of meer films per dag kijken, met het grootste gemiddelde bovenaan. */

/* pas een customer aan zodat de datum calculatie beter is */
UPDATE Customer SET Customer.subscription_start = '2018-DEC-01' WHERE Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
SELECT * from customer where customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'

/* Test om te zien hoeveel deze persoon gekeken heeft */
SELECT Customer.customer_mail_address, count(movie_id) AS [movies watched]
FROM WatchHistory, customer WHERE WatchHistory.customer_mail_address = customer.customer_mail_address AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
GROUP BY customer.customer_mail_address
ORDER BY [movies watched] DESC

/* test om te zien hoeveel dagen deze persoon klant is */
SELECT Customer.customer_mail_address, DATEDIFF(DAY, Customer.subscription_start, dbo.dateCalc(Customer.subscription_end, convert(date, GETDATE()))) AS [days the person has an account]
FROM WatchHistory, Customer
WHERE WatchHistory.customer_mail_address = Customer.customer_mail_address AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
GROUP BY Customer.customer_mail_address, Customer.subscription_start, Customer.subscription_end
ORDER BY [days the person has an account] DESC

/* De echte berekening */
DROP VIEW IF EXISTS average_time
GO

DROP FUNCTION IF EXISTS dbo.dateCalc
GO

CREATE FUNCTION dbo.dateCalc(@endDate DATE, @today DATE)
RETURNS DATE
    AS
    BEGIN
        IF(@endDate IS NULL)
            RETURN @today
        ELSE IF(@endDate < @today)
            RETURN @endDate
        RETURN @today
    END
GO

CREATE VIEW average_time AS
	SELECT WatchHistory.customer_mail_address, count(movie_id) / datediff(DAY, Customer.subscription_start, dbo.dateCalc(Customer.subscription_end, convert(date, GETDATE()))) as [gemiddelde aantal films]
	FROM WatchHistory, Customer WHERE WatchHistory.customer_mail_address = Customer.customer_mail_address -- AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
	GROUP BY WatchHistory.customer_mail_address, Customer.subscription_start, Customer.subscription_end
    HAVING count(movie_id) / datediff(DAY, Customer.subscription_start, dbo.dateCalc(Customer.subscription_end, convert(date, GETDATE()))) >= 2
GO

SELECT *
FROM average_time
ORDER BY [gemiddelde aantal films] DESC