# SQL Practice Repository

[![SQL Standard](https://img.shields.io/badge/SQL-ANSI%20Standard-blue.svg?style=flat-square)](#)
[![Engines](https://img.shields.io/badge/RDBMS-PostgreSQL%20%7C%20MySQL%20%7C%20SQLite%20%7C%20SQL%20Server-2ea44f.svg?style=flat-square)](#dialect-compatibility-matrix)
[![Modules](https://img.shields.io/badge/Modules-15%20Directories-8a2be2.svg?style=flat-square)](#curriculum-overview)
[![Scripts](https://img.shields.io/badge/Scripts-80%2B%20SQL%20Files-orange.svg?style=flat-square)](#curriculum-overview)
[![License](https://img.shields.io/badge/License-MIT-gray.svg?style=flat-square)](LICENSE)

A structured, standalone SQL curriculum spanning foundational relational concepts to advanced analytical patterns and production database schemas. Every script contains self-contained schema definitions, test data fixtures, and declarative query demonstrations.

---

## Table of Contents

- [Curriculum Overview](#curriculum-overview)
- [Dialect Compatibility Matrix](#dialect-compatibility-matrix)
- [Repository Structure](#repository-structure)
- [Module Index & Topics](#module-index--topics)
- [Production Schemas](#production-schemas)
- [Interview Challenge Mappings](#interview-challenge-mappings)
- [Quickstart Execution](#quickstart-execution)
- [Git Remote Configuration](#git-remote-configuration)

---

## Curriculum Overview

The repository is organized into five progressive competency tiers:

```
[ Tier 1: Fundamentals ] ─────> 01-Basics, 02-Constraints, 03-CRUD
                                      │
[ Tier 2: Transformation ] ───> 04-Functions, 05-Grouping, 06-Joins
                                      │
[ Tier 3: Set Algebra ] ──────> 07-Subqueries, 08-Set-Operations, 09-Views
                                      │
[ Tier 4: Engine Internals ] ─> 10-Indexes, 11-Transactions, 12-Database-Design
                                      │
[ Tier 5: High-Performance ] ─> 13-Advanced-SQL, 14-Interview-Queries, 15-Real-World-Database
```

---

## Dialect Compatibility Matrix

The scripts in this repository follow **ANSI SQL:2016** standards. Variations in vendor implementation are annotated directly within the script headers.

| Feature Area | ANSI Standard | PostgreSQL | MySQL 8.0+ | SQLite 3.35+ |
|---|---|---|---|---|
| **Limit / Offset** | `FETCH FIRST n ROWS ONLY` | `LIMIT n OFFSET m` | `LIMIT n OFFSET m` | `LIMIT n OFFSET m` |
| **Window Functions** | `OVER (PARTITION BY ...)` | Native | Native | Native |
| **Common Table Expressions** | `WITH ...` | Native | Native | Native |
| **Recursive Queries** | `WITH RECURSIVE ...` | Native | Native | Native |
| **Set Operations** | `UNION`, `INTERSECT`, `EXCEPT` | `EXCEPT` | `EXCEPT` (8.0.31+) | `EXCEPT` |
| **Full Outer Join** | `FULL OUTER JOIN` | Native | Emulate (`UNION`) | Emulate (`UNION`) |
| **String Concatenation** | `\|\|` | `\|\|` | `CONCAT()` / `\|\|` | `\|\|` |

---

## Repository Structure

```
sql-practice/
├── 01-Basics/                 # DDL, DML, Projections, Filtering, Sorting & Pagination
├── 02-Constraints/            # Primary Keys, Foreign Keys, Unique, Not Null, Checks
├── 03-CRUD/                   # Create, Read, Update, Delete Operations
├── 04-Functions/              # Aggregate, String, Numeric, Date & NULL-Safe Functions
├── 05-Grouping/               # GROUP BY, HAVING & Multi-Column Aggregations
├── 06-Joins/                  # Inner, Outer, Self & Cross Joins
├── 07-Subqueries/             # Scalar, Multi-Row, Correlated, IN & EXISTS Subqueries
├── 08-Set-Operations/         # UNION, UNION ALL, INTERSECT & EXCEPT
├── 09-Views/                  # View Creation, Projection & Lifecycle Management
├── 10-Indexes/                # B-Tree, Unique, Composite & Index Seek Optimization
├── 11-Transactions/           # ACID, Isolation, COMMIT, ROLLBACK & SAVEPOINT
├── 12-Database-Design/        # Normalization (1NF-3NF), 1:1, 1:N & M:N Junctions
├── 13-Advanced-SQL/           # CASE, CTEs, Recursive CTEs & Window Functions
├── 14-Interview-Queries/      # FAANG & LeetCode Relational Query Challenges
└── 15-Real-World-Database/    # Enterprise Schemas (ERP, E-Commerce, Blog Engine)
```

---

## Module Index & Topics

### 01. Basics ([`01-Basics/`](./01-Basics/))
- [`create-database.sql`](./01-Basics/create-database.sql): Database initialization and collation.
- [`create-table.sql`](./01-Basics/create-table.sql): Column definitions and data type declarations.
- [`insert-data.sql`](./01-Basics/insert-data.sql): Single-row and batch insert syntax.
- [`select.sql`](./01-Basics/select.sql): Column projection and arithmetic expressions.
- [`distinct.sql`](./01-Basics/distinct.sql): Cardinality reduction and distinct record extraction.
- [`aliases.sql`](./01-Basics/aliases.sql): Column aliasing and table qualification.
- [`where.sql`](./01-Basics/where.sql): Row filtering via boolean predicates.
- [`operators.sql`](./01-Basics/operators.sql): `BETWEEN`, `IN`, `LIKE`, and arithmetic operators.
- [`order-by.sql`](./01-Basics/order-by.sql): Ascending, descending, and multi-column ordering.
- [`limit.sql`](./01-Basics/limit.sql): Result set truncation and offset pagination.

### 02. Constraints ([`02-Constraints/`](./02-Constraints/))
- [`primary-key.sql`](./02-Constraints/primary-key.sql): Single-column and composite entity identifiers.
- [`foreign-key.sql`](./02-Constraints/foreign-key.sql): Referential integrity and cascade actions (`ON DELETE CASCADE`).
- [`unique.sql`](./02-Constraints/unique.sql): Candidate key uniqueness and nullability constraints.
- [`not-null.sql`](./02-Constraints/not-null.sql): Mandatory field enforcement.
- [`default.sql`](./02-Constraints/default.sql): Column default value generation.
- [`check.sql`](./02-Constraints/check.sql): Domain range and allowable value validation.

### 03. CRUD Operations ([`03-CRUD/`](./03-CRUD/))
- [`insert.sql`](./03-CRUD/insert.sql): Single, multi-row, and `INSERT INTO ... SELECT` workflows.
- [`select.sql`](./03-CRUD/select.sql): Structured projection, computed columns, and filtered reads.
- [`update.sql`](./03-CRUD/update.sql): Conditional single and multi-column modifications.
- [`delete.sql`](./03-CRUD/delete.sql): Filtered deletion vs table truncation (`TRUNCATE`).

### 04. Functions ([`04-Functions/`](./04-Functions/))
- [`aggregate-functions.sql`](./04-Functions/aggregate-functions.sql): `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
- [`string-functions.sql`](./04-Functions/string-functions.sql): `UPPER`, `LOWER`, `TRIM`, `SUBSTRING`, `REPLACE`.
- [`numeric-functions.sql`](./04-Functions/numeric-functions.sql): `ROUND`, `CEIL`, `FLOOR`, `ABS`, `MOD`.
- [`date-functions.sql`](./04-Functions/date-functions.sql): Date extraction, current timestamp, and date intervals.
- [`null-functions.sql`](./04-Functions/null-functions.sql): `COALESCE`, `NULLIF`, division-by-zero guards.

### 05. Grouping ([`05-Grouping/`](./05-Grouping/))
- [`group-by.sql`](./05-Grouping/group-by.sql): Dimensional aggregation across single and multiple attributes.
- [`having.sql`](./05-Grouping/having.sql): Post-aggregation group filtering (`HAVING`).
- [`aggregate-with-group.sql`](./05-Grouping/aggregate-with-group.sql): Multi-metric reporting pipelines.

### 06. Joins ([`06-Joins/`](./06-Joins/))
- [`inner-join.sql`](./06-Joins/inner-join.sql): Relational intersection matching keys across tables.
- [`left-join.sql`](./06-Joins/left-join.sql): Left outer joins and anti-join patterns.
- [`right-join.sql`](./06-Joins/right-join.sql): Right outer joins.
- [`full-outer-join.sql`](./06-Joins/full-outer-join.sql): Full outer union and cross-engine emulation.
- [`self-join.sql`](./06-Joins/self-join.sql): Hierarchical queries linking records within the same table.
- [`cross-join.sql`](./06-Joins/cross-join.sql): Cartesian products for matrix generation.

### 07. Subqueries ([`07-Subqueries/`](./07-Subqueries/))
- [`single-row-subquery.sql`](./07-Subqueries/single-row-subquery.sql): Scalar subquery evaluation.
- [`multi-row-subquery.sql`](./07-Subqueries/multi-row-subquery.sql): Set evaluation via `ANY`, `SOME`, and `ALL`.
- [`correlated-subquery.sql`](./07-Subqueries/correlated-subquery.sql): Contextual inner evaluation referencing outer row.
- [`subquery-with-in.sql`](./07-Subqueries/subquery-with-in.sql): Subquery set membership (`IN` / `NOT IN`).
- [`subquery-with-exists.sql`](./07-Subqueries/subquery-with-exists.sql): Boolean existence testing (`EXISTS` / `NOT EXISTS`).

### 08. Set Operations ([`08-Set-Operations/`](./08-Set-Operations/))
- [`union.sql`](./08-Set-Operations/union.sql): Distinct set union.
- [`union-all.sql`](./08-Set-Operations/union-all.sql): Unchecked set concatenation.
- [`intersect.sql`](./08-Set-Operations/intersect.sql): Set intersection.
- [`except.sql`](./08-Set-Operations/except.sql): Set difference (`EXCEPT` / `MINUS`).

### 09. Views ([`09-Views/`](./09-Views/))
- [`create-view.sql`](./09-Views/create-view.sql): Virtual table abstraction and column protection.
- [`update-view.sql`](./09-Views/update-view.sql): View definition replacement and lifecycle.
- [`drop-view.sql`](./09-Views/drop-view.sql): View removal without underlying data alteration.

### 10. Indexes ([`10-Indexes/`](./10-Indexes/))
- [`create-index.sql`](./10-Indexes/create-index.sql): B-Tree index creation for fast lookups.
- [`unique-index.sql`](./10-Indexes/unique-index.sql): Unique index enforcement.
- [`composite-index.sql`](./10-Indexes/composite-index.sql): Multi-column indexing and leftmost prefix rule.

### 11. Transactions ([`11-Transactions/`](./11-Transactions/))
- [`commit.sql`](./11-Transactions/commit.sql): Atomic transaction commits (`BEGIN` ... `COMMIT`).
- [`rollback.sql`](./11-Transactions/rollback.sql): State reversion on failure (`ROLLBACK`).
- [`savepoint.sql`](./11-Transactions/savepoint.sql): Checkpoints and partial rollbacks (`SAVEPOINT`).

### 12. Database Design ([`12-Database-Design/`](./12-Database-Design/))
- [`normalization.sql`](./12-Database-Design/normalization.sql): Relational normalization through 1NF, 2NF, and 3NF.
- [`one-to-one.sql`](./12-Database-Design/one-to-one.sql): 1:1 relationship via shared or unique foreign key.
- [`one-to-many.sql`](./12-Database-Design/one-to-many.sql): 1:N relationship with parent-child foreign keys.
- [`many-to-many.sql`](./12-Database-Design/many-to-many.sql): M:N relationship using associative junction tables.

### 13. Advanced SQL ([`13-Advanced-SQL/`](./13-Advanced-SQL/))
- [`case.sql`](./13-Advanced-SQL/case.sql): Conditional expressions and pivot queries.
- [`cte.sql`](./13-Advanced-SQL/cte.sql): Common Table Expressions (`WITH`).
- [`recursive-cte.sql`](./13-Advanced-SQL/recursive-cte.sql): Recursive tree traversals and sequence generation.
- [`window-functions.sql`](./13-Advanced-SQL/window-functions.sql): Analytical partitions via `OVER (PARTITION BY)`.
- [`row-number.sql`](./13-Advanced-SQL/row-number.sql): Sequential row enumeration (`ROW_NUMBER()`).
- [`rank.sql`](./13-Advanced-SQL/rank.sql): Non-contiguous rank assignment (`RANK()`).
- [`dense-rank.sql`](./13-Advanced-SQL/dense-rank.sql): Contiguous rank assignment (`DENSE_RANK()`).
- [`lead.sql`](./13-Advanced-SQL/lead.sql): Forward offset row inspection (`LEAD()`).
- [`lag.sql`](./13-Advanced-SQL/lag.sql): Backward offset row inspection for delta calculations (`LAG()`).

### 14. Interview Queries ([`14-Interview-Queries/`](./14-Interview-Queries/))
- [`second-highest-salary.sql`](./14-Interview-Queries/second-highest-salary.sql): LeetCode #176 solutions.
- [`nth-highest-salary.sql`](./14-Interview-Queries/nth-highest-salary.sql): LeetCode #177 dynamic ranking pattern.
- [`duplicate-records.sql`](./14-Interview-Queries/duplicate-records.sql): Identifying duplicates via grouped counts.
- [`remove-duplicates.sql`](./14-Interview-Queries/remove-duplicates.sql): LeetCode #196 deduplication with row retention.
- [`employees-higher-than-average.sql`](./14-Interview-Queries/employees-higher-than-average.sql): Intra-group comparison via window partition.
- [`department-highest-salary.sql`](./14-Interview-Queries/department-highest-salary.sql): LeetCode #184 top earner identification.
- [`top-3-salaries.sql`](./14-Interview-Queries/top-3-salaries.sql): LeetCode #185 top-N ranking per department.
- [`customers-without-orders.sql`](./14-Interview-Queries/customers-without-orders.sql): LeetCode #183 anti-join and existence tests.
- [`consecutive-records.sql`](./14-Interview-Queries/consecutive-records.sql): LeetCode #180 consecutive sequence detection.

---

## Production Schemas

Module [`15-Real-World-Database/`](./15-Real-World-Database/) provides three complete relational schemas:

### 1. Employee Management System ([`15-Real-World-Database/employee-management/`](./15-Real-World-Database/employee-management/))
```
[ departments ] 1 ──< N [ employees ] 1 ──< N [ payroll_history ]
                           │        ^
                           │ (manager_id)
                           v        │
                        M ──< [ employee_projects ] >── M [ projects ]
```
- [`schema.sql`](./15-Real-World-Database/employee-management/schema.sql): Schema with self-referencing foreign keys, constraints, and audit indices.
- [`data.sql`](./15-Real-World-Database/employee-management/data.sql): Seed data across executive, engineering, marketing, and finance departments.
- [`queries.sql`](./15-Real-World-Database/employee-management/queries.sql): Payroll variance, project capacity allocation, and salary ranking queries.

### 2. E-Commerce Platform ([`15-Real-World-Database/ecommerce/`](./15-Real-World-Database/ecommerce/))
```
[ customers ] 1 ──< N [ orders ] 1 ──< N [ order_items ] >── 1 [ products ]
                          │                                           │
                          v                                           v
                  1 [ payments ]                               1 [ inventory ]
```
- [`schema.sql`](./15-Real-World-Database/ecommerce/schema.sql): Relational order processing, inventory thresholds, and customer reviews.
- [`data.sql`](./15-Real-World-Database/ecommerce/data.sql): Product catalog, stock tracking, and multi-state customer order records.
- [`queries.sql`](./15-Real-World-Database/ecommerce/queries.sql): Realized revenue, product performance, CLV, and reorder alerts.

### 3. Content Publishing Platform ([`15-Real-World-Database/blog/`](./15-Real-World-Database/blog/))
```
[ users ] 1 ──< N [ posts ] 1 ──< N [ comments ] (recursive parent_comment_id)
                     │
                     v
             M ──< [ post_tags ] >── M [ tags ]
```
- [`schema.sql`](./15-Real-World-Database/blog/schema.sql): Articles, category taxonomy, tag junctions, likes, and self-referencing comment trees.
- [`data.sql`](./15-Real-World-Database/blog/data.sql): Seed articles, tag taxonomy, likes, and nested comment chains.
- [`queries.sql`](./15-Real-World-Database/blog/queries.sql): Engagement analysis, tag aggregation, and recursive comment thread traversal.

---

## Interview Challenge Mappings

| Problem | File | Pattern | Complexity |
|---|---|---|---|
| **Second Highest Salary** | [`second-highest-salary.sql`](./14-Interview-Queries/second-highest-salary.sql) | Subquery / `DENSE_RANK()` | Easy |
| **Nth Highest Salary** | [`nth-highest-salary.sql`](./14-Interview-Queries/nth-highest-salary.sql) | `DENSE_RANK() = N` | Medium |
| **Duplicate Records** | [`duplicate-records.sql`](./14-Interview-Queries/duplicate-records.sql) | `GROUP BY ... HAVING COUNT(*) > 1` | Easy |
| **Delete Duplicates** | [`remove-duplicates.sql`](./14-Interview-Queries/remove-duplicates.sql) | Subquery with `MIN(id)` | Medium |
| **Above Average Salary** | [`employees-higher-than-average.sql`](./14-Interview-Queries/employees-higher-than-average.sql) | `AVG() OVER (PARTITION BY)` | Medium |
| **Department Top Salary** | [`department-highest-salary.sql`](./14-Interview-Queries/department-highest-salary.sql) | `DENSE_RANK() = 1` | Medium |
| **Top 3 Department Salaries** | [`top-3-salaries.sql`](./14-Interview-Queries/top-3-salaries.sql) | `DENSE_RANK() <= 3` | Hard |
| **Customers Without Orders** | [`customers-without-orders.sql`](./14-Interview-Queries/customers-without-orders.sql) | `LEFT JOIN ... IS NULL` / `NOT EXISTS` | Easy |
| **Consecutive Numbers** | [`consecutive-records.sql`](./14-Interview-Queries/consecutive-records.sql) | `LAG()` and `LEAD()` | Medium |

---

## Quickstart Execution

All scripts are idempotent: they drop existing demo tables, construct schemas, populate data, and execute target queries.

### PostgreSQL
```bash
psql -U postgres -d testdb -f 06-Joins/inner-join.sql
```

### MySQL
```bash
mysql -u root -p testdb < 13-Advanced-SQL/window-functions.sql
```

### SQLite
```bash
sqlite3 :memory: < 14-Interview-Queries/second-highest-salary.sql
```

---

## Git Remote Configuration

To link this repository to your GitHub account:

```bash
git remote add origin https://github.com/<YOUR_USERNAME>/sql-practice.git
git branch -M main
git push -u origin main
```

---

## License

This repository is distributed under the [MIT License](LICENSE).
#   s q l - p r a c t i c e  
 