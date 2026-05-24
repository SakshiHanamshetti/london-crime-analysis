-- Query 9: Month over Month Change Using LAG
-- LAG() retrieves the previous month's value for comparison
-- First month returns NULL for prev_month as expected

SELECT
    Month,
    monthly_crimes,
    LAG(monthly_crimes) OVER (ORDER BY Month) AS prev_month_crimes,
    monthly_crimes - LAG(monthly_crimes) OVER (ORDER BY Month) AS absolute_change,
    ROUND(
        (monthly_crimes - LAG(monthly_crimes) OVER (ORDER BY Month)) * 100.0 /
        LAG(monthly_crimes) OVER (ORDER BY Month), 2
    ) AS pct_change
FROM (
    SELECT Month, COUNT(*) AS monthly_crimes
    FROM crimes
    GROUP BY Month
)
ORDER BY Month;
