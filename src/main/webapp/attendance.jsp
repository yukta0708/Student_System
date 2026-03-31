<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.util.concurrent.atomic.AtomicInteger" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Attendance</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>

    <style>
        body { font-family: Arial, sans-serif; text-align: center; background: #f4f4f4; padding: 20px; }
        .container { width: 50%; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        h2 { color: #333; }
        .qr-container { margin-top: 20px; display: none; }
        canvas { padding: 10px; background: white; border: 1px solid #ddd; border-radius: 5px; }
        .expired { color: red; font-weight: bold; }
    </style>
</head>
<body>

<div class="container">
    <h2>📌 Student Attendance</h2>

    <%
        // ✅ Get the stored QR code and timestamp from teacher panel
        String qrCodeValue = (String) application.getAttribute("qrCodeValue");
        Long qrGeneratedTime = (Long) application.getAttribute("qrGeneratedTime");
        AtomicInteger scannedStudents = (AtomicInteger) application.getAttribute("scannedStudents");

        if (scannedStudents == null) {
            scannedStudents = new AtomicInteger(0);
            application.setAttribute("scannedStudents", scannedStudents);
        }

        int maxStudents = 50;
        long currentTime = System.currentTimeMillis();

        // ✅ Check if QR code is still valid
        boolean qrValid = qrCodeValue != null && qrGeneratedTime != null && ((currentTime - qrGeneratedTime) / 1000) <= 45;

        if (qrValid && scannedStudents.get() < maxStudents) {
    %>

    <div class="qr-container" id="qrContainer">
        <canvas id="qrCanvas"></canvas>
        <p id="timer" class="expired"></p>
        <p>Students Scanned: <span id="liveStudentCount"><%= scannedStudents.get() %></span>/50</p>
    </div>

    <script>
        let qrCodeValue = "<%= qrCodeValue %>";
        let qr = new QRious({
            element: document.getElementById("qrCanvas"),
            value: qrCodeValue,
            size: 200
        });

        document.getElementById("qrContainer").style.display = "block";

        let timeLeft = 45 - Math.floor((Date.now() - <%= qrGeneratedTime %>) / 1000);
        function startTimer() {
            let timerInterval = setInterval(() => {
                document.getElementById("timer").innerText = `QR Code expires in: ${timeLeft}s`;
                if (timeLeft <= 0) {
                    document.getElementById("timer").innerText = "QR Code Expired!";
                    document.getElementById("qrCanvas").style.display = "none";
                    clearInterval(timerInterval);
                }
                timeLeft--;
            }, 1000);
        }
        startTimer();
    </script>

    <% } else { %>
        <h3 class="expired">❌ QR Code Expired or Not Available!</h3>
        <p>Please ask your teacher to generate a new QR code.</p>
    <% } %>

</div>

</body>
</html>
