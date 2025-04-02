USE Analysis

-- Select all data from the `DoorDash` table to view its current state
SELECT *
FROM `DoorDash`;


-- Describe the `DoorDash` table structure to understand its columns and data types
DESCRIBE `DoorDash`;


-- Get all distinct values of `store_primary_category` to identify unique categories
SELECT DISTINCT store_primary_category FROM DoorDash;


-- Find rows where `store_primary_category` is NULL (missing category information)
SELECT store_primary_category 
FROM DoorDash 
WHERE store_primary_category IS NULL;


-- Group by `store_primary_category` and count how many stores belong to each category
SELECT store_primary_category, COUNT(*) 
FROM DoorDash
GROUP BY store_primary_category;


-- Delete rows where the `store_primary_category` is 'chocolate' (cleaning up unwanted data)
DELETE FROM DoorDash
WHERE store_primary_category = 'chocolate';


-- Select rows with any NULL values across several critical columns (checking for missing data)
SELECT *
FROM DoorDash
WHERE 
    market_id IS NULL OR
    store_id IS NULL OR
    store_primary_category IS NULL OR
    order_protocol IS NULL OR
    total_items IS NULL OR
    subtotal IS NULL OR
    num_distinct_items IS NULL OR
    min_item_price IS NULL OR
    max_item_price IS NULL OR
    total_onshift_dashers IS NULL OR
    total_busy_dashers IS NULL OR
    total_outstanding_orders IS NULL OR
    estimated_order_place_duration IS NULL OR
    estimated_store_to_consumer_driving_duration IS NULL OR
    created_date IS NULL OR
    created_time IS NULL OR
    actual_date IS NULL OR
    actual_time IS NULL OR
    time_diff_in_minutes IS NULL OR
    order_created_at IS NULL OR
    order_actual_delivery_time IS NULL OR
    city_name IS NULL OR
    subtotal_in_dollars IS NULL OR
    order_created_day_name IS NULL OR
    min_item_price_in_dollars IS NULL OR
    max_item_price_in_dollars IS NULL OR
    estimated_order_place_duration_in_minutes IS NULL OR
    estimated_store_to_consumer_driving_duration_in_minutes IS NULL OR
    total_estimated_delivery_duration IS NULL OR
    Peak_Hour IS NULL OR
    Item_Price_Category IS NULL;


-- Create a new column `city_name` based on the `market_id` and map it to the correct city
SELECT 
    market_id,
    CASE market_id
        WHEN '1' THEN 'Miami'
        WHEN '2' THEN 'San Francisco'
        WHEN '3' THEN 'Chicago'
        WHEN '4' THEN 'New York City'
        WHEN '5' THEN 'Los Angeles'
        WHEN '6' THEN 'Others'
        ELSE 'Unknown'
    END AS City_name
FROM DoorDash;


-- Modify the `actual_date` column to have the correct data type (DATE)
ALTER TABLE DoorDash 
MODIFY COLUMN actual_date DATE;


-- Modify the `created_date` column to have the correct data type (DATE)
ALTER TABLE DoorDash 
MODIFY COLUMN created_date DATE;


-- Modify the `created_time` column to have the correct data type (TIME)
ALTER TABLE DoorDash 
MODIFY COLUMN created_time TIME;


-- Modify the `actual_time` column to have the correct data type (TIME)
ALTER TABLE DoorDash 
MODIFY COLUMN actual_time TIME;


-- Add a new `city_name` column (VARCHAR type) to the `DoorDash` table to store city names
ALTER TABLE DoorDash ADD COLUMN city_name VARCHAR(255);


-- Update the `city_name` column based on the `market_id`
UPDATE DoorDash
SET city_name = CASE market_id
                    WHEN '1' THEN 'Miami'
                    WHEN '2' THEN 'San Francisco'
                    WHEN '3' THEN 'Chicago'
                    WHEN '4' THEN 'New York City'
                    WHEN '5' THEN 'Los Angeles'
                    WHEN '6' THEN 'Others'
                    ELSE 'Unknown'
                END;


