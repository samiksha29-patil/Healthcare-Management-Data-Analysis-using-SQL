-- CREATE DATABASE

create database healthcare;

use healthcare;

-- RETRIEVE ALL TABLE INFORMATION

select * from patients;

select * from appointments;

select * from billing;

select * from doctors;

select * from prescriptions;

-- GET ALL APPOINTMENTS FOR A SPECIFIC PATIENT

select * from appointments
where patient_id=1;

-- RETRIEVE ALL PRESCRIPTIONS FOR A SPECIFIC APPOINTMENT

select * from prescriptions
where appointment_id=1;

-- GET BILLING INFORMATION FOR A SPECIFIC APPOINTMENT

select * from billing 
where appointment_id=2;

-- LIST ALL APPOINTMENTS WITH BILLING STATUS

select a.appointment_id,p.first_name as patient_first_name,p.last_name as patient_last_name,
d.first_name as doctor_first_name,d.last_name as doctor_last_name,
b.amount,b.payment_date,b.status
from appointments a
join patients p on a.patient_id=p.patient_id
join doctors d on a.doctor_id=d.doctor_id
join billing b on a.appointment_id=b.appointment_id;

-- FIND ALL PAID BILLING

select * from billing
where status='paid';

-- CALCULATE TOTAL AMOUNT BILLED AND TOTAL PAID AMOUNT

select 
(select sum(amount)from billing)as total_billed,
(select sum(amount) from billing where status='paid')as total_paid;

-- GET THE NUMBER OF APPOINTMENTS BY SPECIALITY

select d.specialty,count(a.appointment_id)as number_of_appointments
from appointments a
join doctors d on a.doctor_id=d.doctor_id
group by d.specialty;

-- FIND THE MOST COMMON REASON FOR APPOINTMENTS

select reason,
count(*)as count
from appointments
group by reason
order by count desc;

-- LIST PATIENTS WITH THIER LATEST APPOINTMENT DATE

select p.patient_id,p.first_name,p.last_name,max(a.appointment_date)as lastest_appointment
from patients p
join appointments a on p.patient_id=a.patient_id
group by p.patient_id,p.first_name,p.last_name;

-- LIST ALL DOCTORS AND THE NUMBER OF APPOINTMENTS THEY HAD

select d.doctor_id,d.first_name,d.last_name,count(a.appointment_date)as number_of_appointments
from doctors d
join appointments a on d.doctor_id=a.doctor_id
group by d.doctor_id,d.first_name,d.last_name order by number_of_appointments desc;

-- RETRIEVE PATIENTS WHO HAD APPOINTMENTS IN LAST 30 DAYS

Select distinct p.*
from patients p
join appointments a on p.patient_id=a.patient_id
where a.appointment_date>=curdate()-interval 30 day;

-- FIND PRESCRIPTIONS ASSOCIATED WITH APPOIENTMENTS THAT ARE PENDING PAYMENT

select pr.prescription_id,pr.medication,pr.dosage,pr.instructions 
from prescriptions pr
join appointments a on pr.appointment_id=a.appointment_id
join billing b on pr.appointment_id=b.appointment_id
where b.status='pending' order by pr.dosage desc;

-- DETAILED VIEW OF EACH PATIENT,INCLUDING THEIR APPOINTMENT AND BILLING STATUS

select p.patient_id,p.first_name,p.last_name,p.dob,p.gender,p.address,
p.phone_number,
a.appointment_id,a.appointment_date,a.reason,
b.amount,b.payment_date,b.status as billing_status 
from patients p 
left join appointments a on p.patient_id=a.patient_id 
left join billing b on a.appointment_id=b.appointment_id 
order by p.patient_id,a.appointment_date;

-- ANALYSE PATIENT DEMOGRAPHICS

select gender,count(*) as count
from patients
group by gender;

-- ANALYSE THE TREND OF APPOINTMENTS OVER MONTHS OR YEARS

select date_format(appointment_date,'%Y-%m')as month,count(*)as number_of_appointments from appointments
group by month
order by month;
 
 -- YEARLY TREND
 
select year(appointment_date)as year,count(*)as number_of_appointment 
from appointments
group by year
order by year;

