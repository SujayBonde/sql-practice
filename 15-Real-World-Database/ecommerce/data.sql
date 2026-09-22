-- ================================================================
-- REAL-WORLD DATABASE 2: E-Commerce Platform
-- SEED DATA (data.sql)
-- ================================================================

-- Categories
INSERT INTO categories VALUES
(1, 'Electronics', NULL),
(2, 'Computers', 1),
(3, 'Audio', 1),
(4, 'Apparel', NULL),
(5, 'Footwear', 4);

-- Products
INSERT INTO products VALUES
(1, 'UltraBook Pro 14',  'SKU-UB-14',  'High performance ultrabook', 2, 1299.99, TRUE),
(2, 'NoiseCancelling 700','SKU-NC-700', 'Active noise cancelling headphones', 3, 299.99, TRUE),
(3, 'Wireless Mechanical Keybd', 'SKU-KB-01', 'RGB Low profile switches', 2, 119.99, TRUE),
(4, 'Running Aero Shoes', 'SKU-SH-09',  'Lightweight marathon running shoes', 5, 139.99, TRUE),
(5, '4K Gaming Monitor',  'SKU-MN-27',  '144Hz 1ms IPS gaming display', 2, 399.99, TRUE),
(6, 'USB-C Multi-port Hub','SKU-HB-04', '7-in-1 aluminum power delivery hub', 2, 49.99, TRUE);

-- Inventory
INSERT INTO inventory VALUES
(1, 35, 10, '2023-09-01'),
(2, 60, 15, '2023-09-10'),
(3, 110, 20, '2023-09-15'),
(4, 45, 10, '2023-09-20'),
(5, 8,  10, '2023-08-15'), -- Stock below reorder level!
(6, 150, 25, '2023-09-25');

-- Customers
INSERT INTO customers VALUES
(1, 'Emily', 'Watson', 'emily.w@domain.com', '2023-01-10 10:00:00', 'San Francisco', 'USA'),
(2, 'James', 'Miller', 'james.m@domain.com', '2023-02-14 11:30:00', 'Austin', 'USA'),
(3, 'Sophia', 'Chen',  'sophia.c@domain.com', '2023-03-05 09:15:00', 'Seattle', 'USA'),
(4, 'Liam', 'Wilson',  'liam.w@domain.com',  '2023-04-18 16:20:00', 'Chicago', 'USA'),
(5, 'Olivia', 'Taylor','olivia.t@domain.com', '2023-05-22 14:00:00', 'New York', 'USA'),
(6, 'Lucas', 'Martin', 'lucas.m@domain.com', '2023-06-01 18:45:00', 'Denver', 'USA'); -- Never ordered

-- Orders
INSERT INTO orders VALUES
(1001, 1, 'DELIVERED', '2023-07-01 14:30:00', 1419.98),
(1002, 2, 'DELIVERED', '2023-07-05 10:15:00', 299.99),
(1003, 1, 'DELIVERED', '2023-08-10 16:45:00', 399.99),
(1004, 3, 'SHIPPED',   '2023-08-12 11:00:00', 259.98),
(1005, 4, 'PROCESSING','2023-09-01 09:20:00', 1299.99),
(1006, 5, 'CANCELLED', '2023-09-02 13:10:00', 139.99);

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 1, 1, 1299.99, 1299.99),
(2, 1001, 3, 1, 119.99,  119.99),
(3, 1002, 2, 1, 299.99,  299.99),
(4, 1003, 5, 1, 399.99,  399.99),
(5, 1004, 3, 1, 119.99,  119.99),
(6, 1004, 4, 1, 139.99,  139.99),
(7, 1005, 1, 1, 1299.99, 1299.99),
(8, 1006, 4, 1, 139.99,  139.99);

-- Payments
INSERT INTO payments VALUES
(1, 1001, 'CREDIT_CARD', 'SUCCESS', 1419.98, '2023-07-01 14:31:00'),
(2, 1002, 'APPLE_PAY',   'SUCCESS', 299.99,  '2023-07-05 10:16:00'),
(3, 1003, 'CREDIT_CARD', 'SUCCESS', 399.99,  '2023-08-10 16:46:00'),
(4, 1004, 'PAYPAL',      'SUCCESS', 259.98,  '2023-08-12 11:02:00'),
(5, 1005, 'CREDIT_CARD', 'SUCCESS', 1299.99, '2023-09-01 09:21:00'),
(6, 1006, 'CREDIT_CARD', 'REFUNDED',139.99,  '2023-09-02 13:15:00');

-- Product Reviews
INSERT INTO product_reviews VALUES
(1, 1, 1, 5, 'Exceptional build quality and battery life. Highly recommend.', '2023-07-10'),
(2, 2, 2, 4, 'Great sound stage and noise isolation, slightly tight on ears.', '2023-07-12'),
(3, 5, 1, 5, 'Crisp colors and buttery smooth 144Hz refresh rate.', '2023-08-15'),
(4, 3, 3, 5, 'Clicky keys feel amazing for coding all day long.', '2023-08-20');
