# 🗄️ SQL Practice

<p align="center">
  <strong>A structured SQL learning repository covering fundamentals, database design, advanced queries, and interview preparation.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge&logo=mysql&logoColor=white" alt="SQL">
  <img src="https://img.shields.io/badge/Level-Beginner%20to%20Advanced-success?style=for-the-badge" alt="Level">
  <img src="https://img.shields.io/badge/Practice-200%2B%20Queries-orange?style=for-the-badge" alt="Queries">
  <img src="https://img.shields.io/badge/Focus-Backend%20Development-purple?style=for-the-badge" alt="Backend">
</p>

---

## 📌 About

This repository contains my structured SQL practice journey, starting from basic queries and progressing toward advanced SQL, relational database design, optimization concepts, and real-world database scenarios.

The goal is to build a strong SQL foundation for **Java Backend and Full Stack Development**.

### 🎯 Main Objectives

- Master SQL fundamentals
- Understand relational database concepts
- Practice CRUD operations
- Master SQL joins and subqueries
- Learn aggregation and grouping
- Understand database relationships
- Practice indexes and transactions
- Learn advanced SQL features
- Solve common SQL interview problems
- Design real-world relational databases

---

## 🛠️ Database

Primary database used:

- **MySQL 8+**

Some concepts may vary slightly between database engines such as PostgreSQL, SQL Server, and SQLite.

---

# 📚 Curriculum

The repository is divided into progressive modules:

```text
01-Basics
      ↓
02-Constraints
      ↓
03-CRUD
      ↓
04-Functions
      ↓
05-Grouping
      ↓
06-Joins
      ↓
07-Subqueries
      ↓
08-Set-Operations
      ↓
09-Views
      ↓
10-Indexes
      ↓
11-Transactions
      ↓
12-Database-Design
      ↓
13-Advanced-SQL
      ↓
14-Interview-Queries
      ↓
15-Real-World-Database

---

# 📂 Repository Structure

```text
sql-practice/
│
├── 01-Basics/
├── 02-Constraints/
├── 03-CRUD/
├── 04-Functions/
├── 05-Grouping/
├── 06-Joins/
├── 07-Subqueries/
├── 08-Set-Operations/
├── 09-Views/
├── 10-Indexes/
├── 11-Transactions/
├── 12-Database-Design/
├── 13-Advanced-SQL/
├── 14-Interview-Queries/
├── 15-Real-World-Database/
│
└── README.md
```

---

# 📖 Modules

## 01. SQL Basics

**Topics:**

* CREATE DATABASE
* CREATE TABLE
* INSERT
* SELECT
* DISTINCT
* Aliases
* WHERE
* Comparison Operators
* Logical Operators
* BETWEEN
* IN
* LIKE
* ORDER BY
* LIMIT

**Practice Files:**

```text
create-database.sql
create-table.sql
insert-data.sql
select.sql
distinct.sql
aliases.sql
where.sql
operators.sql
order-by.sql
limit.sql
```

---

## 02. Constraints

Learn how to maintain data integrity using:

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* DEFAULT
* CHECK

Example:

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'ACTIVE'
);
```

---

## 03. CRUD Operations

Core database operations:

* CREATE
* READ
* UPDATE
* DELETE

```text
INSERT → Add data
SELECT → Read data
UPDATE → Modify data
DELETE → Remove data
```

---

## 04. SQL Functions

### Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

### String Functions

* UPPER()
* LOWER()
* TRIM()
* LENGTH()
* SUBSTRING()
* REPLACE()
* CONCAT()

### Numeric Functions

* ROUND()
* CEIL()
* FLOOR()
* ABS()
* MOD()

### Date Functions

* Current Date
* Current Timestamp
* Date Extraction
* Date Difference
* Date Formatting

### NULL Handling

* COALESCE()
* NULLIF()

---

## 05. GROUP BY & HAVING

Topics:

* GROUP BY
* HAVING
* Aggregate Functions with GROUP BY
* Multiple-column grouping

Example:

```sql
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;
```

### Interview Concept

Understand the difference between:

```text
WHERE
vs
HAVING
```

---

# 06. SQL Joins ⭐

One of the most important SQL topics for backend development.

### Topics

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* SELF JOIN
* CROSS JOIN

Example:

```sql
SELECT
    e.name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.id;
```

### Important Questions

* INNER JOIN vs LEFT JOIN
* LEFT JOIN vs RIGHT JOIN
* When should you use a SELF JOIN?
* What is a CROSS JOIN?
* How can you find unmatched records?

---

# 07. Subqueries

Topics:

* Single-row subqueries
* Multi-row subqueries
* Correlated subqueries
* IN
* EXISTS
* NOT EXISTS
* ANY
* ALL

Example:

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

---

# 08. Set Operations

Practice:

* UNION
* UNION ALL
* INTERSECT
* EXCEPT

Understand the difference between:

```text
UNION
vs
UNION ALL
```

---

# 09. Views

Topics:

* CREATE VIEW
* Querying Views
* Updating Views
* DROP VIEW

Example:

```sql
CREATE VIEW employee_details AS
SELECT
    e.name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.id;
```

---

# 10. Indexes

Learn the basics of database indexing and query performance.

### Topics

* What is an Index?
* CREATE INDEX
* UNIQUE INDEX
* Composite Index
* Index usage
* Index trade-offs

Example:

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

### Important Concept

Indexes can improve read performance, but they also have storage and write-maintenance costs.

