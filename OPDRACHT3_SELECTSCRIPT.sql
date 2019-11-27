/* ***************************** */
/*    Opdracht 3: Selectscript    */
/* ***************************** */

/* A */
SELECT	title, publication_year, genre_name
FROM	Movie, Movie_Genre
WHERE Movie.movie_id = Movie_genre.movie_id
ORDER BY genre_name

/* B */
SELECT *
FROM Movie
WHERE publication_year BETWEEN 1990 AND 2010

/* C */
SELECT lastname, firstname, subscription_start
FROM Customer
WHERE subscription_end IS NULL
OR subscription_end >= '23-oct-2016'

/* D */
SELECT Movie_Cast.person_id, title, firstname, lastname, role
FROM Movie_Cast, Person, Movie
WHERE title LIKE 'Matrix, the' 
AND Person.person_id = Movie_cast.Person_id
AND Movie.Movie_id = Movie_cast.Movie_id
AND Movie.publication_year = 1999

/* E */

/* F */

/* G */

/* H */

/* I */

/* J */

/* K */

/* L */

/* M */