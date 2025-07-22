# Healthcare-Management-Data-Analysis-using-SQL

# 🏥 Healthcare Management Data Analysis using SQL

This project involves performing detailed SQL-based analysis on a simulated **Healthcare Management System** database. The goal is to extract valuable insights from patient records, doctor schedules, appointment history, billing status, and prescription trends to support administrative, clinical, and operational decision-making.

---

## 📁 Database Structure

**Database Name:** `healthcare`  
**Tables Involved:**
- `patients` – Basic details about patients
- `doctors` – Information about doctors and their specialties
- `appointments` – Records of patient-doctor appointments
- `billing` – Payment and billing records
- `prescriptions` – Medications prescribed per appointment

---

## 📊 Key Analysis Performed

### 🧑‍⚕️ Patients & Appointments
- View all patients and their appointments
- Patients with recent (last 30 days) appointments
- Patients with no appointments
- Latest appointment per patient
- Appointment trends by date, month, year

### 🧾 Billing Insights
- Total billed vs. total paid
- Average billing by patient
- Unpaid bills and pending billing
- Payment status over time
- Billing by doctor

### 💊 Prescription Analysis
- Most frequently prescribed medications
- Total dosage analysis
- Prescriptions linked to unpaid appointments

### 🩺 Doctor Metrics
- Total appointments per doctor
- Appointments by specialty
- Doctor-wise billing totals
- Appointments without billing

### 📈 Trend & Performance Tracking
- Day-wise appointment counts
- Monthly/yearly appointment patterns
- Appointment reasons ranked by frequency
- Correlation between billing and appointment frequency

---

## 💡 Sample Query Topics

- JOINs and aggregation
- Subqueries for totals
- Date functions (e.g., `CURDATE()`, `DATE_FORMAT()`)
- NULL filtering for missing data
- Sorting, filtering, and grouping

- ## 📊 Sample Query Visualization

Here's a snapshot of one of the sample `SELECT` queries you've implemented:

![Example SELECT Query Screenshot](https://raw.githubusercontent.com/samiksha29-patil/Healthcare-Management-Data-Analysis-using-SQL/main/01_Select_Query.jpeg)

![Select Query 2](https://raw.githubusercontent.com/samiksha29-patil/Healthcare-Management-Data-Analysis-using-SQL/main/02_Select_Query.jpeg)

### 📄 Example: Patient Appointment Query Output

![Select Query 3](https://raw.githubusercontent.com/samiksha29-patil/Healthcare-Management-Data-Analysis-using-SQL/main/03_Select_Query.jpeg)

### 🧾 Example: Billing Information Query Result

![Select Query 4](https://raw.githubusercontent.com/samiksha29-patil/Healthcare-Management-Data-Analysis-using-SQL/main/04_Select_Query.jpeg)

### 📌 Example: Appointments With Each Day

![Select Query 5](https://raw.githubusercontent.com/samiksha29-patil/Healthcare-Management-Data-Analysis-using-SQL/main/05_Select_Query.jpeg)

---

## 🚀 How to Use

1. Clone this repository.
2. Import the database schema into your SQL environment (MySQL recommended).
3. Run the SQL queries from the script file to analyze the data.
4. Use results for reports, dashboards, or further integrations.

---

## 🛠 Tech Stack

- **SQL** (MySQL / MariaDB)
- (Optional) MySQL Workbench, DBeaver, or phpMyAdmin
- Future add-ons: Tableau, Power BI, Python (Pandas + SQLAlchemy)

---

## 📌 Future Enhancements

- Create a front-end dashboard (e.g., Streamlit or Flask)
- Integrate with real-time patient management systems
- Predict billing trends using ML models
- Visualize key KPIs with BI tools

---

## 👤 Author

**[Your Name]**  
Data Analyst | SQL Enthusiast | Passionate about Healthcare Analytics

---

## 📜 License

This project is licensed under the **MIT License** — feel free to use and build upon it.