-- Set `SQL_SAFE_UPDATES` to 0, which allows updating all rows (no restrictions)
SET SQL_SAFE_UPDATES = 0;


-- Add a new column `subtotal_in_dollars` to store the subtotal in dollars instead of cents
ALTER TABLE DoorDash ADD COLUMN subtotal_in_dollars DECIMAL(10, 2);


-- Update the `subtotal_in_dollars` column by converting the `subtotal` from cents to dollars
UPDATE DoorDash
SET subtotal_in_dollars = subtotal / 100;


-- Select the `market_id`, `subtotal`, and `subtotal_in_dollars` to verify the conversion
SELECT market_id, subtotal, subtotal_in_dollars FROM DoorDash;


-- Add the `order_created_day_name` column (VARCHAR type) to store the name of the day the order was created
ALTER TABLE DoorDash ADD COLUMN order_created_day_name VARCHAR(20);


-- Update the `order_created_day_name` column using the `DAYNAME()` function to get the day name
UPDATE DoorDash
SET order_created_day_name = DAYNAME(order_created_at);


-- Add the `min_item_price_in_dollars` column (DECIMAL type) to store item prices in dollars
ALTER TABLE DoorDash ADD COLUMN min_item_price_in_dollars DECIMAL(10, 2);


-- Update the `min_item_price_in_dollars` column by converting `min_item_price` from cents to dollars
UPDATE DoorDash
SET min_item_price_in_dollars = min_item_price / 100;


-- View `min_item_price` and `min_item_price_in_dollars` to ensure the conversion is correct
SELECT min_item_price, min_item_price_in_dollars FROM DoorDash;


-- Add the `max_item_price_in_dollars` column (DECIMAL type) to store the maximum item price in dollars
ALTER TABLE DoorDash ADD COLUMN max_item_price_in_dollars DECIMAL(10, 2);


-- Update the `max_item_price_in_dollars` column by converting `max_item_price` from cents to dollars
UPDATE DoorDash
SET max_item_price_in_dollars = max_item_price / 100;


-- View `max_item_price` and `max_item_price_in_dollars` to verify the conversion
SELECT max_item_price, max_item_price_in_dollars FROM DoorDash;


-- Add the `estimated_order_place_duration_in_minutes` column (DECIMAL type) to store the duration in minutes
ALTER TABLE DoorDash ADD COLUMN estimated_order_place_duration_in_minutes DECIMAL(10, 2);


-- Update the `estimated_order_place_duration_in_minutes` column by converting the duration from seconds to minutes
UPDATE DoorDash
SET estimated_order_place_duration_in_minutes = estimated_order_place_duration / 60;


-- Add the `estimated_store_to_consumer_driving_duration_in_minutes` column (DECIMAL type) to store driving time in minutes
ALTER TABLE DoorDash 
ADD COLUMN estimated_store_to_consumer_driving_duration_in_minutes DECIMAL(10, 2);


-- Update the `estimated_store_to_consumer_driving_duration_in_minutes` column by converting the driving time from seconds to minutes
UPDATE DoorDash 
SET estimated_store_to_consumer_driving_duration_in_minutes = estimated_store_to_consumer_driving_duration / 60;


-- Add the `total_estimated_delivery_duration` column (DECIMAL type) to store the total delivery duration in minutes
ALTER TABLE DoorDash 
ADD COLUMN total_estimated_delivery_duration DECIMAL(10, 2);


-- Update the `total_estimated_delivery_duration` column by adding the estimated order placement and driving durations
UPDATE DoorDash 
SET total_estimated_delivery_duration = 
    estimated_order_place_duration_in_minutes + 
    estimated_store_to_consumer_driving_duration_in_minutes;


-- Add the `Peak_Hour` column (VARCHAR type) to categorize orders into Peak or Off-Peak hours
ALTER TABLE DoorDash
ADD COLUMN Peak_Hour VARCHAR(10);


-- Update the `Peak_Hour` column based on the hour of the `order_created_at` timestamp
UPDATE DoorDash
SET Peak_Hour = CASE 
    WHEN HOUR(order_created_at) IN (11, 12, 1, 2, 5, 6, 7, 8, 9) THEN 'Peak'
    ELSE 'Off-Peak'
