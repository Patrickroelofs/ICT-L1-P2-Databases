/* Test Query voor opdracht 5A: */
SELECT title, publication_year, count(status) AS [Amount of Nominations/Wins]
FROM movie, Nominations
WHERE movie.movie_id = Nominations.Movie_id
GROUP BY title, publication_year

/* Test Query voor opdracht 5B1: */


/* Test Query voor opdracht 5B2: */
SELECT country_name, contract_type, count(user_name) as [Accounts]
FROM Customer
WHERE country_name = 'Cameroon'
GROUP BY country_name, contract_type

/* Test Query voor opdracht 5B3: */
SELECT contract_type, count(subscription_start) as [subscription start], count(subscription_end) as [subscription end]
FROM Customer
GROUP BY contract_type

/* Test Query voor opdracht 5B4: */


/* Test Query voor opdracht 5B5: */
