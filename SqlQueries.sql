-- Step 1: Create sample tables
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10,2)
);

-- Step 2: Insert sample data
INSERT INTO customers (name, city) VALUES
('Alice', 'New York'),
('Bob', 'Los Angeles'),
('Charlie', 'New York'),
('Diana', 'Chicago');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 250.00),
(1, '2025-08-03', 100.00),
(2, '2025-08-02', 300.00),
(3, '2025-08-01', 200.00),
(3, '2025-08-04', 150.00),
(4, '2025-08-05', 400.00);

-- Example 1: Subquery in SELECT (Scalar Subquery)
SELECT 
    name,
    (SELECT COUNT(*) 
     FROM orders 
     WHERE orders.customer_id = customers.customer_id) AS total_orders
FROM customers;


-- Example 2: Subquery in WHERE (IN)

SELECT name, city
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE total_amount > 200
);

-- Example 3: Subquery in WHERE (EXISTS - Correlated Subquery)

SELECT name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.total_amount > 300
);

-- Example 4: Subquery in FROM

SELECT city, AVG(total_amount) AS avg_order_value
FROM (
    SELECT c.city, o.total_amount
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
) AS city_orders
GROUP BY city;
