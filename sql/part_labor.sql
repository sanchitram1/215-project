-- Purpose: Identify which parts are consuming the most technician labor hours.
-- Why: Helps management decide where to invest in better tooling or training.

SELECT 
    p.name AS part_name, 
    SUM(ot.hours) AS total_labor_hours
FROM order_task ot
JOIN orders o ON ot.order_id = o.id
JOIN customer_parts cp ON o.customer_part_id = cp.id
JOIN part_catalog p ON cp.part_id = p.id
GROUP BY p.name
ORDER BY total_labor_hours DESC
LIMIT 10;