-- Analytical queries: E-Commerce transaction platform
-- Target: ANSI SQL

-- 1. Sales and fulfillment metrics
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'DELIVERED' THEN o.total_amount ELSE 0 END) AS realized_revenue,
    ROUND(AVG(CASE WHEN o.order_status = 'DELIVERED' THEN o.total_amount ELSE NULL END), 2) AS aov,
    SUM(CASE WHEN o.order_status = 'CANCELLED' THEN 1 ELSE 0 END) AS cancelled_orders
FROM orders o;

-- 2. Product revenue ranking
SELECT 
    p.product_id,
    p.name AS product_name,
    c.category_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.subtotal) AS gross_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status IN ('DELIVERED', 'SHIPPED')
GROUP BY p.product_id, p.name, c.category_name
ORDER BY gross_revenue DESC;

-- 3. Customer lifetime value (CLV)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS order_count,
    COALESCE(SUM(o.total_amount), 0.00) AS cumulative_spend
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.order_status != 'CANCELLED'
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY cumulative_spend DESC;

-- 4. Inventory threshold reorder alerts
SELECT 
    p.product_id,
    p.sku,
    p.name,
    inv.stock_quantity,
    inv.reorder_level,
    (inv.reorder_level - inv.stock_quantity) AS units_below_reorder_threshold
FROM products p
JOIN inventory inv ON p.product_id = inv.product_id
WHERE inv.stock_quantity <= inv.reorder_level;

-- 5. Product rating summary
SELECT 
    p.product_id,
    p.name,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating), 2) AS mean_rating
FROM products p
LEFT JOIN product_reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name
ORDER BY mean_rating DESC;
