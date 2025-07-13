

drop table if exists public.sales_orders

-- Create table for sales orders data
CREATE TABLE sales_orders (
    column1 INTEGER,
    order_id VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    ship_date DATE,
    ship_mode VARCHAR(20),
    customer_id VARCHAR(20) NOT NULL,
    customer_name VARCHAR(100),
    segment VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    region VARCHAR(50),
    market VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INTEGER,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    shipping_cost DECIMAL(8,2),
    order_priority VARCHAR(20),
    delivery_days INTEGER,
    order_year INTEGER,
    order_month INTEGER ) 

-- load data in this table 

	 truncate table public.sales_orders;

	COPY public.sales_orders FROM 'D:\power Bi project\Sales KPI Analysis\DataSet\superstore.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');