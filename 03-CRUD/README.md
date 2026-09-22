# 03 - SQL CRUD Operations

CRUD (Create, Read, Update, Delete) forms the foundation of all data manipulation in databases.

## Learning Objectives
- **Create**: Master `INSERT INTO`, multi-row batch inserts, and `INSERT INTO ... SELECT`.
- **Read**: Perform structured projections, calculations, and conditional reads with `SELECT`.
- **Update**: Accurately update records, modify multiple columns, and calculate new values with `UPDATE`.
- **Delete**: Safely prune records using `DELETE FROM` with explicit filters, and understand `TRUNCATE TABLE`.

---

## File Overview

| File | Operation | Action |
|---|---|---|
| [`insert.sql`](./insert.sql) | **C** - Create | Insert single, bulk, and query-derived rows |
| [`select.sql`](./select.sql) | **R** - Read | Retrieve, project, and compute result sets |
| [`update.sql`](./update.sql) | **U** - Update | Modify rows, update multiple columns conditionally |
| [`delete.sql`](./delete.sql) | **D** - Delete | Remove targeted rows and contrast with `TRUNCATE` |

---

## Safety Best Practices
> [!CAUTION]
> Always run a `SELECT` with your exact `WHERE` condition **before** executing an `UPDATE` or `DELETE` to preview which rows will be affected!
