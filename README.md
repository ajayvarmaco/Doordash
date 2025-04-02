##  **DoorDash Delivery and Revenue Optimization**  

## 📌 **Project Overview**  
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
- [SQL Queries Used](#-sql-queries-used)  
- [Tech Stack & Tools](#️-tech-stack--tools)  
- [About the Author](#-about-the-author)  

---

## 1️⃣ **Data Exploration & Initial Analysis**  
- **Retrieving all data** from the `DoorDash` table for initial inspection.  
- **Describing the table structure**, checking column data types, and understanding the dataset.  
- **Identifying unique categories** in `store_primary_category`.  
- **Handling missing values** by identifying NULL categories.  
- **Grouping stores by category** to analyze the distribution of stores.  

## 2️⃣ **Data Cleaning**  
- **Removing unwanted data**, such as eliminating stores categorized as `chocolate`.  
- **Checking for missing values** in critical columns (`market_id`, `store_id`, `order_protocol`, etc.).  

## 3️⃣ **Data Transformation**  
- **Creating new columns**, including `city_name`, `subtotal_in_dollars`, `order_created_day_name`, etc.  
- **Modifying column data types** (`actual_date`, `created_date`, `created_time`, `actual_time`).  
- **Updating columns with calculated values**, such as converting `subtotal` from cents to dollars.  

## 4️⃣ **Price & Duration Updates**  
- **Converting prices** from cents to dollars (`min_item_price`, `max_item_price`).  
- **Updating delivery durations**, converting seconds to minutes (`estimated_order_place_duration_in_minutes`).  
- **Calculating total estimated delivery duration** by summing various time components.  

## 5️⃣ **Categorization & Classification**  
- **Peak vs Off-Peak categorization** (`Peak_Hour` column).  
- **Item price segmentation** into 'Low', 'Medium', and 'High' price categories.  
- **Time of day classification** (`Morning`, `Afternoon`, `Evening`, `Night`).  

## 6️⃣ **Column Removal & Adjustments**  
- **Dropping unnecessary columns**, such as `Item_Volume_Category`.  
- **Handling division by zero** when calculating `revenue_per_item`.  

## 7️⃣ **Revenue & Performance Analysis**  
- **Daily & hourly revenue trends** to analyze peak revenue periods.  
- **Impact of delivery time on revenue** based on time-of-day analysis.  
- **Performance metrics analysis**, including dasher load factor, delivery duration, and outstanding orders.  

## 8️⃣ **Dasher Insights & Analysis**  
- **Dasher workload analysis** across different markets.  
- **Impact of outstanding orders on delivery time** to determine bottlenecks.  
- **Utilization patterns**, identifying when dasher usage exceeds 80%.  
- **Idle dasher impact** on overall delivery performance.  
- **Order density per dasher** and peak-time order handling efficiency.  

## 9️⃣ **Delivery Insights & Analysis**  
- **Market-level analysis** of average delivery times.  
- **Comparing actual vs estimated delivery times** across all orders.  
- **Late delivery patterns** and peak-hour delays by market.  
- **Peak hours for orders**, identifying the busiest periods.  

## 🔟 **Revenue Insights & Analysis**  
- **Market contribution to total revenue** (highest and lowest-performing regions).  
- **Cuisines generating the most revenue** and their popularity by order volume.  
- **High-value order delivery trends**, analyzing if premium orders are delivered faster.  
- **Item pricing analysis** by cuisine category.  

## 🔍 **Comparisons & Advanced Analysis**  
- **Dasher load vs actual delivery times**, identifying bottlenecks.  
- **Market performance comparisons** based on KPIs.  
- **Predicted vs actual delivery time analysis**, evaluating estimation accuracy.  
- **Factors influencing late deliveries**, including order size and dasher availability.  
- **Top markets and cuisines** ranked by revenue, order volume, and efficiency.  
- **Fastest delivery time windows**, identifying optimal delivery periods.  

---

## 📊 **Key Findings & Business Recommendations**  
**Key Findings:**  
✔️ **Peak-hour delays are significant** due to high dasher load factors.  
✔️ **Certain markets have consistently longer delivery times**, requiring operational adjustments.  
✔️ **High-value orders do not always get priority**, impacting customer satisfaction.  
✔️ **Cuisines with high order volume don’t always generate the most revenue**, requiring pricing adjustments.  

**Business Recommendations:**  
✅ **Optimize dasher allocation** during peak hours to reduce delivery delays.  
✅ **Improve delivery time estimations** to enhance accuracy.  
✅ **Prioritize high-value orders strategically** to enhance customer loyalty.  
✅ **Adjust pricing models** for underperforming high-volume cuisines to maximize profitability.  

---

## 📜 **SQL Queries Used**  
All analyses were performed using **SQL queries**, including:  
- Data extraction  
- Data cleaning & transformation  
- Revenue & dasher analysis  
- Delivery performance evaluation  
- Advanced insights & KPI comparisons  

Queries are available in the **SQL_Scripts.sql** file in this repository.  

---

## ⚙️ **Tech Stack & Tools**  
- **Database:** PostgreSQL / MySQL  
- **Querying & Analysis:** SQL  
- **Visualization:** Power BI / Tableau (Optional)  
- **Cloud Services:** AWS / Azure (For data storage and processing)  
- **Development Environment:** Jupyter Notebook / DBeaver / SQL Workbench  

---

## 📌 **About the Author**  
👋 **[Your Name]** – Data Analyst | SQL Expert | BI Developer  
🔹 Passionate about transforming raw data into meaningful insights.  
🔹 Experienced in **SQL, Power BI, Python**, and **data-driven decision-making**.  
🔹 Open to collaboration on **data analytics projects**.  

📧 **Contact:** your.email@example.com  
🔗 **LinkedIn:** [linkedin.com/in/yourprofile](https://linkedin.com/in/yourprofile)  

---

## 📜 **License**  
This project is **open-source** and free to use. Feel free to contribute, modify, or suggest improvements!  

---

This **README.md** is structured for professional use in an organization, covering all project phases, analyses, findings, and recommendations. Let me know if you'd like any modifications! 🚀
