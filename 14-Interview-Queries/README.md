# 14 - Top SQL Interview Queries

Master the most frequently asked SQL interview problems from top tech companies (FAANG, LeetCode Hard/Medium).

## Problem Quick Index

| File | Problem Name | LeetCode Equiv | Key Technique |
|---|---|---|---|
| [`second-highest-salary.sql`](./second-highest-salary.sql) | Second Highest Salary | #176 | `DENSE_RANK()`, Subquery |
| [`nth-highest-salary.sql`](./nth-highest-salary.sql) | N-th Highest Salary | #177 | `DENSE_RANK() = N` |
| [`duplicate-records.sql`](./duplicate-records.sql) | Duplicate Records | Common | `GROUP BY ... HAVING COUNT(*) > 1` |
| [`remove-duplicates.sql`](./remove-duplicates.sql) | Delete Duplicates | #196 | Subquery with `MIN(id)` |
| [`employees-higher-than-average.sql`](./employees-higher-than-average.sql) | Above Dept Average | Common | Window `AVG() OVER(PARTITION BY)` |
| [`department-highest-salary.sql`](./department-highest-salary.sql) | Department Top Earner | #184 | `DENSE_RANK() = 1` |
| [`top-3-salaries.sql`](./top-3-salaries.sql) | Top 3 Salaries per Dept | #185 | `DENSE_RANK() <= 3` |
| [`customers-without-orders.sql`](./customers-without-orders.sql) | Customers Who Never Order | #183 | `LEFT JOIN ... IS NULL` / `NOT EXISTS` |
| [`consecutive-records.sql`](./consecutive-records.sql) | Consecutive Numbers / Streak | #180 | `LAG()` & `LEAD()` |