END;


-- Add the `Item_Price_Category` column (VARCHAR type) to categorize items based on their price
ALTER TABLE DoorDash
ADD COLUMN Item_Price_Category VARCHAR(20);


-- Update the `Item_Price_Category` column based on the `Subtotal_in_Dollars`
UPDATE DoorDash
SET Item_Price_Category = CASE
    WHEN Subtotal_in_Dollars <= 15 THEN 'Low Price'
    WHEN Subtotal_in_Dollars BETWEEN 15 AND 50 THEN 'Medium Price'
    WHEN Subtotal_in_Dollars > 50 THEN 'High Price'
    ELSE 'Unknown' 
END;


-- Drop the `Item_Volume_Category` column if it is no longer necessary for analysis
ALTER TABLE DoorDash
DROP COLUMN Item_Volume_Category;


-- Add the `revenue_per_item` column (DECIMAL type) to store revenue per item
ALTER TABLE DoorDash
ADD COLUMN revenue_per_item DECIMAL(10, 2);


-- Update the `revenue_per_item` column by dividing `subtotal_in_dollars` by `total_items` 
-- If `total_items` is zero, set `revenue_per_item` to zero to avoid division by zero errors
UPDATE DoorDash
SET revenue_per_item = 
    CASE 
        WHEN total_items != 0 THEN subtotal_in_dollars / total_items 
        ELSE 0 
    END;


-- Add the `time_category` column to categorize orders into 'Morning', 'Afternoon', 'Evening', and 'Night'
ALTER TABLE DoorDash
ADD COLUMN time_category VARCHAR(20);


-- Update the `time_category` column based on the hour of the `order_created_at` timestamp
UPDATE DoorDash
SET time_category = CASE
    WHEN HOUR(order_created_at) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN HOUR(order_created_at) BETWEEN 12 AND 16 THEN 'Afternoon'
    WHEN HOUR(order_created_at) BETWEEN 17 AND 20 THEN 'Evening'
    ELSE 'Night'
END;


-- Select total revenue grouped by `created_date` to see daily revenue trends
SELECT created_date, 
       SUM(subtotal_in_dollars) AS total_revenue
FROM DoorDash
GROUP BY created_date
ORDER BY created_date;


-- Calculate the total revenue per hour and its percentage contribution to the total revenue
SELECT 
    HOUR(order_created_at) AS order_hour,
    SUM(subtotal_in_dollars) AS total_revenue,
    (SUM(subtotal_in_dollars) / (SELECT SUM(subtotal_in_dollars) FROM DoorDash) * 100) AS revenue_percentage
FROM DoorDash
GROUP BY order_hour
ORDER BY order_hour;


-- Calculate the average delivery time (in minutes) for each `time_category`
SELECT 
    time_category,
    AVG(CAST(time_diff_in_minutes AS SIGNED)) AS avg_delivery_time
FROM 
    DoorDash
GROUP BY 
    time_category
ORDER BY 
    FIELD(time_category, 'Morning', 'Afternoon', 'Evening', 'Night');


-- Analyze various performance metrics by `time_category` such as dasher load factor, 
-- estimated delivery duration, and outstanding orders per dasher
SELECT 
    time_category,
    AVG(CAST(total_busy_dashers AS SIGNED) / CAST(total_onshift_dashers AS SIGNED)) AS avg_dasher_load_factor,
    AVG(CAST(total_estimated_delivery_duration AS SIGNED)) AS avg_estimated_delivery_duration,
    AVG(CAST(time_diff_in_minutes AS SIGNED)) AS avg_delivery_time,
    AVG(CAST(total_outstanding_orders AS SIGNED) / NULLIF(CAST(total_busy_dashers AS SIGNED), 0)) AS avg_outstanding_orders_per_dasher
FROM 
    DoorDash
GROUP BY 
    time_category
ORDER BY 
    FIELD(time_category, 'Morning', 'Afternoon', 'Evening', 'Night');







-- Dasher insights and analysis:

