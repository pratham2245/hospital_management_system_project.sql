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

<img width="1237" height="256" alt="Screenshot 2025-09-01 132205" src="https://github.com/user-attachments/assets/61b3bed0-50ac-42d1-a86f-01eed7a4ff86" />


2. Show the doctors who work in the “Central Hospital”.

<img width="278" height="139" alt="Screenshot 2025-09-01 132235" src="https://github.com/user-attachments/assets/f4222ed8-cdc9-4c6d-86ee-d35d73664a38" />


3. List the names and contact numbers of all patients registered in 2022.

<img width="314" height="384" alt="Screenshot 2025-09-01 132307" src="https://github.com/user-attachments/assets/66222247-823b-4822-a471-8de318afabd2" />

  
4. Find all bills where the payment status is “Pending”.
<img width="73" height="580" alt="Screenshot 2025-09-02 131226" src="https://github.com/user-attachments/assets/96b4ef38-7903-42ea-acd4-9dc40ec342fe" />
<img width="80" height="579" alt="Screenshot 2025-09-02 131255" src="https://github.com/user-attachments/assets/8a222943-e621-412e-91ec-7bf4ec9e4501" />
<img width="78" height="337" alt="Screenshot 2025-09-02 131327" src="https://github.com/user-attachments/assets/3f13e3a6-e451-4ff6-9abf-9841904629d4" />


5. Show the average treatment cost per treatment type. generate 1 line insights for this questions

<img width="239" height="143" alt="Screenshot 2025-09-01 132422" src="https://github.com/user-attachments/assets/52d1268c-e30b-4aee-9a3f-e8daf2507f12" />

<img width="702" height="637" alt="Average Cost by Treatment Type" src="https://github.com/user-attachments/assets/71e21228-3c48-4158-ad92-481c917b7f14" />


6. What is the proportion of patients using each insurance provider, segmented by gender?

<img width="368" height="145" alt="Screenshot 2025-09-01 132457" src="https://github.com/user-attachments/assets/9dd498d5-6268-4437-b5a5-1b1714aebb14" />

<img width="702" height="637" alt="Proportion by Gender and Insurance Provider" src="https://github.com/user-attachments/assets/6bbd73dd-5357-466b-ab3a-d86f777c034f" />


7. What is the monthly trend of new patient registrations?.
<img width="239" height="364" alt="Screenshot 2025-09-02 131500" src="https://github.com/user-attachments/assets/3da55dc7-4743-4614-be3d-632460d68c8f" />
<img width="224" height="220" alt="Screenshot 2025-09-02 131523" src="https://github.com/user-attachments/assets/83b649df-9e46-479b-af2e-e40f889bdb38" />

<img width="767" height="637" alt="Monthly New Patient Registrations Trend" src="https://github.com/user-attachments/assets/1a77c687-b92c-4c6f-b2cf-ed36dc27b4d7" />

8. Identify top 5 doctor who has treated the highest number of unique patients.

<img width="368" height="145" alt="Screenshot 2025-09-01 132457" src="https://github.com/user-attachments/assets/a410ed88-a8fa-451e-91c5-ab2c4b5f034d" />

<img width="767" height="637" alt="Top Doctors by Unique Patients" src="https://github.com/user-attachments/assets/a6cb390a-4b97-47db-b552-f82406143069" />


9. Rank doctors based on the total revenue generated from their patients (using RANK() function).

<img width="407" height="242" alt="Screenshot 2025-09-01 132516" src="https://github.com/user-attachments/assets/1f4c22f5-fd72-4e9a-b0f4-03dad4a2c6ff" />

<img width="702" height="637" alt="Doctor Revenue Ranking" src="https://github.com/user-attachments/assets/21aac3f7-da1a-4d63-9715-672518675c15" />


10. Calculate month-over-month revenue growth from billing data. generate 1 line insights for this.

<img width="400" height="285" alt="Screenshot 2025-09-01 132410" src="https://github.com/user-attachments/assets/81c154f2-6199-41ed-9c56-5517cfa7d0c3" />

<img width="702" height="637" alt="Month-over-month Revenue Growth" src="https://github.com/user-attachments/assets/1d04001e-0fe7-4b47-8a99-b51a7b379d35" />