-- IDENTIFY THE MOST FREQUENTLY PRESCRIBED MEDICATIONS AND THERE AND THEIR TOTAL DOSAGE

select medication,count(*)as frequency,sum(cast(substring_index(dosage,' ',1)as unsigned))as total_dosage
from prescriptions
group by medication
order by frequency desc;

-- AVERAGE BILLING AMOUNT BY NUMBER OF APPOINTMENTS

select p.patient_id,count(a.appointment_id)as appointment_count,
avg(b.amount)as avg_billing_amount
from patients p
left join appointments a on p.patient_id=a.patient_id
left join billing b on a.appointment_id=b.appointment_id
group by p.patient_id;

-- ANALYZE THE CORRELATION BETWEEN APPOINTMENT FREQUENCY AND BILLING STATUS

select p.patient_id,p.first_name,p.last_name,sum(b.amount)as total_billed
from patients p
join appointments a on p.patient_id=a.patient_id
join billing b on a.appointment_id=b.appointment_id
group by p.patient_id,p.first_name,p.last_name
order by total_billed desc
limit 10;

-- PAYMENT STATUS OVER TIME

select date_format(payment_date,'%Y-%m')as month,status,count(*)
as count
from billing
group by month,status
order by month,status;

-- UNPAID BILLS ANALYSIS

select p.patient_id,p.first_name,p.last_name,sum(b.amount)as total_unpaid
from patients p
join appointments a on p.patient_id=a.patient_id
join billing b on a.appointment_id=b.appointment_id
where b.status='pending'
group by p.patient_id,p.first_name,p.last_name
order by total_unpaid desc;

-- DOCTOR PERFORMANCE METRICS

select d.doctor_id,d.first_name,d.last_name,count(a.appointment_id)as
number_of_appointments
from doctors d
left join appointments a on d.doctor_id=a.doctor_id
group by d.doctor_id,d.first_name,d.last_name;

-- DAY WISE APPOINTMENT COUNTS

select appointment_date,count(*) as appointment_count
from appointments
group by appointment_date
order by appointment_count;

-- FIND PATIENTS WITH MISSING APPOINTMENTS

select p.patient_id,p.first_name,p.last_name
from patients p
left join
appointments a on p.patient_id=a.patient_id
where a.appointment_id is null;


-- FIND APPOINTMENTS WITHOUT BILLING RECORDS

select a.appointment_id,a.patient_id,doctor_id,appointment_date
from appointments a
left join billing b on a.appointment_id=b.appointment_id
where b.billing_id is null;

-- FIND ALL APPOINTMENTS FOR DOCTOR WITH ID 1

select a.appointment_id,p.first_name as patient_first_name,p.last_name as patient_last_name,a.appointment_date,a.reason
from appointments a 
join patients p on a.patient_id=p.patient_id
where a.doctor_id=1;

-- ALL PRESCRIPTIONS WITH PAYMENT STATUS AS PENDING

select p.medication,p.dosage,p.instructions,b.amount,b.payment_date,b.status
from prescriptions p
join appointments a on p.appointment_id=a.appointment_id
join billing b on a.appointment_id=b.appointment_id
where b.status='pending';

-- LIST ALL PATIENTS WHO HAD APPOINTMENTS IN AUGUST

select distinct p.first_name,p.last_name,p.dob,p.gender,a.appointment_date
from patients p
join appointments a on p.patient_id=a.patient_id
where date_format(a.appointment_date,'%Y-%m')='2024-08';

-- LIST ALL DOCTORS AND THIER APPOINTMENTS IN AUGUST TILL TODAY

select d.first_name,d.last_name,a.appointment_date,p.first_name as 
patient_first_name,p.last_name as patient_last_name
from doctors d
join appointments a on d.doctor_id=a.doctor_id
join patients p on a.patient_id=p.patient_id
where a.appointment_date between '2024-08-01' and '2024-08-10';

-- GET TOTAL AMOUNT BILLED PER DOCTOR

select d.first_name,d.last_name,d.specialty,sum(b.amount)as total_billed
from doctors d
join appointments a on d.doctor_id=a.doctor_id
join billing b on a.appointment_id=b.appointment_id
group by d.first_name,d.last_name,d.specialty
order by total_billed desc;