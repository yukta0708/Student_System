<%@page import="java.util.*" %>
<%@page import="com.entity.AttendanceReport" %>
<%@page import="com.DAO.AttendanceReportDAO" %>
<%@page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Report</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            margin: 10px;
            padding: 10px;
            background-color: green;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h2>Attendance Report</h2>
<a class="btn" href="downloadAttendanceReport">Download PDF</a>
<table>
    <tr>
        <th>Student Name</th>
        <th>Total Days</th>
        <th>Present Days</th>
        <th>Attendance %</th>
        <th>Grade</th>
    </tr>
    <%
        AttendanceReportDAO dao = new AttendanceReportDAO(DBConnect.getConnection());
        List<AttendanceReport> reportList = dao.getAttendanceReport();
        for (AttendanceReport ar : reportList) {
    %>
    <tr>
        <td><%= ar.getStudentName() %></td>
        <td><%= ar.getTotalDays() %></td>
        <td><%= ar.getPresentDays() %></td>
        <td><%= String.format("%.2f", ar.getAttendancePercentage()) %></td>
        <td><%= ar.getGrade() %></td>
    </tr>
    <% } %>
</table>
</body>
</html>
