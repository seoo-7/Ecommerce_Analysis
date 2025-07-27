# 🛒 E-commerce Sales Analysis Dashboard

This project presents a complete end-to-end solution for analyzing e‑commerce sales using SQL for data preparation and an interactive dashboard for visual exploration. It demonstrates advanced analytics through **Level of Detail (LOD)** logic, delivering dynamic insights across categories, regions, and timeframes.

---

## 📊 Project Highlights

- **Data Source**: [Public `sales_orders` dataset representing online supermarket transactions.](https://www.kaggle.com/datasets/anandku79/kpidashboard)
- **Tech Stack**:  
  - SQL (analytical queries, CTEs, LOD logic)  
  - Power BI (for dashboard visualization)

---

## 🔍 Key Features

### 1. Dashboard Insights

- 📌 **Summary KPIs**  
  - Total Sales  
  - Net Profit  
  - Units Sold  
  - Order Count  
  - Includes YOY, QOQ, MOM growth comparisons

- 🌍 **Geographic & Category Breakdown**  
  - Net Profit by Continent & Category  
  - Gross Sales by Country  
  - Top Categories over time  

- 👤 **Customer & Product Segments**  
  - Loyalty segmentation  
  - Top/Bottom product performance  
  - Discount impact on profit  

- 📈 **Trend Analysis**  
  - Monthly and daily profit trends  
  - Order behavior by quantity sold  
  - Shipping cost vs. discount impact

---

## 📑 SQL Analysis Structure

### ✅ Modular CTE Workflow

- Time-based comparisons using `dim_date` table (YTD, QTD, MTD)
- Fixed LOD aggregations per category or region
- Segment definitions using `CASE` logic
- Trend patterns via `GROUP BY` and window functions

### 🔧 Techniques Used

- `RANK()` and `ROW_NUMBER()` for top-N product isolation  
- `LAG()` and `DATEADD()` for period-over-period comparisons  
- Parameterized filters for flexibility (e.g., dynamic Top N or date ranges)


