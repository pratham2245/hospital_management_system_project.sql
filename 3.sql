-- List the names and contact numbers of all patients registered in 2022.
SELECT 
    first_name, last_name, contact_number
FROM
    patients
WHERE
    registration_date BETWEEN '2022-01-01' AND '2022-12-31';