-- 1. What is the average dasher workload across different markets?
-- This query calculates the average dasher workload (ratio of busy to onshift dashers) per market (city).
SELECT 
    city_name, 
    AVG(total_busy_dashers / total_onshift_dashers) AS Dasher_Load_Factor
FROM 
    DoorDash
GROUP BY 
    city_name;



-- 2. How do total outstanding orders affect delivery times?
-- This query examines how the number of outstanding orders correlates with average delivery times.
SELECT 
    total_outstanding_orders, 
    AVG(time_diff_in_minutes) AS avg_delivery_time
FROM 
    DoorDash
GROUP BY 
    total_outstanding_orders
ORDER BY 
    total_outstanding_orders DESC;




-- 3. Are there specific times of the day when dashers are over-utilized?
-- This query identifies the times when the dasher utilization exceeds 80%, indicating peak usage periods.
SELECT 
    HOUR(order_created_at) AS Order_Hour,
    AVG(total_busy_dashers / total_onshift_dashers) AS avg_dasher_utilization
FROM 
    DoorDash
GROUP BY 
    Order_Hour
HAVING 
    AVG(total_busy_dashers / total_onshift_dashers) > 0.8
ORDER BY 
    avg_dasher_utilization ASC;




-- 4. What is the ratio of busy to available dashers in different markets?
-- This query calculates the ratio of busy to available dashers for each market.
SELECT 
    city_name,
    SUM(total_busy_dashers) / SUM(total_onshift_dashers) AS busy_to_available_ratio
FROM 
    DoorDash
GROUP BY 
    city_name;




-- 5. How does dasher workload and Idle Dashers affect delivery performance?
-- This query analyzes the effect of idle dashers on average delivery time and dasher workload.
SELECT 
    (total_onshift_dashers - total_busy_dashers) AS Idle_Dashers,
    AVG(total_onshift_dashers - total_busy_dashers) AS avg_idle_dashers,
    AVG(time_diff_in_minutes) AS avg_delivery_time,
    AVG(total_busy_dashers / total_onshift_dashers) AS avg_dasher_workload
FROM 
    DoorDash
GROUP BY 
    Idle_Dashers
ORDER BY 
    Idle_Dashers ASC;




-- 6. What is the average order density per busy dasher?
-- This query calculates the average number of orders per busy dasher for each market.
SELECT 
    city_name,
    AVG(total_outstanding_orders / total_busy_dashers) AS avg_order_density_per_busy_dasher
FROM 
    DoorDash
WHERE
    total_busy_dashers > 0
GROUP BY 
    city_name
ORDER BY 
    city_name;


-- Additional Questions for analysis:

-- 7. How many outstanding orders exist per dasher during peak times?
-- This query calculates the number of outstanding orders per dasher during peak hours.
SELECT 
    city_name,
    HOUR(order_created_at) AS Order_Hour,
    SUM(total_outstanding_orders) / SUM(total_busy_dashers) AS outstanding_orders_per_dasher
FROM 
    DoorDash
WHERE 
    Peak_Hour = 'Peak'
GROUP BY 
    city_name, Order_Hour
ORDER BY 
    Order_Hour ASC;







-- Delivery insights and analysis:
-- 1. What is the average delivery time across all orders?
-- This query calculates the average delivery time across all orders.
SELECT 
    AVG(time_diff_in_minutes) AS avg_delivery_time
FROM 
    DoorDash;




-- 2. Which market has the highest average delivery times?
-- This query finds the market with the highest average delivery times.
SELECT 
    city_name,
    AVG(time_diff_in_minutes) AS avg_delivery_time
FROM 
    DoorDash
GROUP BY 
    city_name
ORDER BY 
    avg_delivery_time DESC
LIMIT 1;




-- 3. How does the actual delivery time compare to the estimated delivery time?
-- This query compares the actual delivery time with the estimated delivery time for each market.
SELECT 
    city_name,
    AVG(time_diff_in_minutes) AS avg_actual_delivery_time,
    AVG(total_estimated_delivery_duration) AS avg_estimated_time
FROM 
    DoorDash
