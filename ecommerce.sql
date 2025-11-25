CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE retail_data(
InvoiceNo VARCHAR(20),
StockCode VARCHAR(20),
Description VARCHAR(255),
Quantity INT,
InvoiceDate DATETIME,
UnitPrice DECIMAL(10,2),
CustomerID INT,
Country VARCHAR(100),
Total_Sales DECIMAL(10,2),
Invoice_Month VARCHAR(20),
Invoice_Year INT,
Day_of_Week VARCHAR(20)); 


SELECT * FROM retail_data;
SELECT COUNT(*) FROM retail_data;

#Total Sales(Revenue)
SELECT ROUND(SUM(Total_Sales),2) AS total_sales FROM retail_data;

#Total Orders(Unique Invoices)
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail_data;

#Average Order Value(AOV)
SELECT ROUND(SUM(Total_Sales)/COUNT(DISTINCT InvoiceNo),2) AS avg_order_value
FROM retail_data;

#Sales by Year
SELECT 
    Invoice_Year,
    ROUND(SUM(Total_Sales), 2) AS total_sales
FROM retail_data
GROUP BY Invoice_Year;

#Sales by month
SELECT Invoice_Month,ROUND(SUM(Total_Sales),2) AS total_sales
FROM retail_data
GROUP BY Invoice_Month;

#Sales by Day of week
SELECT Day_of_Week,ROUND(SUM(Total_Sales),2) AS total_sales
FROM retail_data
GROUP BY Day_of_Week
ORDER BY total_sales DESC;

#Sales by country
SELECT Country,ROUND(SUM(Total_Sales),2) AS total_sales
FROM retail_data
GROUP BY Country
ORDER BY total_sales DESC;

#Top 10 products by revenue
SELECT Description,ROUND(SUM(Total_Sales),2) AS revenue
FROM retail_data
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


#Top 10 products by quantity sold
SELECT Description,SUM(Quantity) AS Quantity_Sold
FROM retail_data
GROUP BY Description 
ORDER BY Quantity_Sold DESC
LIMIT 10;

#Top 10 customers by revenue
SELECT CustomerID,ROUND(SUM(Total_Sales),2) AS revenue,COUNT(DISTINCT InvoiceNo)
FROM retail_data
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;

#Most frequently bought products (by number of orders)
SELECT Description,COUNT(DISTINCT InvoiceNo) AS order_frequency
FROM retail_data
GROUP BY Description
ORDER BY order_frequency DESC
LIMIT 10;

#Products with the highest unit price.
SELECT Description,UnitPrice
FROM retail_data
GROUP BY Description,UnitPrice
ORDER BY UnitPrice DESC
LIMIT 10;


#Products that generated the most profit (using Total_Sales)
SELECT Description,ROUND(SUM(Total_Sales),2) AS revenue
FROM retail_data
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


#Countries with most unique customers.
SELECT Country,COUNT(DISTINCT CustomerID) AS unique_customers
FROM retail_data
GROUP BY Country
ORDER BY unique_customers DESC;

#Highest spending customers
SELECT CustomerID,ROUND(SUM(Total_Sales),2) AS total_spent
FROM retail_data
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;


#Most loyal customers (highest orders count).
SELECT CustomerID,COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail_data
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;


#Sales by Quarter
SELECT Invoice_Year,QUARTER(STR_TO_DATE(InvoiceDate,'%d-%m-%y')) AS quarter,ROUND(SUM(Total_Sales),2) AS total_sales
FROM retail_data
GROUP BY Invoice_Year,quarter
ORDER BY Invoice_Year,quarter;


#Find Duplicate Invoices
SELECT InvoiceNo,COUNT(*) AS count_rows
FROM retail_data
GROUP BY InvoiceNo
HAVING COUNT(*) > 1;


#Rank Products by Revenue
SELECT Description,ROUND(SUM(Total_Sales),2) AS revenue,RANK() OVER(ORDER BY SUM(Total_Sales) DESC) AS revenue_rank
FROM retail_data
GROUP BY Description 
ORDER BY revenue DESC
LIMIT 10;


#Running cumulative monthly sales
SELECT Invoice_Month,SUM(Total_Sales) AS monthly_sales
FROM retail_data
GROUP BY Invoice_Month;


#High value orders(order>500)
SELECT *
FROM retail_data
WHERE Total_Sales > 500
ORDER BY Total_Sales DESC;


#Customer segmentation by spending.
SELECT CustomerID,
SUM(Total_Sales) AS total_spent,
CASE WHEN SUM(Total_Sales)>5000 THEN 'Premium'
	 WHEN SUM(Total_Sales) BETWEEN 1000 AND 5000 THEN 'Gold'
     ELSE 'Regular'
END AS customer_segment
FROM retail_data
GROUP BY CustomerID
ORDER BY total_spent DESC;     