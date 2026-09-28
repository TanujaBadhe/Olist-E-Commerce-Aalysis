create database ECommerse;
use ECommerse;


--  What is the total number of orders?
select count(order_id) as total_orders from orders;

-- What is the total revenue from all order items?
select sum(price) as total_reveue from items;

-- What is the average order value?
select count(order_id)/sum(price) as avg_order_value from items;

-- What is the total number of unique customers?
select count(distinct customer_id)as total_customers from customers;

-- What is the total number of unique sellers?
select count(distinct seller_id) as total_sellers from sellers;

-- What is the total number of unique products?
select count(distinct product_id)as total_products from products;

-- How are customers distributed across states?
select customer_state ,count(*) as total_customer_count from customers group by customer_state order by total_customer_count desc;

-- How are sellers distributed across states?
desc sellers;
select seller_state,count(*) as sellers_count from sellers group by seller_state order by sellers_count desc;

-- Who are the top 10 sellers by revenue?
select seller_id,sum(price)as total_reveue from items group by seller_id order by total_reveue desc limit 10;

-- What are the top 10 products by revenue?
select product_id,sum(price) as total_reveue from items group by product_id order by total_reveue desc limit 10;

-- How many orders were made using each payment type?
select payment_type,count(*)as payment_count from payments group by payment_type order by payment_count desc;

-- What is the average payment value for each payment type?
SELECT payment_type, AVG(payment_value) AS avg_payment from payments group by payment_type order by avg_payment desc;

-- What is the distribution of review scores (1–5)?
select review_score,count(*) as review_count from reviews group by review_score order by review_count desc; 

-- What is the average review score overall?
select avg(review_score) as avg_review_core from reviews;

-- What is the total freight value collected?
select sum(freight_value) as total_freight from items;

-- What is the average freight value by product category?
select avg(freight_value) as avg_freight from items oi JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_freight DESC;

-- How many orders have not yet been delivered (missing delivery date)?
SELECT COUNT(*) AS undelivered_orders FROM orders
WHERE order_delivered_customer_date IS NULL;

-- What is the average delivery time (in days) for delivered orders?
SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days FROM orders
WHERE order_delivered_customer_date IS NOT NULL;