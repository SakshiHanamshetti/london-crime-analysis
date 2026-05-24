-- Query 3: Top 5 Crime Types per Borough
-- Uses RANK() window function partitioned by borough
-- QUALIFY filters on window function result (DuckDB syntax)

SELECT 
    Borough,
    "Crime type",
    COUNT(*) AS total_crimes,
    RANK() OVER (PARTITION BY Borough ORDER BY COUNT(*) DESC) AS rank
FROM crimes
GROUP BY Borough, "Crime type"
QUALIFY rank <= 5
ORDER BY Borough, rank;
