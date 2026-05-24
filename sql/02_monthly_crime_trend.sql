-- Query 2: Monthly Crime Trend
-- Returns total crime count for each month across the full 12-month period

SELECT 
    Month,
    COUNT(*) AS total_crimes
FROM crimes
GROUP BY Month
ORDER BY Month;
