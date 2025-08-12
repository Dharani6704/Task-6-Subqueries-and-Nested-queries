# Task-6-Subqueries-and-Nested-queries
## Objective
Practice using subqueries inside `SELECT`, `WHERE`, and `FROM` clauses for advanced SQL query logic.

## Tools Used
- PostgreSQL
- pgAdmin 4

## Steps Completed

1. **Created sample tables**:
   - `customers` (customer details)
   - `orders` (order details with foreign key reference to `customers`)

2. **Inserted sample data** for different customers and orders.

3. **Implemented subquery examples**:
   - **Scalar subquery in SELECT**: Counted total orders per customer.
   - **Subquery in WHERE with IN**: Found customers who placed orders above a certain amount.
   - **Correlated subquery with EXISTS**: Checked if a customer placed an order greater than 300.
   - **Subquery in FROM**: Used a derived table to calculate average order value per city.

4. **Used clauses**:
   - `IN`
   - `EXISTS`
   - `=`
   - `GROUP BY`
