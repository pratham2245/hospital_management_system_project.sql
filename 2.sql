-- Show the doctors who work in the “Central Hospital”.
SELECT 
    doctor_id, first_name, last_name
FROM
    doctors
WHERE
    hospital_branch = 'Central Hospital';