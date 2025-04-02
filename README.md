##  **DoorDash Delivery and Revenue Optimization**  

##  **Project Overview**  
This project focuses on analyzing **DoorDash delivery data** to extract meaningful insights regarding **dashers (delivery personnel), order deliveries, and revenue trends** across various markets. I performed **data exploration, cleaning, transformation, and in-depth analysis** to uncover patterns in **delivery times, order volumes, market performance, and customer behavior.**  

---

##  **Table of Contents**  

- [Data Exploration & Initial Analysis](#1️⃣-data-exploration--initial-analysis)  
- [Data Cleaning](#2️⃣-data-cleaning)  
- [Data Transformation](#3️⃣-data-transformation)  
- [Price & Duration Updates](#4️⃣-price--duration-updates)  
- [Categorization & Classification](#5️⃣-categorization--classification)  
- [Column Removal & Adjustments](#6️⃣-column-removal--adjustments)  
- [Revenue & Performance Analysis](#7️⃣-revenue--performance-analysis)  
- [Dasher Insights & Analysis](#8️⃣-dasher-insights--analysis)  
- [Delivery Insights & Analysis](#9️⃣-delivery-insights--analysis)  
- [Revenue Insights & Analysis](#🔟-revenue-insights--analysis)  
- [Comparisons & Advanced Analysis](#-comparisons--advanced-analysis)  
- [Key Findings & Business Recommendations](#-key-findings--business-recommendations)  
  - [Dasher Workload & Delivery Performance](#🚴‍♂️-dasher-workload--delivery-performance)  
  - [Delivery Efficiency & Timeliness](#⏳-delivery-efficiency--timeliness)  
  - [Cuisine Popularity & Product Offering](#🍽️-cuisine-popularity--product-offering)  
  - [High-Value Orders & Delivery Efficiency](#💰-high-value-orders--delivery-efficiency)  
  - [Time Optimization & Order Volume Management](#⏰-time-optimization--order-volume-management)  
  - [Conclusion](#📊-conclusion)  
- [SQL Queries Used](#-sql-queries-used)  
- [Tech Stack & Tools](#️-tech-stack--tools)  
- [About the Author](#-about-the-author)  

---

##  **Data Exploration & Initial Analysis**  
- **Retrieving all data** from the `DoorDash` table for initial inspection.  
- **Describing the table structure**, checking column data types, and understanding the dataset.  
- **Identifying unique categories** in `store_primary_category`.  
- **Handling missing values** by identifying NULL categories.  
- **Grouping stores by category** to analyze the distribution of stores.  

##  **Data Cleaning**  
- **Removing unwanted data**, such as eliminating stores categorized as `chocolate`.  
- **Checking for missing values** in critical columns (`market_id`, `store_id`, `order_protocol`, etc.).  

##  **Data Transformation**  
- **Creating new columns**, including `city_name`, `subtotal_in_dollars`, `order_created_day_name`, etc.  
- **Modifying column data types** (`actual_date`, `created_date`, `created_time`, `actual_time`).  
- **Updating columns with calculated values**, such as converting `subtotal` from cents to dollars.  

##  **Price & Duration Updates**  
- **Converting prices** from cents to dollars (`min_item_price`, `max_item_price`).  
- **Updating delivery durations**, converting seconds to minutes (`estimated_order_place_duration_in_minutes`).  
- **Calculating total estimated delivery duration** by summing various time components.  

##  **Categorization & Classification**  
- **Peak vs Off-Peak categorization** (`Peak_Hour` column).  
- **Item price segmentation** into 'Low', 'Medium', and 'High' price categories.  
- **Time of day classification** (`Morning`, `Afternoon`, `Evening`, `Night`).  

##  **Column Removal & Adjustments**  
- **Dropping unnecessary columns**, such as `Item_Volume_Category`.  
- **Handling division by zero** when calculating `revenue_per_item`.  

##  **Revenue & Performance Analysis**  
- **Daily & hourly revenue trends** to analyze peak revenue periods.  
- **Impact of delivery time on revenue** based on time-of-day analysis.  
- **Performance metrics analysis**, including dasher load factor, delivery duration, and outstanding orders.
- **Market contribution to total revenue** (highest and lowest-performing regions).  
- **Cuisines generating the most revenue** and their popularity by order volume.
- **Item pricing analysis** by cuisine category.  
 

##  **Dasher Insights & Analysis**  
- **Dasher workload analysis** across different markets.  
- **Impact of outstanding orders on delivery time** to determine bottlenecks.  
- **Utilization patterns**, identifying when dasher usage exceeds 80%.  
- **Idle dasher impact** on overall delivery performance.  
- **Order density per dasher** and peak-time order handling efficiency.  

##  **Delivery Insights & Analysis**  
- **Market-level analysis** of average delivery times.  
- **Comparing actual vs estimated delivery times** across all orders.  
- **Late delivery patterns** and peak-hour delays by market.  
- **Peak hours for orders**, identifying the busiest periods.
- **High-value order delivery trends**, analyzing if premium orders are delivered faster.

##  **Comparisons & Advanced Analysis**  
- **Dasher load vs actual delivery times**, identifying bottlenecks.  
- **Market performance comparisons** based on KPIs.  
- **Predicted vs actual delivery time analysis**, evaluating estimation accuracy.  
- **Factors influencing late deliveries**, including order size and dasher availability.  
- **Top markets and cuisines** ranked by revenue, order volume, and efficiency.  
- **Fastest delivery time windows**, identifying optimal delivery periods.  

---

##  Key Findings & Business Recommendations  

###  Dasher Workload & Delivery Performance  
- **Optimize Load Distribution**: Increase dasher availability during peak hours (18:00, 20:00, 22:00) to reduce delays and improve order fulfillment.  
- **Peak Hour Incentives**: Introduce bonuses for dashers during high-demand periods to ensure adequate coverage.  

###  Delivery Efficiency & Timeliness  
- **Enhance Time Estimates**: Improve delivery time predictions by integrating real-time traffic, weather, and location data.  
- **Predictive Analytics**: Leverage AI to forecast demand spikes and dynamically allocate resources to reduce delays.  
- **Buffer Times**: Implement controlled buffer times during peak hours to better manage delays and set realistic customer expectations.  

### 🍽️ Cuisine Popularity & Product Offering  
- **Expand High-Performing Cuisines**: Introduce exclusive or premium versions of top-selling cuisines (e.g., Pizza, Mexican, American) to increase customer spend.  
- **Localize Menus**: Tailor food offerings based on regional preferences (e.g., Japanese, Indian, or local specialties) to enhance customer satisfaction.  
- **Seasonal Menus**: Launch limited-time or holiday-themed menu items to boost engagement and sales during specific seasons.  

###  High-Value Orders & Delivery Efficiency  
- **Prioritize High-Value Orders**: Ensure that orders above $50 receive faster processing and delivery during peak hours.  
- **Accurate Time Estimates**: Provide better estimated delivery times for premium orders, ensuring efficient resource allocation.  
- **Premium Delivery Option**: Introduce an optional **"Priority Delivery"** service for customers willing to pay extra for guaranteed faster delivery.  

###  Time Optimization & Order Volume Management  
- **Optimize Peak Hour Resources**: Utilize predictive models to dynamically adjust dasher availability and restaurant staff levels.  
- **Promote Off-Peak Ordering**: Offer discounts or incentives for orders placed during off-peak hours to balance demand.  
- **Flexible Delivery Windows**: Provide customers with multiple delivery window options to improve satisfaction and reduce peak-hour congestion.  

---

##  Conclusion  
This project aimed to analyze delivery performance, dasher workload, order volumes, and revenue trends across different markets. The insights generated provide actionable recommendations for improving delivery efficiency, optimizing dasher performance, and increasing revenue while maintaining customer satisfaction.  

###  Recommendations Summary:  
✔️ **Better dasher load management** during peak hours to reduce delivery delays.  
✔️ **Improved time prediction models** using AI-driven analytics for better resource planning.  
✔️ **Focusing on high-revenue markets and top cuisines** to maximize earnings.  
✔️ **Incentivizing dashers** during peak times to enhance service reliability.  

###  Considerations  
- Implement **real-time monitoring** to dynamically adjust strategies based on evolving demand.  
- Encourage **dashers to work peak hours** through well-structured incentive programs.  
- Continuously **analyze customer feedback** and market trends to refine strategies for long-term growth.  

---

##  **SQL Queries Used**  
All analyses were performed using **SQL queries**, including:  
- Data extraction  
- Data cleaning & transformation  
- Revenue & dasher analysis  
- Delivery performance evaluation  
- Advanced insights & KPI comparisons  

Queries are available in the **SQL_Scripts.sql** file in this repository.  

---

## ⚙ **Tech Stack & Tools**  
- **Database:** MySQL  
- **Querying & Analysis:** SQL  
- **Visualization:** Power BI 
- **Cloud Services:** Google Cloud (For data storage and processing)  
- **Development Environment:** MySQL Workbench  

---

📧 **Contact:** hello@ajayvarma.co  
🔗 **LinkedIn:** https://linkedin.com/in/ajayvarmaco

---
