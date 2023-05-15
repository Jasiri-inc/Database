#!/usr/bin/python3

# patient_id = input("Enter the PatientID: ")
# patient_name = input('patient name: ')
# gender = input("Enter patient's gender: ")
# dob = input("enter patient's dob: ")
# address = input('Enter patients primary address: ')
# num = input('Enter telephone number: ')
# email = input("enter patient's email: ")

mysql_extract = ('''
    SELECT PatientID, PatientName, Gender, DateOfBirth,Address, PhoneNumber, Email
    FROM Patient
''')

mysql_insert = ('''
  INSERT INTO Patient (PatientID, PatientName, Gender, DateOfBirth,Address, PhoneNumber, Email)
  VALUES (%s, %s, %s, %s, %s, %s, %s)  
''')

# visit_id = input("Enter the Visit ID: ")
# patient_id = input("Enter the PatientID: ")
# visit_date = input("enter patient's last visit date: ")
# doctor_name = input('doctor name: ')
# diagnosis = input('Enter patients diagnosis: ')
# prescription = input("enter patient's prescription: ")


mysql_extract_2 = ('''
    SELECT VisitID, PatientID, VisitDate, DoctorName, Diagnosis, Prescription
    FROM Visit
''')

mysql_insert_2 = ('''
  INSERT INTO Visit (VisitID, PatientID, VisitDate, DoctorName, Diagnosis, Prescription)
  VALUES (%s, %s, %s, %s, %s, %s)
''')


# mysql_extract = ('''
#     SELECT mysql_column_1, mysql_column_2, mysql_column_3
#     FROM mysql_table_2
# ''')

# mysql_insert = ('''
#   INSERT INTO table_2 (column_1, column_2, column_3)
#   VALUES (?, ?, ?)
# ''')


class SqlQuery:
    def __init__(self, extract_query, load_query):
        self.extract_query = extract_query
        self.load_query = load_query


mysql_query = SqlQuery(mysql_extract, mysql_insert)
mysql_query_2 = SqlQuery(mysql_extract_2, mysql_insert_2)

mysql_queries = [mysql_query, mysql_query_2]
