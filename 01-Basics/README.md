# 01 - SQL Basics

Welcome to the foundational SQL module! This directory covers everything required to create databases, structure tables, insert records, and query datasets with filters, sorting, and pagination.

## Learning Objectives
- Master database and table DDL (`CREATE DATABASE`, `CREATE TABLE`).
- Insert data efficiently with single and bulk `INSERT` statements.
- Retrieve data using `SELECT`, `SELECT DISTINCT`, and column aliases.
- Filter records accurately with `WHERE` and SQL operators (`BETWEEN`, `IN`, `LIKE`).
- Order datasets with `ORDER BY` and implement pagination via `LIMIT` and `OFFSET`.

---

## File Overview

| File | Concept Covered | Key Syntax |
|---|---|---|
| [`create-database.sql`](./create-database.sql) | Database creation and selection | `CREATE DATABASE name;` |
| [`create-table.sql`](./create-table.sql) | Defining schemas, columns, and types | `CREATE TABLE t (id INT, ...);` |
| [`insert-data.sql`](./insert-data.sql) | Inserting single and bulk rows | `INSERT INTO t VALUES (...);` |
| [`select.sql`](./select.sql) | Selecting columns and calculations | `SELECT col1, col2 * 1.1 FROM t;` |
| [`distinct.sql`](./distinct.sql) | Eliminating duplicate results | `SELECT DISTINCT col FROM t;` |
| [`aliases.sql`](./aliases.sql) | Renaming output columns & tables | `SELECT col AS alias FROM t AS a;` |
| [`where.sql`](./where.sql) | Row filtering conditions | `WHERE age >= 18 AND status = 'A';` |
| [`operators.sql`](./operators.sql) | `BETWEEN`, `IN`, `LIKE`, math ops | `WHERE price BETWEEN 10 AND 50;` |
| [`order-by.sql`](./order-by.sql) | Multi-column ascending & descending sorting | `ORDER BY col1 ASC, col2 DESC;` |
| [`limit.sql`](./limit.sql) | Restricting row counts & pagination | `LIMIT 10 OFFSET 20;` |

---

## Quick Reference Cheat Sheet

```sql
-- Standard Query Anatomy
SELECT DISTINCT 
    e.first_name,
    e.salary AS base_pay,
    e.salary * 0.15 AS annual_bonus
FROM employees AS e
WHERE e.department = 'Engineering' 
  AND e.salary BETWEEN 70000 AND 150000
ORDER BY e.salary DESC
LIMIT 5 OFFSET 0;
```