GROUP BY 
    city_name;




-- 4. Which markets experience the highest delays during peak hours?
-- This query calculates the delay during peak hours by comparing actual delivery time with estimated delivery duration.
SELECT 
    city_name,
    AVG(time_diff_in_minutes - total_estimated_delivery_duration) AS avg_delay
FROM 
    DoorDash
WHERE 
    Peak_Hour = 'Peak'
GROUP BY 
    city_name
ORDER BY 
    avg_delay DESC;




-- 5. What are the peak hours for orders across different markets?
-- This query identifies the peak hours for orders in each market.
SELECT 
    city_name,
    HOUR(order_created_at) AS Order_Hour,
    COUNT(*) AS total_orders
FROM 
    DoorDash
WHERE 
    Peak_Hour = 'Peak'
GROUP BY 
    city_name, Order_Hour
ORDER BY 
    total_orders DESC;







-- Revenue insights and analysis:
-- 1. What is the revenue contribution of each market?
SELECT 
    city_name,
    SUM(Subtotal_in_Dollars) AS total_revenue,
    (SUM(Subtotal_in_Dollars) / (SELECT SUM(Subtotal_in_Dollars) FROM DoorDash)) * 100 AS revenue_percentage
FROM 
    DoorDash
GROUP BY 
    city_name;





-- 2. What are the most popular cuisines based on order volume?
SELECT 
    store_primary_category,
    COUNT(*) AS total_orders
FROM 
    DoorDash
GROUP BY 
    store_primary_category
ORDER BY 
    total_orders DESC;




-- 3. Which times of day or days of the week see the highest order volumes?
SELECT 
    HOUR(order_created_at) AS Order_Hour,
    Order_created_Day_Name,
    COUNT(*) AS total_orders
FROM 
    DoorDash
GROUP BY 
    HOUR(order_created_at), Order_created_Day_Name
ORDER BY 
    total_orders DESC;




-- 4. Which cuisines generate the most revenue?
SELECT 
    store_primary_category,
    SUM(Subtotal_in_Dollars) AS total_revenue
FROM 
    DoorDash
GROUP BY 
    store_primary_category
ORDER BY 
    total_revenue DESC;




-- 5. What is the average number of distinct items per order?
SELECT 
    AVG(total_items) AS avg_items_per_order
FROM 
    DoorDash;




-- 6. What is the average price per item for each cuisine category?
SELECT 
    store_primary_category,
    AVG(Subtotal_in_Dollars / total_items) AS avg_price_per_item
FROM 
    DoorDash
GROUP BY 
    store_primary_category
ORDER BY 
    avg_price_per_item DESC;




-- Additional Questions for analysis:

-- 7. Which markets generate the highest revenue?
SELECT 
    city_name,
    SUM(Subtotal_in_Dollars) AS total_revenue,
    (SUM(Subtotal_in_Dollars) / (SELECT SUM(Subtotal_in_Dollars) FROM DoorDash) * 100) AS revenue_percentage
FROM 
    DoorDash
GROUP BY 
    city_name
ORDER BY 
    total_revenue DESC
LIMIT 1;





-- 8. Are high-value orders delivered more quickly or face more delays?
SELECT 
    Item_Price_Category,
    AVG(time_diff_in_minutes) AS avg_delivery_time
FROM 
    DoorDash
GROUP BY 
    Item_Price_Category
ORDER BY 
    avg_delivery_time DESC;






-- Comparison and Advanced Analysis
-- 1. How do actual delivery times vary by dasher load factor?
SELECT 
    (total_outstanding_orders / total_busy_dashers) AS Dasher_Load_Factor,
    AVG(time_diff_in_minutes) AS avg_delivery_time
FROM 
    DoorDash
GROUP BY 
    Dasher_Load_Factor
ORDER BY 
    avg_delivery_time DESC;




-- 2. Which markets have the best and worst performance across key KPIs?
SELECT 
    city_name,
    AVG(time_diff_in_minutes) AS avg_delivery_time,
    AVG(total_outstanding_orders / total_busy_dashers) AS avg_dasher_load,
    AVG(Subtotal_in_Dollars) AS avg_revenue
