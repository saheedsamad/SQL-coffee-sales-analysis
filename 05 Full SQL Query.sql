-- Create a new schema (database)
CREATE SCHEMA Coffee;
SHOW TABLES FROM coffee;
SELECT * FROM coffee.cofee_data LIMIT 10;


-- Calculate total revenue for each store 
SELECT 
    store_location, 
    CONCAT('$', FORMAT(SUM(unit_price * transaction_qty), 2)) AS total_revenue
FROM 
    coffee.cofee_data
GROUP BY 
    store_location
ORDER BY 
    SUM(unit_price * transaction_qty) DESC;


-- Count total transactions for each store
SELECT 
    store_location, 
    FORMAT(COUNT(transaction_id), 0) AS total_transactions -- Adds commas to the count for readability
FROM 
    coffee.cofee_data
GROUP BY 
    store_location
ORDER BY 
    COUNT(transaction_id) DESC;


-- Find the top 5 products with the highest quantity sold
SELECT 
    product_detail, 
    FORMAT(SUM(transaction_qty), 0) AS total_quantity -- Adds commas to the quantity for readability
FROM 
    coffee.cofee_data
GROUP BY 
    product_detail
ORDER BY 
    SUM(transaction_qty) DESC
LIMIT 5;


-- Calculate total revenue for each product category 
SELECT 
    product_category, 
    CONCAT('$', FORMAT(SUM(unit_price * transaction_qty), 2)) AS total_revenue
FROM 
    coffee.cofee_data
GROUP BY 
    product_category
ORDER BY 
    SUM(unit_price * transaction_qty) DESC;
    
    
    
    -- Calculate total revenue for each product category 
SELECT 
    product_category, 
    CONCAT('$', FORMAT(SUM(unit_price * transaction_qty), 2)) AS total_revenue
FROM 
    coffee.cofee_data
GROUP BY 
    product_category
ORDER BY 
    SUM(unit_price * transaction_qty) DESC;


-- Calculate total quantity sold for each month
SELECT 
    DATE_FORMAT(STR_TO_DATE(transaction_date, '%Y-%m-%d'), '%Y-%m') AS month,
    FORMAT(SUM(transaction_qty), 0) AS total_quantity -- Adds commas for readability
FROM 
    coffee.cofee_data
GROUP BY 
    month
ORDER BY 
    month;