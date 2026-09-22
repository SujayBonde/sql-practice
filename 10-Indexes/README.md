# 10 - SQL Indexes

Indexes are specialized data structures (typically B-Trees) that maintain ordered pointers to table rows, dramatically reducing disk I/O and query latency.

## Learning Objectives
- Speed up `WHERE`, `JOIN`, and `ORDER BY` clauses using `CREATE INDEX`.
- Enforce uniqueness while indexing using `UNIQUE INDEX`.
- Design multi-column composite indexes and understand the **Leftmost Prefix Rule**.
- Inspect index usage using `EXPLAIN` and `EXPLAIN QUERY PLAN`.

---

## File Overview

| File | Index Type | Key Concept |
|---|---|---|
| [`create-index.sql`](./create-index.sql) | Standard Index | Speed up single-column search |
| [`unique-index.sql`](./unique-index.sql) | Unique Index | Fast search + unique constraint enforcement |
| [`composite-index.sql`](./composite-index.sql) | Composite Index | Leftmost prefix optimization for multi-column queries |

---

## Indexing Trade-offs
- **Pros**: Drastically accelerates `SELECT`, `JOIN`, and `ORDER BY`.
- **Cons**: Adds overhead to `INSERT`, `UPDATE`, and `DELETE`; consumes disk space.
