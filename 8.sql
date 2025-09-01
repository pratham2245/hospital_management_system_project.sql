-- What is the monthly trend of new patient registrations?
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month_year,
    COUNT(*) AS patient_count
FROM patients
GROUP BY DATE_FORMAT(registration_date, '%Y-%m')
ORDER BY month_year;
