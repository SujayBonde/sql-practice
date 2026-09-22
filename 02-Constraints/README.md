# 02 - SQL Constraints

Data integrity is the bedrock of relational databases. SQL constraints enforce business rules, relationships, and validity checks directly at the storage engine level.

## Learning Objectives
- Establish entity identity with `PRIMARY KEY` (single & composite).
- Enforce referential integrity and cascading actions with `FOREIGN KEY`.
- Prevent duplicate values across records using `UNIQUE`.
- Mandate required fields with `NOT NULL`.
- Specify automatic fallback values using `DEFAULT`.
- Implement custom domain validation rules with `CHECK`.

---

## File Overview

| File | Constraint | Purpose & Example |
|---|---|---|
| [`primary-key.sql`](./primary-key.sql) | `PRIMARY KEY` | Unique non-null row identifier |
| [`foreign-key.sql`](./foreign-key.sql) | `FOREIGN KEY` | Links child row to parent table (`ON DELETE CASCADE`) |
| [`unique.sql`](./unique.sql) | `UNIQUE` | Guarantees all column values are distinct |
| [`not-null.sql`](./not-null.sql) | `NOT NULL` | Forbids NULL / missing values |
| [`default.sql`](./default.sql) | `DEFAULT` | Auto-assigns default values on row insertion |
| [`check.sql`](./check.sql) | `CHECK` | Validates row values against a condition expression |

---

## Cheat Sheet

```sql
CREATE TABLE inventory_items (
    item_id INT PRIMARY KEY,
    sku VARCHAR(30) NOT NULL UNIQUE,
    quantity INT DEFAULT 0 CHECK (quantity >= 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0),
    warehouse_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE RESTRICT
);
```
