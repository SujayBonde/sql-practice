# 12 - Database Design & Normalization

Good database design ensures performance, data integrity, and scalability while eliminating anomalies.

## Learning Objectives
- Step through normalization stages: **1NF**, **2NF**, and **3NF**.
- Implement **1:1 relationships** with unique foreign key constraints.
- Structure standard **1:N relationships** with cascade configurations.
- Design clean **M:N relationships** using junction (bridge) tables with composite primary keys.

---

## File Overview

| File | Design Concept | Real-World Application |
|---|---|---|
| [`normalization.sql`](./normalization.sql) | 1NF, 2NF, 3NF Normalization | Academic / Advisor system |
| [`one-to-one.sql`](./one-to-one.sql) | One-to-One (1:1) | User account ↔ User profile / Settings |
| [`one-to-many.sql`](./one-to-many.sql) | One-to-Many (1:N) | Article ↔ Comments, Customer ↔ Orders |
| [`many-to-many.sql`](./many-to-many.sql) | Many-to-Many (M:N) | Students ↔ Courses, Products ↔ Tags |
