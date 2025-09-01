-- Rank doctors based on the total revenue generated from their patients (using RANK() function)
SELECT 
    d.first_name,
    d.last_name,
    SUM(b.amount) AS total_revenue,
    RANK() OVER (ORDER BY SUM(b.amount) DESC) AS revenue_rank
FROM billing b
JOIN treatment t
    ON b.treatment_id = t.treatment_id
JOIN appointment a
    ON t.appointment_id = a.appointment_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY d.first_name, d.last_name
ORDER BY revenue_rank;
