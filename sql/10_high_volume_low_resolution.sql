-- Query 10: Highest Volume, Lowest Resolution per Borough
-- Identifies crime types that simultaneously rank in the top 3 by volume
-- and bottom 3 by resolution rate within each borough
-- Highlights the highest-burden, lowest-solvability crimes per borough

SELECT
    Borough,
    "Crime type",
    total_crimes,
    resolution_rate_pct,
    RANK() OVER (PARTITION BY Borough ORDER BY total_crimes DESC) AS volume_rank,
    RANK() OVER (PARTITION BY Borough ORDER BY resolution_rate_pct ASC) AS worst_resolution_rank
FROM (
    SELECT
        Borough,
        "Crime type",
        COUNT(*) AS total_crimes,
        ROUND(SUM(CASE WHEN "Last outcome category" NOT IN (
            'Investigation complete; no suspect identified',
            'Unable to prosecute suspect',
            'Not recorded'
        ) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS resolution_rate_pct
    FROM crimes
    GROUP BY Borough, "Crime type"
)
QUALIFY volume_rank <= 3 AND worst_resolution_rank <= 3
ORDER BY Borough, total_crimes DESC;
