# Ecommerce Sales Analysis (Excel + SQL)

This project analyzes an ecommerce transactions dataset (~540k rows) using Excel and MySQL.

## Files

- `excel/ecommerce_excel_dashboard.xlsx`  
  Interactive Excel dashboard with:
  - Total Sales, Total Orders, AOV, Top Product
  - Sales by Country
  - Monthly Sales Trend
  - Top 10 Products

- `data/ecommclean.csv`  
  Cleaned dataset used for analysis (cancelled invoices removed, added Total_Sales, Month, Year, Day_of_Week).

- `sql/ecommerce_queries.sql`  
  SQL queries for:
  - Total sales, orders, AOV
  - Sales by country, month, weekday
  - Top customers and products
  - Customer segmentation

## Tech Stack

- Excel (Pivot Tables, Dashboard, KPIs)
- MySQL (SQL queries and analysis)

## How to Use

1. Import `data/ecommclean.csv` into MySQL as `retail_data` table.
2. Run queries from `sql/ecommerce_queries.sql`.
3. Explore the dashboard in `excel/ecommerce_excel_dashboard.xlsx`.
