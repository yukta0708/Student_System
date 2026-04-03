<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.*, java.util.concurrent.atomic.AtomicInteger" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code Attendance System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
    <style>
        :root {
            --primary: #5B21B6;
            --secondary: #7C3AED;
            --accent: #A78BFA;
            --light: #FFFFFF;
            --dark: #1F2937;
            --success: #10B981;
            --danger: #EF4444;
            --warning: #F59E0B;
            --gray: #6B7280;
            --border-radius: 8px;
            --box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            --transition: all 0.2s ease-in-out;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"%3E%3Cpath fill="%235B21B6" fill-opacity="0.05" d="M0,160L48,176C96,192,192,224,288,213.3C384,203,480,149,576,138.7C672,128,768,160,864,170.7C960,181,1056,171,1152,149.3C1248,128,1344,96,1392,80L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"%3E%3C/path%3E%3C/svg%3E') no-repeat center center/cover, linear-gradient(180deg, #F9FAFB 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 1.75rem;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(4px);
            color: var(--dark);
            padding: 1rem 2rem;
            width: 100%;
            max-width: 1280px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--box-shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
            border-radius: var(--border-radius);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
        }

        .navbar-brand i {
            font-size: 1.5rem;
            color: var(--accent);
        }

        .auth-buttons .btn {
            background: var(--primary);
            color: var(--light);
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: var(--transition);
        }

        .auth-buttons .btn:hover {
            background: var(--secondary);
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            width: 100%;
            max-width: 1280px;
            margin: 1.75rem auto;
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .glass-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .instructions {
            background: rgba(255, 255, 255, 0.9);
            padding: 1.25rem;
            border-radius: var(--border-radius);
            border-left: 3px solid var(--primary);
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            color: var(--gray);
            animation: fadeIn 0.5s ease-out;
        }

        .instructions strong {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .instructions ul {
            margin-top: 0.5rem;
            padding-left: 1.25rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }

        .form-group label {
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.85rem;
            color: var(--dark);
            margin-bottom: 0.3rem;
            display: block;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent);
            font-size: 0.85rem;
        }

        select,
        input[type="date"],
        input[type="text"] {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.25rem;
            border: 1px solid rgba(91, 33, 182, 0.3);
            border-radius: 6px;
            font-size: 0.9rem;
            font-family: 'Inter', sans-serif;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            color: var(--dark);
        }

        select:focus,
        input[type="date"]:focus,
        input[type="text"]:focus,
        select:hover,
        input[type="date"]:hover,
        input[type="text"]:hover {
            border-color: var(--primary);
            box-shadow: 0 0 6px rgba(91, 33, 182, 0.15);
            background: var(--light);
        }

        .btn {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            position: relative;
            overflow: hidden;
            color: var(--light);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-generate {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .btn-submit {
            background: var(--success);
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-generate:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
        }

        .btn-submit:hover {
            background: #059669;
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.3s ease, height 0.3s ease;
        }

        .btn:hover::after {
            width: 150px;
            height: 150px;
        }

        .qr-container {
            display: none;
            text-align: center;
            padding: 1.25rem;
            border-radius: var(--border-radius);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            box-shadow: var(--box-shadow);
            margin-top: 1.5rem;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid var(--primary);
        }

        canvas {
            width: 300px !important;
            height: 300px !important;
            background: var(--light);
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin: 1rem auto;
        }

        .info-display {
            font-size: 0.9rem;
            margin: 0.5rem 0;
            color: var(--dark);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .info-display span {
            color: var(--primary);
            font-weight: 600;
        }

        #timer {
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.9rem;
            color: var(--light);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: var(--box-shadow);
            margin: 0.5rem 0;
        }

        .status-message {
            padding: 1.25rem;
            border-radius: var(--border-radius);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            box-shadow: var(--box-shadow);
            text-align: center;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid;
        }

        .expired-message {
            border-color: var(--danger);
            color: var(--dark);
        }

        .expired-message h3 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--danger);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .expired-message p {
            font-size: 0.9rem;
            color: var(--gray);
        }

        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 1rem 1.25rem;
            border-radius: var(--border-radius);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            box-shadow: var(--box-shadow);
            font-size: 0.9rem;
            z-index: 2000;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            max-width: 400px;
        }

        .alert-success {
            border-color: var(--success);
            color: var(--dark);
        }

        .alert-success i {
            color: var(--success);
        }

        .alert-error {
            border-color: var(--danger);
            color: var(--dark);
        }

        .alert-error i {
            color: var(--danger);
        }

        .alert .close-btn {
            margin-left: auto;
            background: none;
            border: none;
            font-size: 0.8rem;
            color: var(--gray);
            cursor: pointer;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .glass-card {
                padding: 1rem;
                width: 95%;
            }

            h2 {
                font-size: 1.5rem;
            }

            .navbar {
                flex-direction: column;
                gap: 0.75rem;
                padding: 0.75rem;
            }

            select,
            input[type="date"],
            input[type="text"] {
                padding: 0.65rem 0.9rem 0.65rem 2rem;
                font-size: 0.85rem;
            }

            .btn {
                padding: 0.65rem;
                font-size: 0.8rem;
            }

            canvas {
                width: 90% !important;
                height: auto !important;
            }

            .info-display {
                font-size: 0.85rem;
            }

            #timer {
                font-size: 0.85rem;
                padding: 0.4rem 0.8rem;
            }

            .status-message {
                padding: 1rem;
            }

            .expired-message h3 {
                font-size: 1.1rem;
            }

            .expired-message p {
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>QR CODE</h1>
        </div>
        <div class="auth-buttons">
            <a href="index.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="glass-card">
        <h2><i class="fas fa-qrcode"></i> QR Code Attendance System</h2>

        <div class="instructions">
            <strong><i class="fas fa-info-circle"></i> INSTRUCTIONS FOR STUDENTS:</strong>
            <ul>
                <li>Teacher will generate a unique QR code for each class session</li>
                <li>Scan the QR code within <b>45 seconds</b> of generation</li>
                <li>Enter your student ID when prompted</li>
                <li>Each QR code can only be used once and expires quickly</li>
            </ul>
        </div>

        <!-- Subject and Time Selection -->
        <div class="form-group input-icon">
            <label for="subject">Subject</label>
            <i class="fas fa-book"></i>
            <select id="subject" required>
                <option value="">-- Select Subject --</option>
                <option value="Java">Java Programming</option>
                <option value="Operating system">Operating System</option>
                <option value="Computer Network">Computer Network</option>
                <option value="Database Management System">DBMS</option>
                <option value="AI">Artificial Intelligence</option>
            </select>
        </div>

        <div class="form-group input-icon">
            <label for="timing">Time Slot</label>
            <i class="fas fa-clock"></i>
            <select id="timing" required>
                <option value="">-- Select Time Slot --</option>
                <option value="10:10 AM - 11:10 AM">10:10 AM - 11:10 AM</option>
                <option value="11:10 AM - 12:10 PM">11:10 AM - 12:10 PM</option>
                <option value="12:10 PM - 1:10 PM">12:10 PM - 1:10 PM</option>
                <option value="1:40 PM - 2:40 PM">1:40 PM - 2:40 PM</option>
                <option value="2:40 PM - 3:40 PM">2:40 PM - 3:40 PM</option>
            </select>
        </div>

        <div class="form-group input-icon">
            <label for="date">Date</label>
            <i class="fas fa-calendar"></i>
            <input type="date" id="date" required>
        </div>

        <button class="btn btn-generate" onclick="generateQRCode()">
            <i class="fas fa-qrcode"></i> GENERATE QR CODE
        </button>

        <!-- QR Code Display -->
        <div class="qr-container" id="qrContainer">
            <div class="info-display">
                <i class="fas fa-calendar"></i> Date: <span id="displayDate"></span>
            </div>
            <div class="info-display">
                <i class="fas fa-book"></i> Subject: <span id="displaySubject"></span>
            </div>
            <div class="info-display">
                <i class="fas fa-clock"></i> Timing: <span id="displayTiming"></span>
            </div>
            <canvas id="qrCanvas" width="300" height="300"></canvas>
            <br>
            </br>
            <div id="timer"></div>
            <div style="font-size: 0.9rem; color: var(--gray); margin-top: 0.5rem;">
                <i class="fas fa-mobile-alt"></i> Scan this QR code using your phone camera
            </div>
        </div>
    </div>

    <%
        String timestampStr = request.getParameter("time");
        String subject = request.getParameter("subject");
        String timing = request.getParameter("timing");
        String date = request.getParameter("date");

        if (timestampStr != null) {
            long scannedTime = System.currentTimeMillis();
            long qrTime = Long.parseLong(timestampStr);
            long timeDifference = (scannedTime - qrTime) / 1000;

            if (timeDifference <= 45) {
    %>
    <div class="glass-card">
        <h2><i class="fas fa-check-circle"></i> Submit Attendance</h2>
        <form action="AttendanceServlet" method="post">
            <div class="form-group input-icon">
                <label for="rollno">Student ID</label>
                <i class="fas fa-id-badge"></i>
                <input type="text" name="rollno" placeholder="Enter your student ID" required>
                <input type="hidden" name="subject" value="<%= subject %>">
                <input type="hidden" name="timing" value="<%= timing %>">
                <input type="hidden" name="date" value="<%= date %>">
            </div>
            <button type="submit" class="btn btn-submit">
                <i class="fas fa-check"></i> SUBMIT ATTENDANCE
            </button>
        </form>
    </div>
    <%
            } else {
    %>
    <div class="glass-card">
        <div class="status-message expired-message">
            <h3><i class="fas fa-exclamation-circle"></i> QR Code Expired</h3>
            <p>The QR code was only valid for 45 seconds. Please request a new one from your instructor.</p>
        </div>
    </div>
    <%
            }
        }
    %>

    <script>
        let qrCodeValue = "";
        let timerInterval;

        function generateQRCode() {
            let timestamp = new Date().getTime();
            let selectedSubject = document.getElementById("subject").value;
            let selectedTiming = document.getElementById("timing").value;
            let selectedDate = document.getElementById("date").value;

           
            if (!selectedDate) {
                showAlert("Please select a date", "error");
                return;
            }
            if (!selectedSubject) {
                showAlert("Please select a subject", "error");
                return;
            }
            if (!selectedTiming) {
                showAlert("Please select a time slot", "error");
                return;
            }

       
            document.getElementById("displayDate").innerText = selectedDate;
            document.getElementById("displaySubject").innerText = selectedSubject;
            document.getElementById("displayTiming").innerText = selectedTiming;

            qrCodeValue = `http://192.168.33.248:8082/student_system/change.jsp?time=${timestamp}&subject=${selectedSubject}&timing=${selectedTiming}&date=${selectedDate}`;

          
            new QRious({
                element: document.getElementById("qrCanvas"),
                value: qrCodeValue,
                size: 300,
                background: 'white',
                foreground: '#1F2937',
                level: 'H',
                padding: 20
            });

            
            document.getElementById("qrContainer").style.display = "block";
            startTimer();

            
            showAlert("QR Code generated successfully!", "success");
        }

        function startTimer() {
            let timeLeft = 45;
            clearInterval(timerInterval);

            updateTimerDisplay(timeLeft);

            timerInterval = setInterval(() => {
                timeLeft--;
                updateTimerDisplay(timeLeft);

                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                }
            }, 1000);
        }

        function updateTimerDisplay(seconds) {
            const timerElement = document.getElementById("timer");

            if (seconds <= 0) {
                timerElement.innerHTML = '<i class="fas fa-exclamation-circle"></i> QR CODE EXPIRED!';
                timerElement.style.background = "var(--danger)";
                return;
            }

            if (seconds <= 10) {
                timerElement.innerHTML = `<i class="fas fa-hourglass-half"></i> EXPIRING IN: ${seconds}s`;
                timerElement.style.background = "var(--danger)";
            } else if (seconds <= 20) {
                timerElement.innerHTML = `<i class="fas fa-hourglass-half"></i> EXPIRING IN: ${seconds}s`;
                timerElement.style.background = "var(--warning)";
            } else {
                timerElement.innerHTML = `<i class="fas fa-hourglass-start"></i> EXPIRES IN: ${seconds}s`;
                timerElement.style.background = "var(--success)";
            }
        }

        function showAlert(message, type) {
            const alert = document.createElement("div");
            alert.className = `alert alert-${type}`;
            alert.innerHTML = `<i class="fas fa-${type === 'success' ? 'check-circle' : 'exclamation-circle'}"></i> ${message} <button class="close-btn">&times;</button>`;
            document.body.appendChild(alert);

            setTimeout(() => {
                alert.remove();
            }, 3000);

            alert.querySelector(".close-btn").addEventListener("click", () => {
                alert.remove();
            });
        }
    </script>
</body>
</html>