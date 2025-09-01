-- Identify top 5 doctor who has treated the highest number of unique patients
SELECT 
    d.first_name,
    d.last_name,
    d.doctor_id,
    COUNT(DISTINCT a.patient_id) AS total_patients
FROM
    doctors d
        JOIN
    appointment a ON d.doctor_id = a.doctor_id
GROUP BY d.first_name , d.last_name , d.doctor_id
ORDER BY total_patients DESC
LIMIT 5;