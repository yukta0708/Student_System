<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Attendance Report</title>
</head>
<body>
    <h2>Generate Attendance Report</h2>
    <form action="generateAttendanceReport" method="get">
        <label for="rollNo">Enter Roll Number:</label>
        <input type="text" id="rollNo" name="rollNo" required>
        <button type="submit">Download Report</button>
    </form>
</body>
</html>