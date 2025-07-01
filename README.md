# Customer Orders – SQL Analysis

This mini project demonstrates SQL skills by analyzing customer and order data using realistic business queries. It showcases how structured SQL queries can uncover customer behavior, order patterns, and revenue insights in a simplified e-commerce scenario.


## Datasets Used

- `Customers.csv` – Contains basic customer details:
  - `customer_id`, `customer_name`, `location`, `signup_date`

- `Orders.csv` – Contains all order-related data:
  - `order_id`, `customer_id`, `order_date`, `order_amount`, `status`, `payment_mode`

These mock datasets simulate typical customer-order relationships and allow SQL-based exploration of business performance metrics.


## SQL Queries Covered

The following types of queries were written and executed using SQL:

| Query Type | Description |
|------------|-------------|
| **Joins** | Combine customer and order data via `customer_id` |
| **Aggregation** | Total revenue, average spend per customer |
| **Filtering** | Orders above ₹5000, or with "Delivered" status |
| **Sorting** | Top 5 customers by revenue |
| **Date-based analysis** | Monthly order trends |
| **COUNT() & GROUP BY** | Number of orders per customer |
| **CASE WHEN** | Categorizing orders based on payment mode or value |


## Key Business Insights

- Identified top 5 customers by lifetime order value  
- Calculated total revenue generated and average ticket size  
- Tracked most common payment methods used  
- Filtered high-value orders and delivery statuses  
- Found active vs inactive customers (no orders)

## Tools Used

- SQL (Amazon internal certification concepts)
- MySQL Workbench 
- Excel/CSV for data loading
- GitHub for project versioning

## Learning Outcomes

- Practiced real-world SQL query structuring
- Learned how to JOIN and filter relational datasets
- Gained hands-on with aggregation, grouping, sorting, and CASE logic
- Structured a mini-project suitable for analyst and ops-based roles

## Project Structure

```plaintext
├── Customers.csv                  # Customer information dataset
├── Orders.csv                     # Order transaction dataset
├── SQL_Queries.sql                # All queries written with comments
├── README.md                      # This documentation file
