------------------------------
-- Data Exploration --
------------------------------
SELECT * FROM public.sales_orders;

-------------------------------------------
-- Top Performing Sub-Categories by Country
-------------------------------------------
WITH subcategory_sales_per_country AS (
    SELECT 
        country,
        sub_category,
        SUM(sales) AS total_sales 
    FROM public.sales_orders
    GROUP BY 2, 1
    ORDER BY total_sales DESC
), 
ranked_subcategories AS (
    SELECT 
        country,
        sub_category,
        total_sales,
        RANK() OVER (PARTITION BY country ORDER BY total_sales DESC) AS rank
    FROM subcategory_sales_per_country 
) 
SELECT 
    country,
    sub_category,
    total_sales
FROM ranked_subcategories
WHERE rank = 1;

-------------------------------------------
-- Top Performing Cities by Country
-------------------------------------------
SELECT 
    city,
    country,
    total_sales
FROM (
    SELECT 
        city,
        country,
        SUM(sales) AS total_sales,
        DENSE_RANK() OVER(PARTITION BY country ORDER BY SUM(sales) DESC) AS rank
    FROM public.sales_orders
    GROUP BY 1, 2
) q
WHERE rank = 1
ORDER BY total_sales DESC;

-------------------------------------------
-- Top Selling Products by Sub-Category
-------------------------------------------
SELECT 
    product_name, 
    sub_category,
    total_sales 
FROM (
    SELECT 
        product_name, 
        sub_category,
        SUM(sales) AS total_sales,
        RANK() OVER(PARTITION BY sub_category ORDER BY SUM(sales) DESC) AS r
    FROM public.sales_orders
    GROUP BY 1, 2  
) 
WHERE r = 1;

-------------------------------------------
-- Yearly Sales Performance Metrics
-------------------------------------------
-- Grand Total and YoY Comparison
SELECT 
    year,
    total_sales,
    COALESCE(total_sales - LAG(total_sales,1) OVER (ORDER BY year), 0) AS diff,
    ROUND(	
        (total_sales - LAG(total_sales, 1) OVER (ORDER BY year)) * 100 / 
        LAG(total_sales, 1) OVER (ORDER BY year)
    , 2) AS per
FROM (
    SELECT DISTINCT
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales) OVER(PARTITION BY EXTRACT(YEAR FROM order_date)) AS total_sales
    FROM public.sales_orders
    ORDER BY year
);

-- Cumulative Sales Trend
SELECT DISTINCT
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(sales) OVER(ORDER BY EXTRACT(YEAR FROM order_date)) AS total_sales
FROM public.sales_orders
ORDER BY year;

-------------------------------------------
-- Profitability Analysis
-------------------------------------------
-- Countries with Negative Profit
SELECT 
    country,
    COUNT(order_id) AS negative_profit_orders,
    SUM(profit) AS total_negative_profit,
    ROUND(SUM(profit) / COUNT(order_id), 2) AS avg_loss_per_order,
    COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM public.sales_orders WHERE profit < 0) AS percentage_of_all_losses
FROM public.sales_orders
WHERE profit < 0
GROUP BY country
ORDER BY total_negative_profit;

-- Profit Segmentation
SELECT 
    order_id,
    customer_id,
    country, 
    profit, 
    CASE 
        WHEN profit < 0 THEN 'Negative' 
        WHEN profit = 0 THEN 'No Profit'
        ELSE 'Profit'
    END profit_Type
FROM public.sales_orders 
WHERE profit = 0;

-------------------------------------------
-- Customer Behavior Analysis
-------------------------------------------
-- Customer Order Frequency & Value
SELECT 
    customer_id,
    customer_name,
    COUNT(Order_id) AS total_order,
    SUM(profit) AS total_profit
FROM public.sales_orders
GROUP BY 1, 2
ORDER BY total_order DESC;

-------------------------------------------
-- Product Performance Metrics
-------------------------------------------
-- Sub-Category Order Volume
SELECT 
    sub_category,
    COUNT(order_id) AS overall_orders
FROM public.sales_orders
GROUP BY 1
ORDER BY overall_orders DESC;

-- Sub-Category Sales Performance
SELECT 
    sub_category,
    SUM(Sales) AS overall_sales
FROM public.sales_orders
GROUP BY 1
ORDER BY overall_sales DESC;

-- Sub-Category Profitability
SELECT 
    sub_category,
    SUM(profit) AS overall_profit
FROM public.sales_orders
GROUP BY 1
ORDER BY overall_profit DESC;

-- Product Order Volume
SELECT 
    product_name,
    sub_category,
    COUNT(order_id) AS overall_orders
FROM public.sales_orders
GROUP BY 1, 2
ORDER BY overall_orders DESC;