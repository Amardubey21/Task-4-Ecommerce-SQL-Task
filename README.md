# Task-4-Ecommerce-SQL-Task
# Ecommerce SQL Task

## 📌 Objective

This project is part of my Data Analyst Internship tasks. The goal is to design an **E-commerce Database** in MySQL, insert sample data, and perform analysis using SQL queries.

## 🛠 Tools Used

* MySQL 8.0
* Workbench / CLI

## 📂 Database Schema

The database `EcommerceDB` contains the following tables:

* `Customers`
* `Products`
* `Orders`
* `OrderDetails`
* View: `HighValueCustomers`

## 📜 Queries Implemented

* Create database and tables
* Insert sample data into all tables
* Join queries for customer and order data
* Aggregate functions to calculate total spending
* A **View** to identify high-value customers (spent > 500)

## 📊 Example Query

```sql
SELECT * FROM HighValueCustomers;
```

## 📷 Screenshots

Screenshots of query outputs are available in the `screenshots/` folder.

## 🚀 How to Run

1. Clone this repo
2. Run `EcommerceDB.sql` in MySQL
3. Execute queries to explore the database
