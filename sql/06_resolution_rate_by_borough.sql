-- Query 6: Resolution Rate by Borough
-- Calculates what percentage of crimes in each borough result in any legal outcome

SELECT
    Borough,
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
GROUP BY Borough
ORDER BY resolution_rate_pct DESC;
