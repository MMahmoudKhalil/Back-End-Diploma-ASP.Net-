CREATE DATABASE BounasDb

CREATE SCHEMA BH

CREATE TABLE BH.Patient(
    UR_Number INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(150),
    Age INT,
    Phone VARCHAR(20),
    Email VARCHAR(50),
    Medicare_Number VARCHAR(15),
)


CREATE TABLE BH.Doctors(
    Doctor_Id INT PRIMARY KEY,
    Name VARCHAR(100),
    years_of_experience INT,
    Specialty VARCHAR(50),
    Phone VARCHAR(20),
	UR_Number INT,

	 FOREIGN KEY (UR_Number) 
     REFERENCES BH.Patient(UR_Number)
)

CREATE TABLE BH.Drugs(
    Drug_Id INT PRIMARY KEY,
    Name VARCHAR(100) ,
    Strength VARCHAR(10),
)

CREATE TABLE BH.Prescriptions(
    Prescription_Id INT PRIMARY KEY,
    Date DATE ,
    Quantity INT,
)

CREATE TABLE BH.Companies(
    Company_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(150),
    Phone VARCHAR(20),
)



CREATE TABLE BH.Doctors_Prescriptions(
    Doctor_Id INT,
    Prescription_Id INT,
    PRIMARY KEY (Doctor_Id, Prescription_Id),
    FOREIGN KEY (Doctor_Id) REFERENCES BH.Doctors(Doctor_Id),
    FOREIGN KEY (Prescription_Id) REFERENCES BH.Prescriptions(Prescription_Id),
)

CREATE TABLE BH.Patient_Prescriptions(
    UR_Number INT,
    Prescription_Id INT,
    PRIMARY KEY (UR_Number, Prescription_Id),
    FOREIGN KEY (UR_Number) REFERENCES BH.Patient(UR_Number),
    FOREIGN KEY (Prescription_Id) REFERENCES BH.Prescriptions(Prescription_Id),
)

CREATE TABLE BH.Drugs_Prescriptions(
    Drug_Id INT,
    Prescription_Id INT,
    PRIMARY KEY (Drug_Id, Prescription_Id),
    FOREIGN KEY (Drug_Id) REFERENCES BH.Drugs(Drug_Id),
    FOREIGN KEY (Prescription_Id) REFERENCES BH.Prescriptions(Prescription_Id),
)

CREATE TABLE BH.Drugs_Companies(
    Drug_Id INT,
    Company_ID INT,
    PRIMARY KEY (Drug_Id, Company_ID),
    FOREIGN KEY (Drug_Id) REFERENCES BH.Drugs(Drug_Id) ON DELETE CASCADE,
    FOREIGN KEY (Company_ID) REFERENCES BH.Companies(Company_ID) ON DELETE CASCADE,
)