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
	FROM WatchHistory, Customer WHERE WatchHistory.customer_mail_address = Customer.customer_mail_address AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
	GROUP BY WatchHistory.customer_mail_address, Customer.subscription_start, Customer.subscription_end
GO

SELECT *
FROM average_time
ORDER BY [gemiddelde aantal films] DESC

UPDATE Customer SET Customer.subscription_start = '2018-DEC-01' WHERE Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
SELECT * from customer where customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
SELECT Customer.customer_mail_address, count(movie_id) AS [movies watched]
FROM WatchHistory, customer WHERE WatchHistory.customer_mail_address = customer.customer_mail_address AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
GROUP BY customer.customer_mail_address
ORDER BY [movies watched] DESC

SELECT Customer.customer_mail_address, DATEDIFF(DAY, Customer.subscription_start, dbo.dateCalc(Customer.subscription_end, convert(date, GETDATE()))) AS [days the person has an account]
FROM WatchHistory, Customer
WHERE WatchHistory.customer_mail_address = Customer.customer_mail_address AND Customer.customer_mail_address = 'Lorem.ipsum@Curabiturconsequat.edu'
GROUP BY Customer.customer_mail_address, Customer.subscription_start, Customer.subscription_end
ORDER BY [days the person has an account] DESC