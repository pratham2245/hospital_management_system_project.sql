# hospital_management_system_project.sql

  <img width="602" height="452" alt="image" src="https://github.com/user-attachments/assets/dad633d5-ad21-4915-a4b8-3e3fb303e147" />




# Objective 
The objective of this project is to design and implement a Hospital Management System database that efficiently manages hospital operations, including patient records, doctor details, appointments, treatments, and billing. This SQL-based project ensures data consistency, quick retrieval of information, and streamlined healthcare management processes, providing a foundation for scalable hospital administration solutions.

# Dataset Overview
 * doctors_doctors_0.csv

Contains 10 rows of data about doctors.
Includes information such as doctor ID, first name, last name, specialization (Dermatology, Oncology, Pediatrics), phone number, years of experience, hospital branch, and email address.

* appointments_appointments_0.csv

Comprises 200 rows detailing patient appointments.
Key columns include appointment ID, patient ID, doctor ID, appointment date and time, reason for visit (Checkup, Consultation, Emergency, Follow-up, Therapy), and appointment status (Cancelled, Completed, No-show, Scheduled).

* billing_billing_0.csv

Features 200 rows of billing records.
Provides data on bill ID, patient ID, treatment ID, bill date, amount, payment method (Cash, Credit Card, Insurance), and payment status (Failed, Paid, Pending).

* patients_patients_0.csv

Contains 50 rows of patient demographic and contact information.
Includes patient ID, first name, last name, gender, date of birth, contact number, address, registration date, insurance provider, insurance number, and email address.

* treatments_treatments_0.csv

Records 200 rows of treatment details.
Columns cover treatment ID, associated appointment ID, treatment type (Chemotherapy, ECG, MRI, Physiotherapy, X-Ray), description, cost, and treatment date

# Exploratory Data Analysis (EDA) for the follwing questions:
1. Display all patients covered by PulseSecure insurance.
2.Show the doctors who work in the “Central Hospital”.
3. List the names and contact numbers of all patients registered in 2022.
4. Find all bills where the payment status is “Pending”.
5. Show the average treatment cost per treatment type. generate 1 line insights for this questions
6. What is the proportion of patients using each insurance provider, segmented by gender?
7. What is the monthly trend of new patient registrations?.
8. Identify top 5 doctor who has treated the highest number of unique patients.
9. Rank doctors based on the total revenue generated from their patients (using RANK() function).
10. Calculate month-over-month revenue growth from billing data. generate 1 line insights for this.


