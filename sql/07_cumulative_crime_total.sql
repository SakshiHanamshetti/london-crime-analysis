-- Query 7: Cumulative Crime Total Over Time
-- Uses SUM() as a window function to calculate running total across months
-- Final month should equal total dataset row count (1,125,295)

SELECT
    Month,
    COUNT(*) AS monthly_crimes,
    SUM(COUNT(*)) OVER (ORDER BY Month) AS cumulative_crimes
FROM crimes
GROUP BY Month
ORDER BY Month;
