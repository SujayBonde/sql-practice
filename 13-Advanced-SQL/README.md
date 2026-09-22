# 13 - Advanced SQL

Elevate your SQL skills with advanced analytical constructs: conditional branching, modular CTEs, tree traversal with Recursive CTEs, and window analytics.

## Learning Objectives
- Implement dynamic conditional branching and pivot queries with `CASE`.
- Deconstruct complex queries into clean steps using Common Table Expressions (`WITH` CTE).
- Traverse graph/tree structures with `WITH RECURSIVE`.
- Calculate running totals, rankings, and lead/lag intervals with **Window Functions**.

---

## File Overview

| File | Concept | Real-World Use Case |
|---|---|---|
| [`case.sql`](./case.sql) | `CASE WHEN ... THEN` | Grading, status flags, conditional aggregation |
| [`cte.sql`](./cte.sql) | Common Table Expressions | Modular subqueries, readability, staged calculations |
| [`recursive-cte.sql`](./recursive-cte.sql) | `WITH RECURSIVE` | Org chart traversal, bill of materials, series |
| [`window-functions.sql`](./window-functions.sql) | `OVER (PARTITION BY ...)` | Department payroll comparison, running totals |
| [`row-number.sql`](./row-number.sql) | `ROW_NUMBER()` | Strict row deduplication, unique item order |
| [`rank.sql`](./rank.sql) | `RANK()` | Competitions with rank ties and gaps (1, 2, 2, 4) |
| [`dense-rank.sql`](./dense-rank.sql) | `DENSE_RANK()` | Continuous ranking without gaps (1, 2, 2, 3) |
| [`lead.sql`](./lead.sql) | `LEAD()` | Looking ahead to next period's metric |
| [`lag.sql`](./lag.sql) | `LAG()` | Looking back for QoQ or YoY growth calculation |
