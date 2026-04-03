QR Code Generator and QR Code Scanning Attendance System
Project Overview

The QR Code Generator and QR Code Scanning Attendance System is a web-based application developed to automate the attendance process using QR codes. The system helps educational institutions efficiently manage student attendance, assignments, leave applications, and performance records.

Traditional attendance methods are time-consuming and prone to errors. This project solves that problem by providing a fast, secure, and accurate QR-based attendance system with real-time data management.

Key Features

Student Panel
Unique QR code generated for each student
Scan QR code to mark attendance
View attendance records
Submit assignments online
Apply for leave digitally
View academic performance and reports
Get notifications for assignments and updates

Teacher Panel
Mark attendance using QR code scanner
Add and manage student details
Approve or reject leave applications
Generate attendance reports
View student performance reports
Provide feedback
Manage assignments

Parent Panel
Monitor student attendance in real time
Receive notifications for absence or late attendance
View student academic performance
Submit leave requests for child
Communicate with teachers
Manage profile information

Objectives
Automate attendance process
Reduce manual work
Save time for teachers and students
Improve accuracy of attendance records
Provide real-time attendance tracking
Improve communication between students, teachers, and parents
Store data securely in database

Scope of Project
Designed for schools, colleges, and universities
Fast QR-based attendance marking system
Digital leave management system
Performance and attendance report generation
Parent-teacher communication support
Secure data storage

Advantages
Eliminates manual attendance process
Reduces human errors
Saves time using QR scanning
Prevents fake attendance marking
Secure and encrypted QR codes
Accurate record keeping
Easy report generation
Improves communication between teachers and parents

Technologies Used
Frontend
HTML
CSS
JavaScript
Backend
Java (Servlets, JSP)
Database
MySQL

Tools & Software
Eclipse IDE
Apache Tomcat 9
MySQL Workbench
JDK 8
System Architecture

The system follows a 3-tier architecture:

Presentation Layer (Frontend)

User interface developed using HTML, CSS, and JavaScript.

Application Layer (Backend)

Java Servlets handle application logic, request processing, and communication between frontend and database.

Database Layer

MySQL database stores student details, attendance records, assignments, leave data, and user information.

Modules
QR Code Module
Generates unique QR code for each student
QR code linked with student ID
Secure QR code validation

Attendance Module
Scan QR code to mark attendance
Automatic attendance record storage
Prevent duplicate attendance

Assignment Module
Students submit assignments online
Teachers upload assignments
Notification for deadlines

Leave Management Module
Students apply leave online
Teachers approve or reject leave request
Leave status tracking

Report Module
Attendance report generation
Performance report generation
Summary reports
Database Information

Database Name: student-system

Tables included:
students
teachers
parents
attendance
assignments
leave_requests

Installation and Setup
Requirements
JDK 8
Eclipse IDE
Apache Tomcat 9
MySQL Workbench
Steps to Run Project
Import project in Eclipse IDE
Configure Apache Tomcat 9 server
Create database in MySQL Workbench
Import database tables
Update database username and password in project files

Run project on Tomcat server
Open browser and run:
http://localhost:8080/project-name

Future Enhancements
Mobile application support
Face recognition attendance system
Cloud database integration
Email and SMS notification system
Advanced dashboard with analytics
