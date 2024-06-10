----- MY SQL PROJECT

-- creating departments table
CREATE  TABLE departments(
	department_id INT PRIMARY KEY,
	department VARCHAR(50) 
	);
-- creating aisle table
CREATE TABLE aisle (
   aisle_id INT PRIMARY KEY,
   aisle VARCHAR(70) 
   );
 -- creating products table
CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_Name VARCHAR(300) ,
    aisle_id INT REFERENCES aisle(aisle_id),
	department_id INT REFERENCES departments(department_id),
    unit_Cost NUMERIC(10,2),
	unit_Price NUMERIC(10,2)
 );
 -- creating orders table
 CREATE TABLE orders (
	 order_id  INT PRIMARY KEY,
	 user_id   INT,
	 product_id  INT REFERENCES products(product_id),
	 quantity INT,
	 order_date DATE,
	 order_dow INT,
	 order_hour_of_day INT,
	 days_since_prior_order INT,
	 order_status VARCHAR(15)
	  );

SELECT *
FROM orders;


---Create a Database with the provided datasets from InstaCart and answer the following business questions:
--Q1 What are the top-selling products by revenue, and how much revenue have they generated?
/*Q2 On which day of the week are chocolates mostly sold?
Q3 Do we have any dept where we have made over $15m in revenue and what is the profit?
Q4 Is it true that customers buy more alcoholic products on Xmas day 2019?
Q5 Which year did Instacart generate the most profit?
Q6 How long has it been since the last cheese order?
Q7 What time of the day do we sell alcohols the most?
Q8 What is the total revenue generated in Qtr. 2 & 3 of 2016 from breads?
Q9 Which 3  products do people buy at night(2020 - 2022)?
Q10 What is the total revenue generated from juice products?
NOTE: order_dow means order day of week ie 0 = Sunday, 1 = Monday---*/
--NOTE: days_since_prior_order is from 0-30





--Q1 What are the top-selling products by revenue, and how much revenue have they generated?

SELECT  p.product_name AS Top_Selling_Products,
        CONCAT('$', SUM(o.quantity*p.unit_price)) AS total_revenue 
FROM products AS p
INNER JOIN orders AS o ON o.product_id = p.product_id
GROUP BY p.product_name 
ORDER BY SUM(o.quantity*p.unit_price) DESC
LIMIT 5;





--Q2 On which day of the week are chocolates mostly sold?
--NOTE: order_dow means order day of week ie 0 = Sunday, 1 = Monday---*/
SELECT 
    CASE 
        WHEN o.order_dow = 0 THEN 'Sunday'
        WHEN o.order_dow = 1 THEN 'Monday'
        WHEN o.order_dow = 2 THEN 'Tuesday'
        WHEN o.order_dow = 3 THEN 'Wednesday'
        WHEN o.order_dow = 4 THEN 'Thursday'
        WHEN o.order_dow = 5 THEN 'Friday'
        WHEN o.order_dow = 6 THEN 'Saturday'
    END AS day_of_week,
    COUNT(o.order_id) AS order_count_for_chocolates
FROM orders AS o
INNER JOIN products AS p ON o.product_id = p.product_id
WHERE p.product_name ILIKE '%chocolate%'
GROUP BY o.order_dow
ORDER BY order_count_for_chocolates DESC
LIMIT 1;


--3 Do we have any dept where we have made over $15m in revenue and what is the profit?

SELECT 
    d.department,
    CONCAT('$',SUM(o.quantity*p.unit_price)) AS revenue,
    CONCAT('$', ROUND(SUM((p.unit_price - p.unit_cost) * o.quantity), 0)) AS total_profit
FROM departments AS d
INNER JOIN products AS p ON d.department_id = p.department_id
INNER JOIN orders AS o ON o.product_id = p.product_id
GROUP BY  d.department
HAVING SUM(o.quantity*p.unit_price) > 15000000
ORDER BY SUM(o.quantity*p.unit_price) DESC;



---4. Is it true that customers buy more alcoholic products on Xmas day 2019?
SELECT d.department, 
       SUM(o.quantity) AS Total_quantity
FROM departments AS d
INNER JOIN products AS p USING (department_id)
INNER JOIN orders AS o USING (product_id)
WHERE   o.order_date = '2019-12-25'     -- Filter for Christmas Day 2019      
GROUP BY d.department
ORDER BY SUM (o.quantity) DESC;


--Q5 Which year did Instacart generate the most profit?
SELECT EXTRACT(YEAR FROM o.order_date) AS years,     
           CONCAT('$',ROUND(SUM((p.unit_price - p.unit_cost)* o.quantity ),0))  AS total_profit
FROM products AS p
INNER JOIN orders AS o ON p.product_id = o.product_id
GROUP BY EXTRACT(YEAR FROM o.order_date) 
ORDER BY SUM((p.unit_price - p.unit_cost)* o.quantity )DESC
LIMIT 1;



--Q6 How long has it been since the last cheese order?
--NOTE: days_since_prior_order is from 0-30

SELECT
MAX(o.days_since_prior_order) AS days_since_last_order
FROM aisle AS a
INNER JOIN products AS p USING (aisle_id)
INNER JOIN orders AS o USING (product_id)
WHERE p.product_name ILIKE ('% Cheese%');




---Q7 What time of the day do we sell alcohols the most?
SELECT 
    o.order_hour_of_day , 
    SUM(o.quantity) AS total_sales
FROM departments AS d
INNER JOIN products AS p USING (department_id)
INNER JOIN orders AS o USING (product_id)
WHERE d.department = 'alchohol'
GROUP BY o.order_hour_of_day
ORDER BY total_sales DESC
LIMIT 1;


---Q8 What is the total revenue generated in Qtr. 2 & 3 of 2016 from breads?
SELECT 
       CONCAT('$', SUM(o.quantity*p.unit_price)) AS total_revenue_from_breads_in_2and3_Qtr_in_2016 
FROM orders AS o
INNER JOIN products AS p ON o.product_id = p.product_id
WHERE product_name ILIKE '%Bread%'
AND ((EXTRACT(QUARTER FROM o.order_date) = 2 AND EXTRACT(YEAR FROM o.order_date) = 2016) 
OR (EXTRACT(QUARTER FROM o.order_date) = 3 AND EXTRACT(YEAR FROM o.order_date) = 2016)
);
					
				
										
--Q9 Which 3  products do people buy at night(2020 - 2022)?

SELECT p.product_name, 
       COUNT(o.order_id) AS total_orders
FROM orders AS o
INNER JOIN products AS p ON o.product_id = p.product_id
WHERE (o.order_hour_of_day >= 20 OR o.order_hour_of_day <= 6 )       -- Night hours between 8 PM and 6 AM gotten from google
  AND o.order_date BETWEEN '2020-01-01' AND '2022-12-31'            
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 3;



--Q10 What is the total revenue generated from juice products?

SELECT  CONCAT('$', SUM(o.quantity * p.unit_price)) AS total_revenue_from_juice_products 
FROM  orders AS o
INNER JOIN products AS p ON o.product_id = p.product_id
WHERE p.product_name ILIKE '%Juice%';
	
