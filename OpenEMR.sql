-- Drop Database if exists
DROP DATABASE IF EXISTS OpenEMR;

-- Create OpenEMR database
CREATE DATABASE OpenEMR;
USE OpenEMR;

-- Create Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(255),
    Gender ENUM('Male', 'Female'),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
) AUTO_INCREMENT=1000;

-- Insert sample data
INSERT INTO Patient (PatientName, Gender, DateOfBirth, Address, PhoneNumber, Email)
VALUES
    ('John Doe', 'Male', '1985-01-01', '123 Main St, Nairobi', '0712345678', 'johndoe@example.com'),
    ('Jane Doe', 'Female', '1990-05-15', '456 Park Ave, Mombasa', '0723456789', 'janedoe@example.com'),
    ('Peter Mwangi', 'Male', '1978-12-31', '789 1st Ave, Kisumu', '0734567890', 'pmwangi@example.com'),
    ('Faith Wangari', 'Female', '2000-03-25', '321 2nd St, Nakuru', '0745678901', 'fwangari@example.com'),
    ('Andrew Njoroge', 'Male', '1995-07-12', '654 3rd Ave, Eldoret', '0756789012', 'anjoroge@example.com');

-- Create Visit table
CREATE TABLE Visit (
    VisitID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PatientID INT,
    VisitDate DATE,
    DoctorName VARCHAR(255),
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    CONSTRAINT FK_PatientVisit FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
)AUTO_INCREMENT=1000;

-- Insert sample data
INSERT INTO Visit (PatientID, VisitDate, DoctorName, Diagnosis, Prescription)
VALUES
    ((SELECT PatientID FROM Patient WHERE PatientName = 'John Doe'), '2022-04-01', 'Dr. Kimani', 'Fever', 'Paracetamol'),
    ((SELECT PatientID FROM Patient WHERE PatientName = 'Jane Doe'), '2022-04-02', 'Dr. Ali', 'Malaria', 'Coartem'),
    ((SELECT PatientID FROM Patient WHERE PatientName = 'Peter MWangi'), '2022-04-03', 'Dr. Kibet', 'Typhoid', 'Ciprofloxacin'),
    ((SELECT PatientID FROM Patient WHERE PatientName = 'Faith Wangari'), '2022-04-04', 'Dr. Wang', 'Headache', 'Aspirin'),
    ((SELECT PatientID FROM Patient WHERE PatientName = 'Andrew Njoroge'), '2022-04-05', 'Dr. Patel', 'Flu', 'Amoxicillin');

