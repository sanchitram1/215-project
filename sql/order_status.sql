-- Purpose: A snapshot of where all current orders are in the pipeline.
-- Why: Operational efficiency; identifies if too many items are 'on hold' or 'review'.

SELECT 
    status, 
    COUNT(*) as order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;