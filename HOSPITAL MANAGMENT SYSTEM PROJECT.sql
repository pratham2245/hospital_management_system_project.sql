CREATE DATABASE sqlproject;

CREATE TABLE doctors(
doctor_id VARCHAR(50) PRIMARY KEY NOT NULL,	
first_name	VARCHAR(50) NOT NULL,
last_name	VARCHAR(50) NOT NULL,
specialization	VARCHAR(50),
phone_number BIGINT,	
years_experience INT,
hospital_branch	VARCHAR(50),
email VARCHAR(50)
) ;

CREATE TABLE patients(
patient_id	VARCHAR(50) PRIMARY KEY NOT NULL,
first_name	VARCHAR(50) NOT NULL,
last_name	VARCHAR(50) NOT NULL,
gender	VARCHAR(10),
date_of_birth	DATE,
contact_number	BIGINT,
address VARCHAR(50),
registration_date	DATE,
insurance_provider	VARCHAR(50),
insurance_number VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE appointment(
appointment_id	VARCHAR(50) PRIMARY KEY NOT NULL,
patient_id	VARCHAR(50) NOT NULL,
doctor_id	VARCHAR(50) NOT NULL,
appointment_date DATE,	
appointment_time TIME,
reason_for_visit VARCHAR(50),
status VARCHAR(50),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatment(
treatment_id VARCHAR(50) PRIMARY KEY NOT NULL,
appointment_id	VARCHAR(50) NOT NULL,
treatment_type	VARCHAR(50),
description	VARCHAR(50),
cost DECIMAL(10,2),
treatment_date DATE,
FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);

CREATE TABLE billing(
bill_id	VARCHAR(50) PRIMARY KEY NOT NULL,
patient_id	VARCHAR(50) NOT NULL,
treatment_id VARCHAR(50) NOT NULL,
bill_date	DATE,
amount	DECIMAL(10,2),
payment_method	VARCHAR(50),
payment_status VARCHAR(50),
FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

-- QUESTIONS $$
-- 1.-- Display all patients covered by PulseSecure insurance
SELECT 
    *
FROM
    patients
WHERE
    insurance_provider = 'PulseSecure';

insights:
   PulseSecure Coverage: 10 patients are covered by PulseSecure insurance, indicating a specific segment of the patient base. 
    
  --   2.-- Show the doctors who work in the “Central Hospital”.
SELECT 
    doctor_id, first_name, last_name
FROM
    doctors
WHERE
    hospital_branch = 'Central Hospital';

insights:
   Central Hospital Staff: Central Hospital employs 4 doctors, primarily specializing in Pediatrics, with significant experience.
    
-- 3-- List the names and contact numbers of all patients registered in 2022.
SELECT 
    first_name, last_name, contact_number
FROM
    patients
WHERE
    registration_date BETWEEN '2022-01-01' AND '2022-12-31';

insights:
   2022 Patient Registrations: 17 patients registered in 2022, providing a clear view of recent patient intake and their contact information.
    
-- 4-- Find all bills where the payment status is “Pending”.
SELECT 
    bill_id
FROM
    billing
WHERE
    payment_status = 'Pending';

insights:
   Pending Bills Overview: There are 69 pending bills, highlighting a substantial number of outstanding payments across various payment methods. 
    
-- 5-- Show the average treatment cost per treatment type.
SELECT 
    treatment_type, ROUND(AVG(cost),2) AS AVG_COST
FROM
    treatment
GROUP BY treatment_type;

insights:
   Treatment Cost Analysis: MRI is the most expensive treatment type on average,
   while ECG is the least, offering clear insights into cost distribution across different medical procedures.

   
-- 6-- What is the proportion of patients using each insurance provider, segmented by gender?
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

insights:
   Insurance Provider Preference: MedCare Plus is the preferred insurance provider, especially among female patients, 
   while WellnessCorp is notably strong with male patients.

-- 7-- What is the monthly trend of new patient registrations?
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month_year,
    COUNT(*) AS patient_count
FROM patients
GROUP BY DATE_FORMAT(registration_date, '%Y-%m')
ORDER BY month_year;

insights:
   Patient Registration Volatility: New patient registrations show no clear growth trend, characterized by 
   significant monthly fluctuations and intermittent peaks.

-- 8-- Identify top 5 doctor who has treated the highest number of unique patients
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

insights:
   Top Doctor Performance: Sarah Taylor consistently leads in both the number of unique patients treated and 
   total revenue generated, highlighting her as a key asset.

-- 9-- Rank doctors based on the total revenue generated from their patients (using RANK() function)
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

insights:
   Revenue Generation Disparity: There is a clear hierarchy in revenue generation among doctors, with the top few 
   contributing disproportionately to the total revenue.

-- 10-- Calculate month-over-month revenue growth from billing data
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
chart:"Month-over-month Revenue Growth.png"

insights:
Revenue Growth Instability: The organization experiences highly unstable month-over-month revenue growth, 
   with substantial swings indicating a need for strategies to stabilize income.

