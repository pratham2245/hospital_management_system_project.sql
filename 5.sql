-- Calculate month-over-month revenue growth from billing data
WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(bill_date, '%Y-%m') AS month,
        SUM(amount) AS total_monthly_revenue
    FROM billing
    GROUP BY DATE_FORMAT(bill_date, '%Y-%m')
    ORDER BY month
),
growth AS (
    SELECT 
        month,
        total_monthly_revenue,
        LAG(total_monthly_revenue) OVER (ORDER BY month) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT 
    month,
    total_monthly_revenue,
    ROUND(
        ( (total_monthly_revenue - prev_month_revenue) / prev_month_revenue ) * 100,
        2
    ) AS growth_percentage
FROM growth;