FROM 
    DoorDash
GROUP BY 
    city_name
ORDER BY 
    avg_delivery_time ASC, avg_revenue DESC;




-- 3. How do predicted and actual metrics align?
SELECT 
    AVG(time_diff_in_minutes) AS avg_actual_time,
    AVG(total_estimated_delivery_duration) AS avg_estimated_time,
    (AVG(time_diff_in_minutes) - AVG(total_estimated_delivery_duration)) AS avg_difference
FROM 
    DoorDash;



-- 4. What factors most influence late deliveries?
SELECT 
    time_diff_in_minutes,
    total_estimated_delivery_duration,
    (time_diff_in_minutes - total_estimated_delivery_duration) AS delivery_delay,
    city_name,
    total_outstanding_orders,
    total_busy_dashers
FROM 
    DoorDash
WHERE 
    time_diff_in_minutes > total_estimated_delivery_duration + 5;








-- Analysis on Late Deliveries: Investigating how order size (number of items) and store type affect late deliveries.
SELECT 
    store_primary_category,
    AVG(time_diff_in_minutes - total_estimated_delivery_duration) AS avg_delay,
    AVG(total_items) AS avg_total_items,
    AVG(num_distinct_items) AS avg_distinct_items,
    AVG(total_outstanding_orders) AS avg_outstanding_orders
FROM 
    DoorDash
WHERE 
    time_diff_in_minutes > total_estimated_delivery_duration + 5
GROUP BY 
    store_primary_category
ORDER BY 
    avg_delay DESC;





-- Investigate Time-Related Factors: Checking how the hour of the day affects late deliveries.
SELECT 
    HOUR(order_created_at) AS Order_Hour,
    AVG(time_diff_in_minutes - total_estimated_delivery_duration) AS avg_delay
FROM 
    DoorDash
WHERE 
    time_diff_in_minutes > total_estimated_delivery_duration + 5
GROUP BY 
    Order_Hour
ORDER BY 
    avg_delay DESC;





-- Percentage of On-Time and Late Deliveries: Calculating the percentage of deliveries that are on time and late.
SELECT
    (SUM(CASE 
            WHEN time_diff_in_minutes <= total_estimated_delivery_duration + 5 THEN 1
            ELSE 0 
        END) / COUNT(*) * 100) AS on_time_delivery_percentage, 
    
    (SUM(CASE 
            WHEN time_diff_in_minutes > total_estimated_delivery_duration + 5 THEN 1
            ELSE 0 
        END) / COUNT(*) * 100) AS late_delivery_percentage

FROM
    DoorDash;







-- Top 10 Cuisines by Revenue: Identifying the top 10 cuisines based on total revenue generated.
WITH RankedCuisines AS (
    SELECT 
        store_primary_category AS cuisine,
        SUM(subtotal_in_dollars) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(subtotal_in_dollars) DESC) AS revenue_rank
    FROM 
        DoorDash
    GROUP BY 
        store_primary_category
)
SELECT 
    cuisine,
    total_revenue
FROM 
    RankedCuisines
WHERE 
    revenue_rank <= 10
ORDER BY 
    revenue_rank;




-- Top 10 Cuisines by Orders: Identifying the top 10 cuisines based on total number of orders.
WITH RankedCuisines AS (
    SELECT 
        store_primary_category AS cuisine,
        COUNT(*) AS total_orders,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS order_rank
    FROM 
        DoorDash
    GROUP BY 
        store_primary_category
)
SELECT 
    cuisine,
    total_orders
FROM 
    RankedCuisines
WHERE 
    order_rank <= 10
ORDER BY 
    order_rank;




-- Top 5 Markets by Revenue: Identifying the top 5 markets (cities) by total revenue.
WITH RankedMarkets AS (
    SELECT 
        city_name,
        SUM(subtotal_in_dollars) AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(subtotal_in_dollars) DESC) AS revenue_rank
    FROM 
        DoorDash
    GROUP BY 
        city_name
)
SELECT 
    city_name,
    total_revenue
