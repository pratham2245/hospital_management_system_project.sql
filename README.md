# hospital_management_system_project.sql

<img width="942" height="495" alt="image" src="https://github.com/user-attachments/assets/0be3b970-2818-4bde-b42b-826f0479a72e" />

# Objective 
The objective of this project is to design and implement a Hospital Management System database that efficiently manages hospital operations, including patient records, doctor details, appointments, treatments, and billing. This SQL-based project ensures data consistency, quick retrieval of information, and streamlined healthcare management processes, providing a foundation for scalable hospital administration solutions.

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
    
  --   2.-- Show the doctors who work in the “Central Hospital”.
SELECT 
    doctor_id, first_name, last_name
FROM
    doctors
WHERE
    hospital_branch = 'Central Hospital';
    
-- 3-- List the names and contact numbers of all patients registered in 2022.
SELECT 
    first_name, last_name, contact_number
FROM
    patients
WHERE
    registration_date BETWEEN '2022-01-01' AND '2022-12-31';
    
-- 4-- Find all bills where the payment status is “Pending”.
SELECT 
    bill_id
FROM
    billing
WHERE
    payment_status = 'Pending';
    
-- 5-- Show the average treatment cost per treatment type.
SELECT 
    treatment_type, ROUND(AVG(cost),2) AS AVG_COST
FROM
    treatment
GROUP BY treatment_type;

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

-- 7-- What is the monthly trend of new patient registrations?
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month_year,
    COUNT(*) AS patient_count
FROM patients
GROUP BY DATE_FORMAT(registration_date, '%Y-%m')
ORDER BY month_year;

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

