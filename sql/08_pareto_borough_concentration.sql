-- Query 8: Borough Crime Concentration (Pareto Analysis)
-- Shows each borough's share of total London crime and cumulative percentage
-- Demonstrates that ~12 boroughs account for 50% of all London crime

SELECT
    Borough,
    total_crimes,
    ROUND(total_crimes * 100.0 / SUM(total_crimes) OVER (), 2) AS pct_of_london,
    ROUND(SUM(total_crimes) OVER (ORDER BY total_crimes DESC) * 100.0 / 
          SUM(total_crimes) OVER (), 2) AS cumulative_pct
FROM (
    SELECT Borough, COUNT(*) AS total_crimes
    FROM crimes
    GROUP BY Borough
)
ORDER BY total_crimes DESC;
