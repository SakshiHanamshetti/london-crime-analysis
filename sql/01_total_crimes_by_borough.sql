-- Query 1: Total Crimes by Borough
-- Returns total crime count per borough, ordered by highest volume first

SELECT 
    Borough,
    COUNT(*) AS total_crimes
FROM crimes
GROUP BY Borough
ORDER BY total_crimes DESC;
