/* ***************************** */
/*    Opdracht 1E: Testscript    */
/* ***************************** */

USE Fletnix
GO


/* Het geslacht (gender) van een persoon (Person) moet ‘M’ (male) of ‘F’ (female) zijn. */

/* GOED */
INSERT INTO Person
    (person_id, lastname, firstname, gender)
VALUES
    (66666, 'Peter', 'Babish', 'M')

/* FOUT */
INSERT INTO Person
    (person_id, lastname, firstname, gender)
VALUES
    (66667, 'Rob', 'Halford', 'G')



/* Het publicatie jaar (publication_year) van een film (Movie) moet tussen 1890 en het huidige jaar zijn. */

/* GOED */
INSERT INTO Movie
    (movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL)
VALUES
    (19, 'MovieGood', 130, 'Description of MovieGood', 2017, NULL, NULL, 2.50, 'http://')

/* FOUT */
insert into Movie
	(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL)
values 
	(11, 'MovieBad', 123, 'Description of MovieBad', 1800, NULL, NULL, 2.50, 'http://')



/*  De aanmelddatum (subscription_start) van een klant (Customer) mag niet na de datum van afmelding (subscription_end) zijn. */

/* GOED */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('email@hotmail.com', 'Timothy', 'Thomas', 'Mastercard', 1985758236, 'basic', '01-jan-2015', '15-oct-2015', 'username', 'password', 'The United States', 'M', '18-nov-1962')

/* FOUT */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('emailtwee@outlook.com', 'Thimothy', 'Tomas', 'Visa', 8799545685, 'premium', '10-nov-2016', '10-dec-2014', 'username2', 'password', 'The United States', 'M', '18-feb-1962')



/*  De gebruikernaam (user_name) van een klant (Customer) moet uniek zijn. */

/* GOED */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('emaildrie@hotmail.com', 'Thomas', 'Thimothy', 'Mastercard', 0001112223, 'basic', '01-jan-2015', '15-oct-2015', 'username3', 'password', 'The Netherlands', 'M', '18-feb-1962')

/* FOUT */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('emaildrie@hotmail.com', 'Thomas', 'Thimothy', 'Mastercard', 3334445556, 'basic', '01-jan-2015', '15-oct-2015', 'username3', 'password', 'The Netherlands', 'M', '18-feb-1962')

/* De datum (watch_date) waarop een film (Movie) bekeken is moet tussen de aanmelddatum (subscription_start) en afmelddatum (subscription_end) van de klant (Customer) liggen. */
/* DEZE KAN NIET */


/* Er mag alleen met VISA, Mastercard betaald worden <AMEX is niet beschikbaar> */

/* GOED */
insert into Payment
	(payment_method)
values
	('Visa')

/* FOUT */
insert into Payment
	(payment_method)
values
	('AMEX')


/* de maximum korting op een product is 50% */

/* GOED */
INSERT INTO Contract
    (contract_type, price_per_month, discount_percentage)
VALUES
    ('testContract', 2.50, 25)

/* FOUT */
INSERT INTO Contract
    (contract_type, price_per_month, discount_percentage)
VALUES
    ('testContract', 2.50, 75)


/* Het geslacht van een klant in Customer mag alleen 'M' of 'F' Zijn */
/* GOED */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('nepmail@gmail.com', 'achternaam68', 'voornaam68', 'Mastercard', 1425147845, 'basic', '01-jan-2015', '15-oct-2015', 'KOM', 'usernameoriginal2', 'The United States', 'M', '25-jun-1980')  

/* FOUT */
insert into Customer
	(customer_mail_address, last_name, first_name, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name, gender, birth_date)
values 
	('nepmailtwee@gmail.com', 'achternaam69', 'voornaam69', 'Mastercard', 1425147845, 'basic', '01-jan-2015', '15-oct-2015', 'usernameoriginal2', 'oops69', 'The Netherlands', 'G', '25-jun-1980')  