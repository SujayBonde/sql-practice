# 04 - SQL Built-in Functions

Functions transform and aggregate data in queries. This module covers the most essential aggregate, string, numeric, date/time, and NULL-handling functions.

## Learning Objectives
- Aggregate data across rows using `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.
- Format, sanitize, and concatenate text strings with `UPPER`, `LOWER`, `TRIM`, `SUBSTRING`, and `REPLACE`.
- Perform mathematical transformations using `ROUND`, `CEIL`, `FLOOR`, `ABS`, and `MOD`.
- Work with dates, times, parts extraction, and intervals.
- Gracefully handle NULL values using `COALESCE`, `NULLIF`, and proper `IS NULL` testing.

---

## File Overview

| File | Function Category | Primary Examples |
|---|---|---|
| [`aggregate-functions.sql`](./aggregate-functions.sql) | Aggregation | `COUNT(*)`, `SUM(col)`, `AVG(col)`, `MIN(col)`, `MAX(col)` |
| [`string-functions.sql`](./string-functions.sql) | Text Manipulation | `TRIM()`, `UPPER()`, `LOWER()`, `SUBSTRING()`, `REPLACE()` |
| [`numeric-functions.sql`](./numeric-functions.sql) | Math & Numbers | `ROUND()`, `CEIL()`, `FLOOR()`, `ABS()`, `MOD()` |
| [`date-functions.sql`](./date-functions.sql) | Timestamps & Dates | `CURRENT_DATE`, `EXTRACT()`, intervals, date differences |
| [`null-functions.sql`](./null-functions.sql) | Handling NULLs | `COALESCE(a, b, 'fallback')`, `NULLIF(x, 0)`, `IS NULL` |

---

## Pro Tip: Division by Zero Guard
```sql
-- Avoid runtime crash: division by zero!
SELECT 
    total_sales / NULLIF(units_sold, 0) AS revenue_per_unit
FROM product_metrics;
```
