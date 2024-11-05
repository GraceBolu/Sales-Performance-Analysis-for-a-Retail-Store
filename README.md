## PROJECT TITLE: SALES PERFORMANCE ANALYSIS FOR A RETAIL STORE

### PROJECT OUTLINE
1. [Project Overview](#project-overview)
2. [Tools Used](#tools-used)
3. [Data Cleaning and Preparation](#data-cleaning-and-preparation)
4. [Exploratory Data Analysis](#exploratory-data-analysis)
5. [Data Analysis](#data-analysis)
6. [Data Visualization](#data-visualization)
7. [Inferences](#inferences)
8. [Conclusion](#conclusion)
9. [Limitations](#limitations)

### Project Overview
In this project, I analyzed the sales performance of a retail store to discover top-selling products, regional performance of products and sales trends.

### TOOLS USED
- Microsoft Excel: For ddata cleaning, creating pivot tables and charts
- SQL: For data manipulation, data retrieval and data analysis
- PoweBI:  Data analysis, visualization and storytelling

### Data Cleaning and Preparation
- Data loading and inspection
- Data cleaning

### EXPLORATORY DATA ANALYSIS
- What is the total sales for each product category?
- What is the number of sales transactions in each region.
- Find the highest-selling product by total sales value.
- What is the total revenue per product?
- Calculate monthly sales totals for the current year.
- Find the top 5 customers by total purchase amount.
- Calculate the percentage of total sales contributed by each region.
- Identify products with no sales in the last quarter
  
### DATA ANALYSIS
- What is the total sales for each product category?

  ```
    ALTER TABLE [dbo].[LITA Capstone Dataset 1]
    ADD Total_Sales int

    UPDATE [dbo].[LITA Capstone Dataset 1]
    SET Total_Sales = Quantity * UnitPrice

    SELECT Product, Sum(Total_Sales) AS Total_Sales FROM [dbo].[LITA Capstone Dataset 1]
    GROUP BY Product
   ```
- What is the number of sales transactions in each region.

```
SELECT Region, COUNT(*) AS Number_of_Sales_Per_Region 
    FROM [dbo].[LITA Capstone Dataset 1]
    GROUP BY Region
```

-  Find the highest-selling product by total sales value.
```
    SELECT TOP 1 Product, Sum(Total_Sales) AS Total_Sales_Value FROM [dbo].[LITA Capstone Dataset 1]
    GROUP BY Product
    ORDER BY Total_Sales_Value DESC
```

- What is the total revenue per product?
```
  SELECT Product, Sum(Total_Sales) AS Total_Revenue FROM [dbo].[LITA Capstone Dataset 1]
  GROUP BY Product
```
    
- Calculate monthly sales totals for the current year.

```
    SELECT YEAR(OrderDate) AS Sales_Year,
    Month(OrderDate) AS Sales_Month,
    SUM(Total_Sales) AS Total_Monthly_Sales
    FROM [dbo].[LITA Capstone Dataset 1]
    WHERE YEAR(OrderDate) = 2024
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ORDER BY Sales_Month 
```

- Find the top 5 customers by total purchase amount.

```
    SELECT TOP 5 Customer_Id, Sum(Total_Sales) AS Total_Purchase_Amount FROM [dbo].[LITA Capstone Dataset 1]
    GROUP BY Customer_Id
    ORDER BY Total_Purchase_Amount DESC
```

- Calculate the percentage of total sales contributed by each region.

```
    SELECT Region, SUM(Total_Sales) AS Sales_Per_Region, (SUM(Total_Sales)*1.0 /(SELECT SUM(Total_Sales)
    FROM [dbo].[LITA Capstone Dataset1]))*100 AS Percentage_of_Total_Sales
    FROM [dbo].[LITA Capstone Dataset 1]
    GROUP BY Region
    ORDER BY Sales_Per_Region DESC
```

- Identify products with no sales in the last quarter

  ```
      SELECT [Product] FROM [dbo].[LITA Capstone Dataset 2] 
      WHERE [Product] NOT IN(
      SELECT [Product] FROM [dbo].[LITA Capstone Dataset 1] WHERE OrderDate >= DATEADD(MONTH, -3, GETDATE()))
   ```
### Data Visualization



### Inferences

### Conclusion

### Limitations
