SELECT * FROM [dbo].[LITA Capstone Dataset 1]

-----Retrieve the total sales for each product category-----
ALTER TABLE [dbo].[LITA Capstone Dataset 1]
ADD Total_Sales int

UPDATE [dbo].[LITA Capstone Dataset 1]
SET Total_Sales = Quantity * UnitPrice

SELECT Product, Sum(Total_Sales) AS Total_Sales FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Product

----------Find the number of sales transactions in each region------------
SELECT Region, COUNT(*) AS Number_of_Sales_Per_Region 
FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Region

----Find the highest-selling product by total sales value----
SELECT TOP 1 Product, Sum(Total_Sales) AS Total_Sales_Value FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Product
ORDER BY Total_Sales_Value DESC

------Calculate total revenue per product----------
SELECT Product, Sum(Total_Sales) AS Total_Revenue FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Product

-------Calculate monthly sales totals for the current year-------
SELECT YEAR(OrderDate) AS Sales_Year,
Month(OrderDate) AS Sales_Month,
SUM(Total_Sales) AS Total_Monthly_Sales
FROM [dbo].[LITA Capstone Dataset 1]
WHERE YEAR(OrderDate) = 2024
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Sales_Month 

---------Find the top 5 customers by total purchase amount-----
SELECT TOP 5 Customer_Id, Sum(Total_Sales) AS Total_Purchase_Amount FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Customer_Id
ORDER BY Total_Purchase_Amount DESC

----------Calculate the percentage of total sales contributed by each region--------
SELECT Region, SUM(Total_Sales) AS Sales_Per_Region, 
(SUM(Total_Sales)*1.0 /(SELECT SUM(Total_Sales) FROM [dbo].[LITA Capstone Dataset 1]))*100 AS Percentage_of_Total_Sales
FROM [dbo].[LITA Capstone Dataset 1]
GROUP BY Region
ORDER BY Sales_Per_Region DESC

---------Identify products with no sales in the last quarter----------
SELECT [Product] FROM [dbo].[LITA Capstone Dataset 2] 
WHERE [Product] NOT IN(
SELECT [Product] FROM [dbo].[LITA Capstone Dataset 1] WHERE OrderDate >= DATEADD(MONTH, -3, GETDATE())
)

