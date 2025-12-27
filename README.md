# Task 6: Sales Trend Analysis Using SQL

## Objective
The objective of this task is to analyze monthly sales trends by calculating total revenue and order volume using SQL aggregation functions.

## Tool Used
- Oracle SQL*Plus

## Dataset
Table Name: `orders`

### Columns:
- `order_id` – Unique ID for each order
- `order_date` – Date when the order was placed
- `amount` – Order amount (revenue)
- `product_id` – Product identifier

## Tasks Performed
- Created the `orders` table
- Inserted sample sales data
- Analyzed monthly sales trends
- Calculated total revenue using `SUM()`
- Calculated order volume using `COUNT(DISTINCT order_id)`
- Grouped data by year and month
- Identified top 3 months by sales revenue

## SQL Concepts Used
- `CREATE TABLE`
- `INSERT`
- Aggregate functions (`SUM`, `COUNT`)
- `GROUP BY`
- `ORDER BY`
- Date functions (`EXTRACT`)
- Subqueries
- `ROWNUM` (Oracle)

## Output
- Monthly revenue and order volume
- Top 3 performing months based on total sales

## Outcome
This task helped in understanding how to use SQL aggregation and date functions to analyze time-based sales trends effectively.

## Author
Ayesha Khan
