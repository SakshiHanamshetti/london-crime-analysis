-- Query 4: Resolution Rate by Crime Type
-- Calculates what percentage of each crime type results in any legal outcome
-- Excludes the three main non-resolution categories from the resolved count

SELECT 
    "Crime type",
    COUNT(*) AS total_crimes,
    SUM(CASE WHEN "Last outcome category" NOT IN (
        'Investigation complete; no suspect identified',
        'Unable to prosecute suspect',
        'Not recorded'
    ) THEN 1 ELSE 0 END) AS resolved_crimes,
    ROUND(
        SUM(CASE WHEN "Last outcome category" NOT IN (
            'Investigation complete; no suspect identified',
            'Unable to prosecute suspect',
            'Not recorded'
        ) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS resolution_rate_pct
FROM crimes
GROUP BY "Crime type"
ORDER BY resolution_rate_pct DESC;
