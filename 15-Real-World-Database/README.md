# 15 - Real-World Production Databases

This module contains complete, production-grade schemas, rich seed datasets, and executive analytical queries for three enterprise domains.

---

## 1. Employee & Payroll Management System (`employee-management/`)
A corporate ERP modeling personnel, departments, reporting hierarchies, and project allocations.
- [`schema.sql`](./employee-management/schema.sql): Multi-table relational schema with self-referencing foreign keys (`manager_id`), cascade policies, and check constraints.
- [`data.sql`](./employee-management/data.sql): Realistic corporate data spanning Engineering, Marketing, Finance, and HR.
- [`queries.sql`](./employee-management/queries.sql): Payroll summaries, workload allocations, and window function rankings.

## 2. E-Commerce Platform (`ecommerce/`)
An online retail platform handling catalogs, stock tracking, shopping carts, transactions, and customer reviews.
- [`schema.sql`](./ecommerce/schema.sql): Orders, order items, product inventories, payment transactions, and customer review tracking.
- [`data.sql`](./ecommerce/data.sql): Multi-category product catalog with pending, shipped, delivered, and refunded orders.
- [`queries.sql`](./ecommerce/queries.sql): Gross Merchandise Value (GMV), Customer Lifetime Value (CLV), restock alerts, and rating metrics.

## 3. Content Publishing & Blog Platform (`blog/`)
A modern publishing engine featuring tag taxonomy, author permissions, engagement tracking, and nested comment threads.
- [`schema.sql`](./blog/schema.sql): Users, categories, tag many-to-many relationships, post likes, and recursive comment trees.
- [`data.sql`](./blog/data.sql): Technical articles, multiple tags, and threaded discussion replies.
- [`queries.sql`](./blog/queries.sql): Engagement KPIs, tag aggregation, author performance metrics, and **Recursive CTE** comment tree traversal.
