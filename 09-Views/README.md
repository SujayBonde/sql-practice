# 09 - SQL Views

A View is a stored SQL query that acts as a virtual table. Views simplify complex joins, enhance security by restricting column access, and maintain backward compatibility during schema refactors.

## Learning Objectives
- Create reusable virtual query interfaces with `CREATE VIEW`.
- Implement column security by hiding sensitive fields (e.g. passwords, SSNs).
- Alter and replace views safely.
- Remove views with `DROP VIEW IF EXISTS` without deleting table data.

---

## File Overview
- [`create-view.sql`](./create-view.sql): Virtual table abstraction and column hiding.
- [`update-view.sql`](./update-view.sql): Modifying and replacing view definitions.
- [`drop-view.sql`](./drop-view.sql): Dropping views safely.
