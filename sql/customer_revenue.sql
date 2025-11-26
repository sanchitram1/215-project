-- Purpose: Analyze which customers are driving the most financial value.
-- Why: Vital for the sales team to prioritize contract renewals.

SELECT 
    c.name AS customer_name, 
    SUM(i.amount) AS total_revenue
FROM invoice i
JOIN orders o ON i.order_id = o.id
JOIN customer_parts cp ON o.customer_part_id = cp.id
JOIN customer c ON cp.customer_id = c.id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 10;