--- =========================================
-- Superstore Analysis using BigQuery
-- Author: Muhammad Rahil Pervaiz


-- Query 1: View Data
SELECT *
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`
LIMIT 10;


-- Query 2: Total Orders
SELECT 
  COUNT(DISTINCT Order_ID) AS total_orders
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`;


-- Query 3: Total Sales
SELECT 
  ROUND(SUM(Sales), 2) AS total_sales
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`;


-- Query 4: Sales by Category
SELECT 
  Category, 
  ROUND(SUM(Sales), 2) AS total_sales
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`
GROUP BY Category
ORDER BY total_sales DESC;


-- Query 5: Top 10 Customers by Sales
SELECT 
  Customer_Name, 
  ROUND(SUM(Sales), 2) AS total_sales
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`
GROUP BY Customer_Name
ORDER BY total_sales DESC
LIMIT 10;


-- Query 6: Sales by Region
SELECT 
  Region, 
  ROUND(SUM(Sales), 2) AS total_sales
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`
GROUP BY Region
ORDER BY total_sales DESC;


-- Query 7: Monthly Sales Trend (Handling mixed date formats)
SELECT 
  EXTRACT(YEAR FROM PARSE_DATE('%d-%m-%Y', REPLACE(Order_Date, '/', '-'))) AS order_year,
  EXTRACT(MONTH FROM PARSE_DATE('%d-%m-%Y', REPLACE(Order_Date, '/', '-'))) AS order_month,
  ROUND(SUM(Sales), 2) AS total_sales
FROM `project-d97a927b-3883-4b21-835.superstore_analysis.sales_portfolio`
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
