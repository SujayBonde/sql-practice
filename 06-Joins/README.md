# 06 - SQL Joins

Joins are the heart of relational database query design, linking normalized entities through foreign key references.

## Learning Objectives
- Understand relational set intersections with `INNER JOIN`.
- Preserve unmatched records using `LEFT JOIN` and `RIGHT JOIN`.
- Identify missing relationships (anti-joins) using `LEFT JOIN ... WHERE right.id IS NULL`.
- Combine full sets with `FULL OUTER JOIN` (and emulate it in MySQL/SQLite with `UNION`).
- Query organizational and recursive hierarchies with `SELF JOIN`.
- Generate combinations with `CROSS JOIN` (Cartesian product).

---

## Visual Join Matrix

```
       INNER JOIN                      LEFT JOIN
  [ Table A  ∩  Table B ]         [ Table A  ( Table B ) ]
 (Only matching rows)             (All A, matches from B)

       RIGHT JOIN                     FULL OUTER JOIN
  ( Table A )  Table B ]         [ Table A  ∪  Table B ]
 (All B, matches from A)          (All rows from both tables)
```

---

## File Overview

| File | Join Type | Typical Use Case |
|---|---|---|
| [`inner-join.sql`](./inner-join.sql) | `INNER JOIN` | Customers who placed orders |
| [`left-join.sql`](./left-join.sql) | `LEFT JOIN` | All customers, highlighting those with zero orders |
| [`right-join.sql`](./right-join.sql) | `RIGHT JOIN` | All departments, highlighting empty departments |
| [`full-outer-join.sql`](./full-outer-join.sql) | `FULL OUTER JOIN` | Merging lists with discrepancies on both sides |
| [`self-join.sql`](./self-join.sql) | `SELF JOIN` | Organizational manager-employee reporting hierarchies |
| [`cross-join.sql`](./cross-join.sql) | `CROSS JOIN` | Generating matrix combinations (e.g. Size × Color) |