FROM 
    RankedMarkets
WHERE 
    revenue_rank <= 5
ORDER BY 
    revenue_rank;




-- Top 10 Cuisines by Average Order Value: Identifying top 10 cuisines based on average order value.
WITH RankedCuisines AS (
    SELECT 
        store_primary_category AS cuisine,
        SUM(subtotal_in_dollars) AS total_order_value,
        ROW_NUMBER() OVER (ORDER BY SUM(subtotal_in_dollars) DESC) AS value_rank
    FROM 
        DoorDash
    GROUP BY 
        store_primary_category
)
SELECT 
    cuisine,
    total_order_value
FROM 
    RankedCuisines
WHERE 
    value_rank <= 10
ORDER BY 
    value_rank;




-- Top 10 Cuisines by Average Revenue Per Item: Identifying top 10 cuisines based on average revenue per item.
WITH RankedCuisines AS (
    SELECT 
        store_primary_category AS cuisine,
        AVG(revenue_per_item) AS avg_revenue_per_item,
        ROW_NUMBER() OVER (ORDER BY AVG(revenue_per_item) DESC) AS value_rank
    FROM 
        DoorDash
    GROUP BY 
        store_primary_category
)
SELECT 
    cuisine,
    avg_revenue_per_item
FROM 
    RankedCuisines
WHERE 
    value_rank <= 10 
ORDER BY 
    value_rank;



-- Top 10 Cuisines by Average Delivery Time: Identifying top 10 cuisines based on average delivery time.
WITH RankedCuisines AS (
    SELECT 
        store_primary_category AS cuisine,
        AVG(time_diff_in_minutes) AS avg_delivery_time,
        ROW_NUMBER() OVER (ORDER BY AVG(time_diff_in_minutes) DESC) AS delivery_time_rank
    FROM 
        DoorDash
    GROUP BY 
        store_primary_category
)
SELECT 
    cuisine,
    avg_delivery_time
FROM 
    RankedCuisines
WHERE 
    delivery_time_rank <= 10
ORDER BY 
    delivery_time_rank DESC;




-- Top 10 Hours of the Day by Fastest Delivery: Identifying the top 10 hours of the day with the fastest average delivery times.
WITH RankedHours AS (
    SELECT 
        EXTRACT(HOUR FROM order_created_at) AS order_hour,
        AVG(time_diff_in_minutes) AS avg_delivery_time,
        COUNT(*) AS order_count,
        SUM(total_outstanding_orders) / NULLIF(SUM(total_busy_dashers), 0) AS outstanding_orders_per_dasher,
        SUM(total_busy_dashers) / NULLIF(SUM(total_onshift_dashers), 0) AS dasher_load_factor,
        AVG(total_items) AS avg_order_size,
        AVG(time_diff_in_minutes / NULLIF(total_outstanding_orders, 0)) AS avg_time_per_outstanding_order,
        ROW_NUMBER() OVER (ORDER BY AVG(time_diff_in_minutes) ASC) AS delivery_time_rank
    FROM 
        DoorDash
    GROUP BY 
        order_hour
)
SELECT 
    order_hour,
    avg_delivery_time,
    order_count,
    outstanding_orders_per_dasher,
    dasher_load_factor,
    avg_order_size,
    avg_time_per_outstanding_order
FROM 
    RankedHours
WHERE 
    delivery_time_rank <= 10
ORDER BY 
    delivery_time_rank;




-- Top 5 Markets by Dasher Load Factor: Identifying the top 5 markets (cities) by dasher load factor.
WITH MarketDasherLoad AS (
    SELECT 
        city_name,
        SUM(total_busy_dashers) / NULLIF(SUM(total_onshift_dashers), 0) AS dasher_load_factor,
        AVG(time_diff_in_minutes) AS avg_delivery_time
    FROM 
        DoorDash
    GROUP BY 
        city_name
)
SELECT 
    city_name,
    dasher_load_factor,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time
FROM 
    MarketDasherLoad
ORDER BY 
    dasher_load_factor DESC
LIMIT 5;



SELECT *
FROM `DoorDash`
