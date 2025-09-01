-- What is the proportion of patients using each insurance provider, segmented by gender?
SELECT 
    p.gender,
    p.insurance_provider,
    COUNT(*) * 1.0 / gender_totals.total_gender_count AS proportion
FROM patients p
JOIN (
    SELECT gender, COUNT(*) AS total_gender_count
    FROM patients
    GROUP BY gender
) gender_totals
ON p.gender = gender_totals.gender
GROUP BY p.gender, p.insurance_provider, gender_totals.total_gender_count;
