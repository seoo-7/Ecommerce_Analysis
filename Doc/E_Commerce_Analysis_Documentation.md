# E-commerce Sales Analysis Dashboard

## Project Overview  
This project analyzes an e-supermarket's sales data using **Level of Detail (LOD) calculations** to derive actionable insights. The dashboard and SQL scripts focus on key performance indicators (KPIs), profitability, customer behavior, and product performance across geographic and temporal dimensions.

---

## Dashboard Summary  
The dashboard visualizes 12 core KPIs and business metrics:

1. **High-Level Summary Cards**  
   - **Total Sales**  
   - **Net Profit**  
   - **Units Sold**  
   - **Order Count**  
   - Each card displays current figures alongside YOY, QOQ, and MOM percentage changes.
  
### 2. Geographic Profitability  
- **Net Profit Across Categories by Continent**: Compares profitability of product categories per continent.  
- **Gross Sales by Country**: Highlights top revenue-generating countries.  

### 3. Customer Analysis  
- **Customer Segment**: Breaks down sales by loyalty status and customer type.  

### 4. Product Performance  
- **Top & Bottom Products**: Identifies best/worst-performing products.  
- **Units vs. Discounts per Category**: Visualizes discount impact on units sold, scaled by profit.  
- **Top Categories by Sales**: Ranks categories by revenue.  
- **Net Sales Category by Years**: Tracks category sales trends annually.  

### 5. Operational Metrics  
- **Impact of Shipping Cost and Discount on Orders**: Analyzes cost/discount trade-offs.  
- **Monthly Profit and Margin Metrics**: Monitors monthly profitability.  
- **Total Profit and Order Count Based on Quantity Sold**: Correlates order volume with profit.  
- **Daily Trends in Order Volume**: Shows intra-day order patterns.  

---

## SQL Analysis Summary  
The SQL scripts perform deep dives into sales, profitability, and customer behavior using window functions, CTEs, and aggregations.

### Key Analyses  

#### 1. Top Performers  
- **Top Sub-Category per Country**: Uses `RANK()` to identify leading sub-categories in each country.  
- **Top Cities per Country**: Ranks cities by sales density within countries.  
- **Top Products per Sub-Category**: Finds best-selling products in each sub-category.  

#### 2. Temporal Trends  
- **Yearly Sales Performance**:  
  - YoY growth (%) and absolute sales differences via `LAG()`.  
  - Cumulative sales trend across years.  

#### 3. Profitability Deep Dives  
- **Countries with Negative Profit**:  
  - Quantifies loss-making orders, average loss per order, and % contribution to total losses.  
- **Profit Segmentation**: Flags orders as `Negative`, `No Profit`, or `Profit`.  

#### 4. Customer Insights  
- **Customer Order Frequency & Value**: Lists customers by total orders and lifetime profitability.  

#### 5. Product Metrics  
- **Sub-Category Performance**: Ranks sub-categories by:  
  - Order volume (`overall_orders`).  
  - Revenue (`overall_sales`).  
  - Profitability (`overall_profit`).  
- **Product Order Volume**: Identifies high-demand products.  

---

## Technical Highlights  

### 1. Advanced SQL Techniques  
- **Window Functions**: `RANK()`, `DENSE_RANK()`, `LAG()` for comparisons and rankings.  
- **CTEs**: Modularizes complex queries (e.g., `subcategory_sales_per_country`).  
- **Aggregations**: `SUM()`, `COUNT()`, and `ROUND()` for KPI calculations.  

---

## Business Impact  
- Identifies growth opportunities (top products/countries).  
- Pinpoints loss drivers (negative profitability by country).  
- Supports strategic decisions on discounts, shipping, and inventory.  
- Enables customer segmentation for targeted marketing.  

---

## Conclusion  
This project delivers a comprehensive e-commerce analytics solution combining Power Bi dashboard visualizations with robust SQL analysis. It enables data-driven decisions across sales, marketing, and operations by leveraging LOD calculations and advanced SQL.
