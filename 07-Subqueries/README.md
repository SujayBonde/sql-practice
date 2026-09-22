# 07 - SQL Subqueries

A subquery (nested query) is a query embedded within another SQL statement, enabling multi-stage relational logic.

## Learning Objectives
- Master scalar subqueries returning a single value.
- Evaluate sets with multi-row operators (`IN`, `ANY`, `ALL`).
- Implement correlated subqueries where the inner query depends on outer row values.
- Optimize existence checks with `EXISTS` and `NOT EXISTS`.

---

## File Overview

| File | Subquery Type | Key Concept |
|---|---|---|
| [`single-row-subquery.sql`](./single-row-subquery.sql) | Scalar | Returns 1 value; used with `>`, `<`, `=` |
| [`multi-row-subquery.sql`](./multi-row-subquery.sql) | Multi-Row | Evaluates against sets using `> ALL`, `> ANY` |
| [`correlated-subquery.sql`](./correlated-subquery.sql) | Correlated | References outer table columns for contextual calculation |
| [`subquery-with-in.sql`](./subquery-with-in.sql) | `IN` / `NOT IN` | Membership filtering (and NULL safety) |
| [`subquery-with-exists.sql`](./subquery-with-exists.sql) | `EXISTS` / `NOT EXISTS` | High-efficiency boolean existence checks |

---

## Performance Tip: `NOT IN` vs `NOT EXISTS`
> [!WARNING]
> If a subquery used with `NOT IN` returns even a single `NULL` value, the entire `NOT IN` expression evaluates to `UNKNOWN` (returning 0 rows). Prefer `NOT EXISTS` for robust, high-performance checks!
