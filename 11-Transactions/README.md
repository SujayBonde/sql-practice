# 11 - SQL Transactions & ACID

Transactions group multiple database operations into a single logical unit of work, adhering to ACID principles (Atomicity, Consistency, Isolation, Durability).

## Learning Objectives
- Group operations safely with `BEGIN TRANSACTION` and `COMMIT`.
- Revert state completely on exception or constraint failure using `ROLLBACK`.
- Set fine-grained rollback checkpoints using `SAVEPOINT` and `ROLLBACK TO SAVEPOINT`.
- Understand transaction isolation and concurrency safeguards.

---

## File Overview

| File | Command | Action |
|---|---|---|
| [`commit.sql`](./commit.sql) | `COMMIT` | Permanently persist all changes within transaction |
| [`rollback.sql`](./rollback.sql) | `ROLLBACK` | Undo all changes made since `BEGIN TRANSACTION` |
| [`savepoint.sql`](./savepoint.sql) | `SAVEPOINT` | Create rollback checkpoints inside ongoing transactions |

---

## The ACID Principles
- **Atomicity**: All statements succeed or none do ("All or Nothing").
- **Consistency**: The database transitions from one valid state to another, upholding all constraints.
- **Isolation**: Concurrent transactions cannot observe each other's intermediate state.
- **Durability**: Once committed, changes survive system crashes or power failures.
