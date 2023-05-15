-- Drop Database if exists
DROP DATABASE IF EXISTS NationalDataWarehouse;

-- Create National Data Warehouse database
CREATE DATABASE NationalDataWarehouse;
USE NationalDataWarehouse;

-- Create Patient table
CREATE TABLE Patient (
PatientID INT PRIMARY KEY AUTO_INCREMENT,
PatientName VARCHAR(255),
Gender ENUM('Male', 'Female'),
DateOfBirth DATE,
Address VARCHAR(255),
PhoneNumber VARCHAR(20),
Email VARCHAR(255)
);

-- Create Hospital table
CREATE TABLE Hospital (
HospitalID INT PRIMARY KEY,
HospitalName VARCHAR(255),
Address VARCHAR(255),
PhoneNumber VARCHAR(20),
Email VARCHAR(255)
);

-- Create Visit table
CREATE TABLE Visit (
VisitID INT PRIMARY KEY,
PatientID INT,
HospitalID INT,
VisitDate DATE,
DoctorName VARCHAR(255),
Diagnosis VARCHAR(255),
Prescription VARCHAR(255),
CONSTRAINT FK_PatientVisit FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
CONSTRAINT FK_HospitalVisit FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

-- Insert sample data into Patient table
INSERT INTO Patient (PatientID, PatientName, Gender, DateOfBirth, Address, PhoneNumber, Email)
VALUES
(1, 'John Doe', 'Male', '1985-01-01', '123 Main St, Nairobi', '0712345678', 'johndoe@example.com'),
(2, 'Jane Doe', 'Female', '1990-05-15', '456 Park Ave, Mombasa', '0723456789', 'janedoe@example.com'),
(3, 'Peter Mwangi', 'Male', '1978-12-31', '789 1st Ave, Kisumu', '0734567890', 'pmwangi@example.com'),
(4, 'Faith Wangari', 'Female', '2000-03-25', '321 2nd St, Nakuru', '0745678901', 'fwangari@example.com'),
(5, 'Andrew Njoroge', 'Male', '1995-07-12', '654 3rd Ave, Eldoret', '0756789012', 'anjoroge@example.com');

-- Insert sample data into Hospital table
INSERT INTO Hospital (HospitalID, HospitalName, Address, PhoneNumber, Email)
VALUES
(1, 'Kenyatta National Hospital', 'Hospital Rd, Nairobi', '0720123456', 'info@knh.or.ke'),
(2, 'Moi Teaching and Referral Hospital', 'Nandi Rd, Eldoret', '0731234567', 'info@mtrh.or.ke'),
(3, 'Coast General Hospital', 'Mombasa - Malindi Hwy, Mombasa', '0712345678', 'info@cgh.or.ke'),
(4, 'Jaramogi Oginga Odinga Teaching and Referral Hospital', 'Bondo Rd, Kisumu', '0723456789', 'info@jootrh.or.ke'),
(5, 'Nakuru Level 5 Hospital', 'Githioro Rd, Nakuru', '0734567890', 'info@nakuruhospital.go.ke');

-- Insert sample data into Visit table
INSERT INTO Visit (VisitID, PatientID, HospitalID, VisitDate, DoctorName, Diagnosis, Prescription)
VALUES
(1, 1, 1, '2022-04-01', 'Dr. Kimani', 'Fever', 'Paracetamol'),
(2, 2, 2, '2022-04-02', 'Dr. Ali', 'Malaria', 'Coartem'),
(3, 3, 3, '2022-04-03',  'Dr. Kibet', 'Typhoid', 'Ciprofloxacin'),
(4, 4, 4, '2022-04-04', 'Dr. Wang', 'Headache', 'Aspirin'),
(5, 5, 5, '2022-04-05', 'Dr. Patel', 'Flu', 'Amoxicillin');