---

# 11. Transactions

Topics:

* Transactions
* COMMIT
* ROLLBACK
* SAVEPOINT
* ACID fundamentals

Example:

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE id = 2;

COMMIT;
```

---

# 12. Database Design

Learn how relational databases are structured.

### Topics

* Normalization
* 1NF
* 2NF
* 3NF
* One-to-One
* One-to-Many
* Many-to-Many
* Foreign Keys
* Junction Tables

Example:

```text
User
 │
 └──< Orders
        │
        └──< Order Items
                │
                └── Product
```

---

# 13. Advanced SQL

Topics:

### CASE

```sql
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'HIGH'
        WHEN salary >= 50000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS salary_category
FROM employees;
```

### CTE

```sql
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 70000
)
SELECT *
FROM high_salary;
```

### Window Functions

* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LEAD()
* LAG()

Example:

```sql
SELECT
    name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

---

# 14. SQL Interview Queries ⭐

A dedicated collection of common SQL interview problems.

### Salary Problems

* Second Highest Salary
* Third Highest Salary
* Nth Highest Salary
* Highest Salary by Department
* Top 3 Salaries by Department
* Employees Earning Above Average Salary

### Duplicate Problems

* Find Duplicate Records
* Count Duplicate Records
* Remove Duplicate Records

### Employee Problems

* Employees Without Department
* Departments Without Employees
* Employees With Same Salary
* Employees Joined in a Particular Year

### Customer & Order Problems

* Customers Without Orders
* Customers With More Than N Orders
* Highest Order Amount
* Total Sales Per Customer
* Monthly Sales

### Advanced Problems

* Consecutive Records
* Top N Records Per Group
* Running Total
* Ranking Records
* Compare Current Row With Previous Row

---

# 15. Real-World Database Projects ⭐⭐⭐⭐⭐

This section contains complete relational database scenarios.

## 🏢 Employee Management System

### Tables

```text
departments
employees
projects
employee_projects
payroll_history
```

### Practice

* Employee salary analysis
* Department-wise salary
* Employee hierarchy
* Project allocation
* Payroll analysis
* Top earners

---

## 🛒 E-Commerce Database

### Tables

```text
users
products
categories
cart
cart_items
orders
order_items
payments
inventory
```

### Practice

* Products by category
* Customer orders
* Total revenue
* Best-selling products
* Monthly sales
* Inventory analysis
* Customers without orders
* Order history

---

## 📝 Blog Database

### Tables

```text
users
posts
categories
comments
tags
post_tags
likes
```

### Practice

* Posts by user
* Posts by category
* Most commented posts
* Most liked posts
* Tag-based search
* User engagement
* Comment hierarchy

This database structure is also useful for understanding the SQL side of a future **Spring Boot Blog Application**.

---

# 🧠 Interview Preparation

Important concepts to revise:

### SQL Fundamentals

* Primary Key vs Unique Key
* DELETE vs TRUNCATE vs DROP
* WHERE vs HAVING
* GROUP BY
* NULL handling

### Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* SELF JOIN

### Database Design

* Normalization
* 1NF / 2NF / 3NF
* Relationships
* Foreign Keys
* Junction Tables

### Performance

* Indexes
* Composite Indexes
* Query optimization basics

### Transactions

* ACID
* COMMIT
* ROLLBACK
* SAVEPOINT

### Advanced SQL

* CTE
* Window Functions
* RANK
* DENSE_RANK
* ROW_NUMBER
* LEAD
* LAG

---

# 🚀 Quick Start

## 1. Install MySQL

Install **MySQL 8+** on your system.

## 2. Clone Repository

```bash
git clone https://github.com/SujayBonde/sql-practice.git
```

## 3. Open MySQL

```bash
mysql -u root -p
```

## 4. Select a Practice File

For example:

```text
06-Joins/inner-join.sql
```

## 5. Execute

```bash
mysql -u root -p < 06-Joins/inner-join.sql
```

Or open the SQL file in:

* MySQL Workbench
* IntelliJ IDEA
* VS Code
* DBeaver

---

# 📊 Learning Progress

* [ ] SQL Basics
* [ ] Constraints
* [ ] CRUD
* [ ] Functions
* [ ] GROUP BY & HAVING
* [ ] Joins
* [ ] Subqueries
* [ ] Set Operations
* [ ] Views
* [ ] Indexes
* [ ] Transactions
* [ ] Database Design
* [ ] Advanced SQL
* [ ] Interview Queries
* [ ] Real-World Databases

---

# 📈 Practice Philosophy

I follow a simple learning process:

```text
Learn
  ↓
Write Query
  ↓
Execute
  ↓
Understand Result
  ↓
Modify Query
  ↓
Solve Similar Problem
  ↓
Apply to Real-World Database
```

The focus is on **understanding why a query works**, not just memorizing syntax.

---

# 👨‍💻 Author

**Sujay Bonde**

Java Full Stack Developer
Java • Spring Boot • React • MySQL

<p align="center">
  <a href="https://sujaybonde.vercel.app">
    <img src="https://img.shields.io/badge/Portfolio-Visit%20Portfolio-blue?style=for-the-badge" alt="Portfolio">
  </a>
  <a href="https://www.linkedin.com/in/sujay-bonde">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin" alt="LinkedIn">
  </a>
</p>

---

## ⭐ If this repository helps you

Feel free to explore, practice, and improve the queries.

**Keep learning. Keep building. Keep solving.**

---
