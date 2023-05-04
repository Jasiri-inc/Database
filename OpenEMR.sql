-- Create OpenEMR database
CREATE DATABASE OpenEMR;
USE OpenEMR;

-- Create Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(255),
    Gender ENUM('Male', 'Female'),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

-- Insert sample data
INSERT INTO Patient (PatientID, PatientName, Gender, DateOfBirth, Address, PhoneNumber, Email)
VALUES
    (1, 'John Doe', 'Male', '1985-01-01', '123 Main St, Nairobi', '0712345678', 'johndoe@example.com'),
    (2, 'Jane Doe', 'Female', '1990-05-15', '456 Park Ave, Mombasa', '0723456789', 'janedoe@example.com'),
    (3, 'Peter Mwangi', 'Male', '1978-12-31', '789 1st Ave, Kisumu', '0734567890', 'pmwangi@example.com'),
    (4, 'Faith Wangari', 'Female', '2000-03-25', '321 2nd St, Nakuru', '0745678901', 'fwangari@example.com'),
    (5, 'Andrew Njoroge', 'Male', '1995-07-12', '654 3rd Ave, Eldoret', '0756789012', 'anjoroge@example.com');

-- Create Visit table
CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    VisitDate DATE,
    DoctorName VARCHAR(255),
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    CONSTRAINT FK_PatientVisit FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Insert sample data
INSERT INTO Visit (VisitID, PatientID, VisitDate, DoctorName, Diagnosis, Prescription)
VALUES
    (1, 1, '2022-04-01', 'Dr. Kimani', 'Fever', 'Paracetamol'),
    (2, 2, '2022-04-02', 'Dr. Ali', 'Malaria', 'Coartem'),
    (3, 3, '2022-04-03', 'Dr. Kibet', 'Typhoid', 'Ciprofloxacin'),
    (4, 4, '2022-04-04', 'Dr. Wang', 'Headache', 'Aspirin'),
    (5, 5, '2022-04-05', 'Dr. Patel', 'Flu', 'Amoxicillin');

