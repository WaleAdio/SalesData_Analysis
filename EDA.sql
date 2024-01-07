SELECT * 
FROM SalesProject.Sales;

-- How many unique cities does the data have?
SELECT
	DISTINCT city
FROM Sales;

-- In which city is each branch?
SELECT
	DISTINCT branch,
    city
FROM Sales
ORDER BY branch;

-- How many unique product lines does the data have?
SELECT
	COUNT(DISTINCT(product_line))
FROM Sales;

-- What is the most common payment method?
SELECT
	payment_method,
    COUNT(payment_method) AS Numbers
FROM Sales
GROUP BY payment_method
ORDER BY  Numbers DESC;

-- What is the most selling product line?
SELECT
	product_line,
    COUNT(product_line) AS most_sales
FROM Sales
GROUP BY product_line
ORDER BY most_sales DESC;

-- What is the total revenue by month?
SELECT
	month,
    SUM(unit_price * quantity) AS rev_month
FROM Sales
GROUP BY month;

SELECT
	month,
    SUM(total) AS total_rev
FROM Sales
GROUP BY month;

-- What month had the largest cost of goods?
SELECT
	month,
    sum(cost_of_goods) AS CostofGoods
FROM Sales
GROUP BY month;

-- What product line had the largest revenue?
SELECT
	product_line,
    SUM(total) AS total_rev
FROM Sales
GROUP BY product_line
ORDER BY total_rev DESC;

-- What city had the largest revenue?
SELECT
	city,
    SUM(total) AS total_rev
FROM Sales
GROUP BY city
ORDER BY total_rev DESC;

-- What product line has the largest VAT?
SELECT
	product_line,
    SUM(tax) AS VAT
FROM Sales
GROUP BY product_line
ORDER BY VAT DESC;

SELECT
	product_line,
    AVG(tax) AS VAT
FROM Sales
GROUP BY product_line
ORDER BY VAT DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT
	product_line,
    ROUND(AVG(quantity), 3) AS avg_qty,
    CASE
		WHEN AVG(quantity) > 5.5 THEN "good"
        ELSE "bad"
	END AS comment
FROM sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
SELECT
	branch,
    SUM(quantity) AS products_sold
FROM sales
GROUP BY branch
ORDER BY products_sold DESC

SELECT
	branch,
    SUM(quantity) AS products_sold
    FROM sales
    GROUP BY branch
    HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);
    
-- What is the most common product line by gender?
SELECT
	gender,
    product_line,
    COUNT(gender) AS qty
FROM sales
GROUP BY gender, product_line
ORDER BY qty DESC;

-- What is the average rating of each product line?
SELECT 
	product_line,
    ROUND(AVG(rating), 3) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Number of sales made in each time of the day per weekday?
SELECT
	weekday,
    time_of_day,
    COUNT(invoice_id) AS sales_made
FROM sales
GROUP BY weekday, time_of_day
ORDER BY weekday

SELECT 
	time_of_day,
    COUNT(invoice_id) AS sales_made
    FROM sales
    GROUP BY time_of_day
    
    SELECT 
	time_of_day,
    COUNT(invoice_id) AS sales_made
    FROM sales
    WHERE weekday = "Monday"
    GROUP BY time_of_day
    
-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
    ROUND(SUM(total), 3) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT
	city,
    ROUND(SUM(tax), 3) vat_percent
FROM sales
GROUP BY city
ORDER BY vat_percent DESC

SELECT
	city,
    ROUND(AVG(tax), 3) vat_percent
FROM sales
GROUP BY city
ORDER BY vat_percent DESC


-- Which customer type pays the most in VAT?
SELECT
	customer_type,
    ROUND(SUM(tax), 3) AS vat_payment
FROM sales
GROUP BY customer_type
ORDER By vat_payment DESC

-- How many unique customer types does the data have?
SELECT
	customer_type,
    COUNT(customer_type) AS customers
FROM sales
GROUP BY customer_type

-- How many unique payment methods does the data have?
SELECT
	payment_method,
    COUNT(payment_method) AS Total
FROM sales
GROUP BY payment_method

-- What is the most common customer type?
SELECT
	customer_type,
    COUNT(customer_type) AS total
FROM sales
GROUP BY customer_type
ORDER BY total DESC

-- Which customer type buys the most?
SELECT
	customer_type,
    SUM(quantity) AS total_purchase
FROM sales
GROUP BY customer_type

-- What is the gender of most of the customers?
SELECT
	customer_type,
    gender,
    COUNT(gender) AS gender_count
FROM sales
GROUP BY customer_type, gender
ORDER BY gender_count DESC

-- What is the gender distribution per branch?
SELECT
	branch,
    gender,
    COUNT(gender) AS gender_count
FROM sales
GROUP BY branch, gender
ORDER BY branch ASC

-- Which time of the day do customers give most ratings?
SELECT 
	time_of_day,
    COUNT(rating) AS ratings
FROM sales
GROUP BY time_of_day
ORDER BY ratings DESC

-- Which time of the day do customers give most ratings per branch?
SELECT 
	branch,
    time_of_day,
    COUNT(rating) AS ratings
FROM sales
GROUP BY branch, time_of_day
ORDER BY branch, time_of_day

-- Which day of the week has the best avg ratings?
SELECT
	weekday,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY weekday
ORDER BY avg_rating DESC

-- Which day of the week has the best average ratings per branch?
SELECT
	branch,
    weekday,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY branch, weekday
ORDER BY avg_rating DESC

SELECT 
	branch,
	weekday,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "B"
GROUP BY weekday
ORDER BY avg_rating DESC


