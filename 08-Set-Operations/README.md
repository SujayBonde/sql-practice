# 08 - SQL Set Operations

Set operations combine multiple `SELECT` queries vertically into a single result set based on mathematical set theory.

## Rules for Set Operations
1. Each query must have the **same number of columns**.
2. The columns must have **compatible data types** in the corresponding position.
3. The column names of the final result come from the **first query**.

---

## File Overview

| File | Operation | Set Meaning | Deduplicates? |
|---|---|---|---|
| [`union.sql`](./union.sql) | `UNION` | Set Union ($A cup B$) | **Yes** |
| [`union-all.sql`](./union-all.sql) | `UNION ALL` | Concatenation ($A + B$) | **No** (fastest) |
| [`intersect.sql`](./intersect.sql) | `INTERSECT` | Set Intersection ($A cap B$) | **Yes** |
| [`except.sql`](./except.sql) | `EXCEPT` (MINUS) | Set Difference ($A - B$) | **Yes** |
