

-- Count of all products:


SELECT COUNT(*) AS total_products
FROM cosmetics_products;


-- Average, Minimum, and Maximum Product Price:

SELECT AVG(price) AS average_price,
       MIN(price) AS min_price,
       MAX(price) AS max_price
FROM cosmetics_products;


-- Average, Minimum, and Maximum Product Rating:

SELECT AVG(rating) AS average_rating,
       MIN(rating) AS min_rating,
       MAX(rating) AS max_rating
FROM cosmetics_products
WHERE rating IS NOT NULL;


-- Count of products per category, ordered by frequency:

SELECT category, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY category
ORDER BY product_count DESC;


-- Count of products per subcategory, showing the top 10:

SELECT subcategory, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY subcategory
ORDER BY product_count DESC
LIMIT 10;


-- Ratings Analysis:
-- Average rating for each product category:

SELECT category, AVG(rating) AS average_rating
FROM cosmetics_products
WHERE rating IS NOT NULL
GROUP BY category
ORDER BY average_rating DESC;


-- Average rating for each product subcategory (top 10):

SELECT subcategory, AVG(rating) AS average_rating
FROM cosmetics_products
WHERE rating IS NOT NULL
GROUP BY subcategory
ORDER BY average_rating DESC
LIMIT 10;


-- Product categories with the lowest average ratings (bottom 5):

SELECT category, AVG(rating) AS average_rating
FROM cosmetics_products
WHERE rating IS NOT NULL
GROUP BY category
ORDER BY average_rating ASC
LIMIT 5;


-- Product subcategories with the lowest average ratings (bottom 5):

SELECT subcategory, AVG(rating) AS average_rating
FROM cosmetics_products
WHERE rating IS NOT NULL
GROUP BY subcategory
ORDER BY average_rating ASC
LIMIT 5;


-- Brand, Form, and Color Analysis:
-- Top 10 brands by product count:

SELECT brand, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY brand
ORDER BY product_count DESC
LIMIT 10;


-- Distribution of products by form:

SELECT form, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY form
ORDER BY product_count DESC;


-- Top 10 colors by product count:

SELECT color, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY color
ORDER BY product_count DESC
LIMIT 10;


-- Sales & Revenue Analysis:
--Total sales amount for all products:

SELECT SUM(price) AS total_sales
FROM cosmetics_products;


-- Total sales amount for each product category, ordered by highest sales:

SELECT category, SUM(price) AS total_sales_amount
FROM cosmetics_products
GROUP BY category
ORDER BY total_sales_amount DESC;


-- Total sales amount for each product subcategory, ordered by highest sales (top 5):

SELECT subcategory, SUM(price) AS total_sales_amount
FROM cosmetics_products
GROUP BY subcategory
ORDER BY total_sales_amount DESC
LIMIT 5;


-- Geographical & Cross-Category Analysis:
-- Number of products from each country:

SELECT country, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY country
ORDER BY product_count DESC;


-- Distribution of products across categories for each country:

SELECT country, category, COUNT(*) AS product_count
FROM cosmetics_products
GROUP BY country, category
ORDER BY country, product_count DESC;


-- Average price of products for each country:

SELECT country, AVG(price) AS average_price
FROM cosmetics_products
GROUP BY country
ORDER BY average_price DESC;


-- Top 3 categories by sales in 'India':

SELECT category, SUM(price) AS total_sales_amount
FROM cosmetics_products
WHERE country = 'India'
GROUP BY category
ORDER BY total_sales_amount DESC
LIMIT 3;


-- Top 3 categories by sales in 'USA':

SELECT category, SUM(price) AS total_sales_amount
FROM cosmetics_products
WHERE country = 'USA'
GROUP BY category
ORDER BY total_sales_amount DESC
LIMIT 3;


-- Products with price greater than the overall average price:

SELECT product_name, price, category
FROM cosmetics_products
WHERE price > (SELECT AVG(price) FROM cosmetics_products)
ORDER BY price DESC;


-- Count of products with a rating of 4.5 or higher:

SELECT COUNT(*) AS highly_rated_products_count
FROM cosmetics_products
WHERE rating >= 4.5 AND rating IS NOT NULL;



