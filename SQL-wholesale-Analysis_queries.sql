-- Project 2: Wholesale Customer Analysis | SQL + Excel
-- Database: wholesale_customers, 440 Records

-- Query 1: Top 5 Customers by Total Annual Spend
SELECT id, 
       IF(Channel=1, 'Horeca', 'Retail') AS Channel_Type,
       IF(Region=1, 'Lisbon', IF(Region=2, 'Oporto', 'Other')) AS Region_Name,
       (Fresh + Milk + Grocery + Frozen + Detergents_Paper + Delicassen) AS Total_Annual_Spend
FROM wholesale_customers
ORDER BY Total_Annual_Spend DESC LIMIT 5;

-- Query 2: Revenue by Channel - Horeca vs Retail
SELECT 'Horeca' AS Channel, SUM(Fresh + Milk + Grocery + Frozen + Detergents_Paper + Delicassen) AS Total_Sales
FROM wholesale_customers WHERE Channel = 1
UNION ALL
SELECT 'Retail' AS Channel, SUM(Fresh + Milk + Grocery + Frozen + Detergents_Paper + Delicassen) AS Total_Sales
FROM wholesale_customers WHERE Channel = 2;

-- Query 3: Category Wise Revenue Analysis
SELECT 'Fresh' AS Category, SUM(Fresh) AS Total_Sales FROM wholesale_customers
UNION ALL SELECT 'Milk', SUM(Milk) FROM wholesale_customers
UNION ALL SELECT 'Grocery', SUM(Grocery) FROM wholesale_customers
UNION ALL SELECT 'Frozen', SUM(Frozen) FROM wholesale_customers
UNION ALL SELECT 'Detergents_Paper', SUM(Detergents_Paper) FROM wholesale_customers
UNION ALL SELECT 'Delicassen', SUM(Delicassen) FROM wholesale_customers
ORDER BY Total_Sales DESC;

-- Query 4: Regional Sales Distribution
SELECT IF(Region=1, 'Lisbon', IF(Region=2, 'Oporto', 'Other')) AS Region_Name,
       SUM(Fresh + Milk + Grocery + Frozen + Detergents_Paper + Delicassen) AS Total_Sales,
       COUNT(*) AS Customer_Count
FROM wholesale_customers
GROUP BY Region ORDER BY Total_Sales DESC;
