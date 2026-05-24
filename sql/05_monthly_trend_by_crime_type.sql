-- Query 5: Monthly Trend by Crime Type
-- Returns crime counts broken down by both month and crime type
-- Ordered by month then volume descending

SELECT 
    Month,
    "Crime type",
    COUNT(*) AS total_crimes
FROM crimes
GROUP BY Month, "Crime type"
ORDER BY Month, total_crimes DESC;
