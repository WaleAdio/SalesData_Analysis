-- Step 1
-- #Creating a database
-- #Creating a table and inserting the data
-- #No NULL Values as the removed in the steps above


CREATE DATABASE SalesProject

CREATE TABLE Sales(
invoice_id VARCHAR(30) NOT NULL,
branch VARCHAR (5) NOT NULL,
city VARCHAR (30) NOT NULL,
customer_type VARCHAR (30) NOT NULL,
gender VARCHAR (15) NOT NULL,
product_line VARCHAR (250) NOT NULL,
unit_price DECIMAL (10, 2) NOT NULL,
quantity INTEGER NOT NULL,
tax FLOAT (6, 4) NOT NULL,
total DECIMAL (12, 4),
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR (15) NOT NULL,
cost_of_goods DECIMAL (10, 2) NOT NULL,
gross_margin_percentage FLOAT (11, 9),
gross_income DECIMAL (12, 4) NOT NULL,
rating FLOAT (2, 1)
);

-- Creating new columns

-- Creating column "time_of_day"
ALTER TABLE Sales ADD COLUMN time_of_day VARCHAR (25)

SELECT
	time,
    (CASE
		WHEN time BETWEEN "00:01:00" AND "06:00:00" THEN "Early Morning"
        WHEN time BETWEEN "06:01:00" AND "11:59:00" THEN "Morning"
        WHEN time BETWEEN "12:00:00" AND "18:00:00" THEN "Afternoon"
        WHEN time BETWEEN "18:01:00" AND "21:00:00" THEN "Evening"
        WHEN time BETWEEN "21:01:00" AND "00:00:00" THEN "Night"
        END
    ) AS time_of_day
FROM Sales;


UPDATE Sales
SET time_of_day = (
CASE
		WHEN time BETWEEN "00:01:00" AND "06:00:00" THEN "Early Morning"
        WHEN time BETWEEN "06:01:00" AND "11:59:00" THEN "Morning"
        WHEN time BETWEEN "12:00:00" AND "18:00:00" THEN "Afternoon"
        WHEN time BETWEEN "18:01:00" AND "21:00:00" THEN "Evening"
        WHEN time BETWEEN "21:01:00" AND "00:00:00" THEN "Night"
        END
);

SET SQL_SAFE_UPDATES = 0;

-- Creating column "weekday"

ALTER TABLE Sales ADD COLUMN weekday VARCHAR (25);

SELECT
	date,
    DAYNAME(date) AS "weekday"
FROM Sales;

UPDATE Sales
SET weekday = DAYNAME(date);

-- Creating column "month"

ALTER TABLE Sales ADD COLUMN month VARCHAR (25);

UPDATE Sales
SET month = MONTHNAME(date);

SELECT
	date,
    MONTHNAME(date) AS "month"
FROM Sales;


