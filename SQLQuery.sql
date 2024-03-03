---------------------------------------------------------------------------------------
------------------------------- Feature Engineering -----------------------------------
-- Time_of_day
SELECT 
	s.Time,
	(CASE 
		WHEN s.time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN s.time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
		ELSE 'Evening'
	 END) AS Time_of_date
  FROM [dbo].[Sales] s;

ALTER TABLE [dbo].[Sales]
ADD Time_of_date VARCHAR (20);

UPDATE [dbo].[Sales]
   SET  Time_of_date = (
		CASE 
			WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
			WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening'
		END 
   );

-- day_name

SELECT Date,
	   DATENAME (Weekday, Date)
  FROM [dbo].[Sales];

ALTER TABLE [dbo].[Sales]
ADD day_name VARCHAR (10);

UPDATE [dbo].[Sales]
   SET day_name = ( DATENAME (Weekday, Date));

-- Month_name

SELECT Date,
	   DATENAME (month, Date) 
 FROM [dbo].[Sales];

ALTER TABLE [dbo].[Sales]
ADD Month_name VARCHAR (10);

UPDATE [dbo].[Sales]
   SET Month_name = (DATENAME (month, Date));

---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
-----------------------------------Generic Question------------------------------------
-- 1. How many unique cities does the data have?
SELECT DISTINCT s.City
  FROM Sales s;

-- 2. In which city is each branch?
SELECT DISTINCT s.City,
				s.Branch
  FROM Sales s;
-----------------------------------------------------------------------------------------
------------------------------------Product----------------------------------------------
-- 1. How many unique product lines does the data have ?
SELECT COUNT (DISTINCT Product_line)
  FROM Sales;
-- 2. What is the most common payment mehtod?
SELECT [Payment],
	   COUNT ([payment]) AS cnt
  FROM [dbo].[Sales]
 GROUP BY [Payment]
 ORDER BY cnt DESC;
-- 3. What is the most selling product line?
SELECT [Product_line]	
	   ,COUNT ([Product_line]) as mspl
  FROM Sales
 GROUP BY [Product_line]
 ORDER BY mspl DESC;
-- 4. How much are total revenue by month?
SELECT [Month_name],
	   SUM (Total) AS total_revenue
  FROM [dbo].[Sales]
 GROUP BY [Month_name]
 ORDER BY total_revenue DESC;
-- 5. What month had largest COGS?
SELECT TOP 1 Month_name,
			 SUM (cogs) AS largest_cogs
  FROM [dbo].[Sales]
  GROUP BY Month_name
  ORDER BY largest_cogs DESC;
-- 6. What the product line had largest revenue?
SELECT TOP 1 Product_line,
			 SUM (Total) AS revenue
  FROM [dbo].[Sales]
  GROUP BY Product_line
  ORDER BY revenue DESC;
-- 7. What is the city with largets revenue?
SELECT TOP 1 City,
			 SUM (Total) AS total_revenue
  FROM [dbo].[Sales]
  GROUP BY City
  ORDER BY total_revenue DESC;
-- 8. What is the product line had largest VAT?
SELECT TOP 1 Product_line,
			 AVG (Tax_5) AS avegare_VAT
  FROM [dbo].[Sales]
  GROUP BY Product_line
  ORDER BY avegare_VAT DESC;
-- 9. Fetch each product line and add a column to those product line showing "good", "bad". Good if its greater than average sales
SELECT Product_line,
	   CASE 
		(WHEN 
  FROM [dbo].[Sales]
 WHERE 

-- 10. Which branch sold more products than average product sold?
SELECT Branch,
	   SUM (Quantity) AS quantity
  FROM [dbo].[Sales] 
 GROUP BY Branch
HAVING SUM (Quantity) > (SELECT AVG (quantity)
						   FROM Sales);

-- 11. What is the most common product line by gender?
SELECT product_line,
	   gender,
	   COUNT (gender) AS total
 FROM Sales
GROUP BY Product_line, Gender
ORDER BY total DESC;
-- 12. What is the average rating of each product line?
SELECT Product_line,
	   ROUND (AVG (Rating), 2) AS avg_rating
  FROM Sales
 GROUP BY Product_line
 ORDER BY avg_rating DESC;

-------------------------------------------------------------------------
-------------------------------------Sales-------------------------------

-- 1. Number of sales made in each time of the day per weekday
SELECT Time_of_date,
	   day_name,
	   COUNT (*) AS total_sales
  FROM Sales
 GROUP BY Time_of_date, day_name
 ORDER BY total_sales DESC;

-- 2. Which of the customer types brings the most revenue?
SELECT Customer_type,
	   ROUND (SUM (total), 2) AS Revenue		
  FROM Sales
 GROUP BY Customer_type
 ORDER BY Revenue DESC;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT City,
	   ROUND (AVG (Tax_5), 2) AS VAT
  FROM Sales
 GROUP BY City
 ORDER BY VAT DESC;

-- 4. Which customer type pays the most in VAT?
SELECT Customer_type,
	   ROUND (AVG (Tax_5), 2) AS VAT
  FROM Sales
 GROUP BY Customer_type
 ORDER BY VAT DESC;

----------------------------------------------------------------------------
-------------------------------------Customer-------------------------------

-- 1. How many unique customer types does the data have?
SELECT DISTINCT (Customer_type)
  FROM Sales;

-- 2. How many unique payment methods does the data have?
SELECT DISTINCT (Payment)
  FROM Sales;

-- 3. What is the most common customer type?
SELECT Customer_type,
	   COUNT (Customer_type) AS tmc
  FROM Sales
 GROUP BY Customer_type
 ORDER BY tmc DESC;

-- 4. What is the gender of most of the customers?
SELECT Gender,
	   COUNT (*) AS gmc
  FROM Sales
 GROUP BY Gender
 ORDER BY gmc DESC;

-- 5. What is the gender distribution per branch?
SELECT Branch,
	   Gender,
	   COUNT (*) AS Quantity
  FROM Sales
 GROUP BY Branch,Gender
 ORDER BY Branch;

-- 6. Which time of the day do customers give most ratings?
SELECT Time_of_date,
	   ROUND (AVG (Rating), 2) avg_rating
  FROM Sales
 GROUP BY Time_of_date
 ORDER BY avg_rating DESC;

-- 7. Which time of the day do customers give most ratings per branch?
SELECT Branch,
	   Time_of_date,
	   ROUND (AVG (Rating), 2) avg_rating
  FROM Sales
 GROUP BY Time_of_date, Branch
 ORDER BY Branch;

-- 8. Which day fo the week has the best avg ratings?
SELECT day_name,
	   ROUND (AVG(Rating), 2) avg_rating	
  FROM Sales
 GROUP BY day_name
 ORDER BY avg_rating DESC;

-- 9. Which day of the week has the best average ratings per branch?
SELECT Branch,
	   day_name,
	   ROUND (AVG(Rating), 2) avg_rating	
  FROM Sales
 GROUP BY Branch, day_name
 ORDER BY Branch;