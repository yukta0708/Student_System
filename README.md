QR Code Generator and QR Code Scanning Attendance System
Project Description

The QR Code Generator and Attendance System is a web-based application designed to automate attendance tracking using QR codes. The system reduces manual effort, improves accuracy, and provides real-time data management for students, teachers, and parents.

This project helps educational institutions manage attendance, assignments, leave applications, and performance records efficiently.


Features
Student Panel
QR Code Generation for each student
QR Code Scanning for attendance
View results and performance reports
Submit assignments online
Apply for leave digitally
Get notifications for updates

Teacher Panel
Mark attendance using QR scanner
Add and manage student details
Approve or reject leave requests
Generate attendance reports
View parent feedback
Manage assignments

Parent Panel
Track child attendance in real time
Receive absence notifications
View academic performance
Submit leave request for child
Communicate with teachers
Manage profile details

Objectives
Automate attendance process
Reduce manual errors in attendance
Save time for teachers and students
Provide real-time attendance tracking
Improve communication between teachers, students, and parents
Store data securely using database

Scope of Project
Designed for schools, colleges, and universities
Provides fast QR-based attendance marking
Enables leave management system
Provides performance reports
Improves communication between parents and teachers

Advantages
Eliminates manual attendance process
Reduces human errors
Saves time using QR scan
Secure and encrypted QR codes
Prevents fake attendance marking
Allows parental monitoring
Provides accurate database records

Technologies Used
Frontend
HTML
CSS
JavaScript
Backend
Java (Servlets)
Database
MySQL
Tools
Eclipse IDE
Apache Tomcat 9
MySQL Workbench
JDK 8

System Architecture

The system follows a 3-tier architecture:

Presentation Layer (Frontend)
HTML, CSS, JavaScript for UI
Application Layer (Backend)
Java Servlets handle logic and requests
Database Layer
MySQL database stores student, teacher, attendance, and assignment data
Modules

QR Code Module
Generates unique QR code for each student
Links QR code with student ID
Secure QR code validation

Attendance Module
Scan QR code to mark attendance
Stores attendance data automatically
Prevents duplicate attendance entries
Assignment Module

Upload and submit assignments
Notification for deadlines
Leave Management Module
Students apply leave online
Teachers approve or reject leave
Report Module

Attendance report generation
Performance report
Summary report
Database

Database schema includes tables:

students
teachers
parents
attendance
assignments
leave_requests

Database name: student-system

Installation Steps

Install JDK 8
Install Eclipse IDE
Install Apache Tomcat 9
Install MySQL Workbench
Steps to Run Project
Import project in Eclipse
Configure Apache Tomcat 9 server
Import database in MySQL Workbench
Update database username and password in project

Run project on server
Open browser:
http://localhost:8080/project-name
Future Enhancements
Mobile app integration
Face recognition attendance
Cloud database support
SMS or Email notifications
Advanced analytics dashboard
