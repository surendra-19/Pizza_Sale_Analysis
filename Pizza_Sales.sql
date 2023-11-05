
USE project;
SHOW TABLES; -- Checking for the tables available in database.

DESC pizza_sales; -- Now Let's Check out What is the structure of the data in Table

SELECT * FROM pizza_sales; -- view all records

SELECT COUNT(DISTINCT order_id) AS `Total Orders` FROM pizza_sales; -- Finding the no. of orders received

SELECT SUM(quantity) AS `Pizza's Sold` FROM pizza_sales; -- Finding the No.of pizas sold

SELECT ROUND(SUM(total_price),2) AS `Total Revenue` FROM pizza_sales; -- Total revenue generated

SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) AS `Amount Per Order` FROM pizza_sales; -- Finding the Amount received per order

SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS `Pizza per order` FROM pizza_sales; -- Find The no. of pizzas sold per order

UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y'); -- changing date structure to a sql recognised one

ALTER TABLE pizza_sales MODIFY order_date DATE; -- modifying its data type from text to date



SELECT DAYNAME(order_date), COUNT(DISTINCT order_id) FROM pizza_sales
GROUP BY DAYNAME(order_date) order by COUNT(DISTINCT order_id) desc; -- Identifying Trend based on a day

SELECT monthname(order_date), COUNT(DISTINCT order_id) FROM pizza_sales
GROUP BY monthname(order_date) order by COUNT(DISTINCT order_id) desc; -- Identifying Trend based on a month

SELECT pizza_category,round(SUM(total_price)/(select SUM(total_price) from pizza_sales) *100,2) as `Percentage` from pizza_sales group by pizza_category;

/*
SELECT pizza_category: In this part of the query, we specify the "pizza_category" column that we want to include in the result. This column represents the categories of pizza.

SUM(total_price): Here, we calculate the sum of the "amount" column for each group of rows with the same "pizza_category." This provides the total sales for each category.

/ (SELECT SUM(total_price) FROM pizza_sales): We divide the sum of "amount" for each category by the total sum of "amount" for all rows in the "pizza_sales" table. This part of the query calculates the percentage of sales for each category in relation to the total sales.

* 100: To convert the result into a percentage, we multiply it by 100.
*/

SELECT pizza_size,round(sum(quantity)/(select sum(quantity) from pizza_sales)*100,2) FROM pizza_sales group by pizza_size; -- finding the pizza sales based on pizza size

select pizza_category,sum(quantity) from pizza_sales group by pizza_category; -- identifying the highest sold pizza category

select pizza_name,sum(quantity) FROM pizza_sales group by pizza_name order by sum(quantity) desc limit 5; -- Top 5 sold pizzas

select pizza_name,sum(quantity) FROM pizza_sales group by pizza_name order by sum(quantity) limit 5; -- worst 5 sold pizzas





