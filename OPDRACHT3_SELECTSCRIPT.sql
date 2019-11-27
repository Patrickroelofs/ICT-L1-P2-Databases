/* ***************************** */
/*    Opdracht 3: Selectscript    */
/* ***************************** */

/* A */
/* Alle films gesorteerd naar genre [movie title, publication year, genre] */
SELECT		title, publication_year, genre_name
FROM		Movie, Movie_Genre
WHERE 		Movie.movie_id = Movie_genre.movie_id
ORDER BY 	genre_name

/* B */
/* Alle movies die tussen 1990 en 2010 geproduceerd zijn. */
SELECT *
FROM 		Movie
WHERE 		publication_year BETWEEN 1990 AND 2010

/* C */
/* Alle klanten die op dit moment actief zijn (i.e. subscription_end moet leeg zijn, of subscription_end ligt in de toekomst) [customer lastname, firstname, subscription_start] */
SELECT 		lastname, firstname, subscription_start
FROM 		Customer
WHERE 		subscription_end IS NULL
OR 			subscription_end >= '23-oct-2016'

/* D */
/* De cast uit alle Terminator movies uit het jaar 1991 [id, title, firstname, lastname, role] */
SELECT 		Movie_Cast.person_id, title, firstname, lastname, role
FROM 		Movie_Cast, Person, Movie
WHERE 		title LIKE '%Terminator%' 
AND 		Person.person_id = Movie_cast.Person_id
AND 		Movie.Movie_id = Movie_cast.Movie_id
AND 		Movie.publication_year = 1991

/* E */
/* Alle movies waarin de acteur “Arnold Schwarzenegger” een rol speelt [movie title, publication year] */


/* F */
/*  Alle gebruikers met openstaande kosten [Customer lastname, firstname, total price]Maak een View voor deze informatiebehoefte. */


/* G */
/* Toon 100 movies die tot nu toe het minst bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Dit houdt ook 0 keer in [movie title, number of times watched].Maak een View voor deze informatiebehoefte. */

/* H */
/* Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched]. */

/* I */
/* Alle movies die meer dan 8 genres hebben [title, publication_year] */

/* J */
/* Alle vrouwen die in Horror movies en Family movies gespeeld hebben [firstname,lastname]. */

/* K */
/* De director die tot nu toe de meeste films geproduceerd heeft [firstname, lastname]. */

/* L */
/* Alle Genres en het percentage dat de films uit het bepaalde genre uitmaken t.o.v. het totale aantalfilms [genre, percentage], gesorteerd op meest populaire genre */

/* M */
/* Gebruikers [mail_adress] en het gemiddelde aantal films die elke gebruiker per dag kijkt. Toon alleen gebruikers die gemiddeld 2 of meer films per dag kijken, met het grootste gemiddelde bovenaan. */