# 05 - SQL Grouping & Aggregations

Grouping allows you to collapse sets of rows into summary rows, producing management metrics, KPIs, and regional breakdowns.

## Learning Objectives
- Collapse detail records into category summaries with `GROUP BY`.
- Understand the execution order of `WHERE` vs `HAVING`.
- Group by multiple columns for granular dimensional analysis.
- Combine all SQL aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) in single analytical queries.

---

## File Overview

| File | Topic | Key Insight |
|---|---|---|
| [`group-by.sql`](./group-by.sql) | `GROUP BY` | Summarize metrics across single and multiple dimensions |
| [`having.sql`](./having.sql) | `HAVING` | Filter grouped results (e.g. `HAVING COUNT(*) > 5`) |
| [`aggregate-with-group.sql`](./aggregate-with-group.sql) | Full Analytics Dashboard | Combining multiple aggregates with `GROUP BY` and `HAVING` |

---

## WHERE vs HAVING
| Clause | When it Evaluates | Can it use Aggregates? | Target |
|---|---|---|---|
| `WHERE` | Before grouping | No (`WHERE salary > 50000`) | Individual rows |
| `HAVING` | After grouping | Yes (`HAVING AVG(salary) > 50000`) | Grouped sets |
