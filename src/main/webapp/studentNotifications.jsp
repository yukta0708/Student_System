<%@ page import="java.util.*, com.DAO.LeaveApplicationDAO, com.entity.LeaveApplication, com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Leave Applications</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .container {
            max-width: 1280px;
            width: 100%;
            margin: 1.75rem 0;
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

        .glass-panel {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .glass-panel::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            animation: fadeIn 0.5s ease-out;
        }

        thead th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.75rem;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        thead th:first-child {
            border-top-left-radius: var(--border-radius);
            border-bottom-left-radius: var(--border-radius);
        }

        thead th:last-child {
            border-top-right-radius: var(--border-radius);
            border-bottom-right-radius: var(--border-radius);
        }

        tbody tr {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        tbody tr:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 0.75rem;
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
            border: none;
        }

        .status-badge {
            padding: 0.4rem 0.75rem;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.8rem;
            text-transform: uppercase;
        }

        .status-pending {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }

        .status-accepted {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }

        .status-rejected {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        .error-message,
        .empty-message {
            padding: 1.25rem;
            border-radius: var(--border-radius);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            box-shadow: var(--box-shadow);
            text-align: center;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid;
            font-size: 0.9rem;
        }

        .error-message {
            border-color: var(--danger);
            color: var(--dark);
        }

        .error-message i,
        .empty-message i {
            margin-right: 0.5rem;
        }

        .error-message a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }

        .error-message a:hover {
            color: var(--secondary);
        }

        .empty-message {
            border-color: var(--primary);
            color: var(--dark);
        }

        .empty-message h3 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .navbar {
                flex-direction: column;
                gap: 0.75rem;
                padding: 0.75rem;
            }

            .glass-panel {
                padding: 1rem;
            }

            table {
                font-size: 0.85rem;
            }

            thead th,
            td {
                padding: 0.6rem;
            }

            .status-badge {
                font-size: 0.75rem;
                padding: 0.3rem 0.6rem;
            }

            .error-message,
            .empty-message {
                padding: 1rem;
                font-size: 0.85rem;
            }

            .empty-message h3 {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Notification</h1>
        </div>
        <div class="auth-buttons">
            <a href="student.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <%
            // Get user object from session
            User user = (User) session.getAttribute("userobj");

            if (user == null) {
        %>
        <div class="glass-panel error-message">
            <i class="fas fa-exclamation-circle"></i>
            User not logged in. Please <a href="user-login.jsp">login</a>.
        </div>
        <%
            } else if (!"student".equalsIgnoreCase(user.getRole())) {
        %>
        <div class="glass-panel error-message">
            <i class="fas fa-exclamation-circle"></i>
            Access denied. Only students can view leave applications.
        </div>
        <%
            } else {
                String studentName = user.getName();
                List<LeaveApplication> leaveList = LeaveApplicationDAO.getLeaveApplicationsByStudent(studentName);

                if (leaveList == null || leaveList.isEmpty()) {
        %>
        <div class="glass-panel empty-message">
            <i class="fas fa-calendar-times"></i>
            <h3>No leave applications found for <%= studentName %></h3>
        </div>
        <%
                } else {
        %>
        <h2><i class="fas fa-calendar-check"></i> My Leave Applications</h2>
        <div class="glass-panel">
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>From Date</th>
                            <th>To Date</th>
                            <th>Reason</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (LeaveApplication leave : leaveList) {
                                String statusClass = "";
                                switch (leave.getStatus()) {
                                    case "Pending": statusClass = "status-pending"; break;
                                    case "Accepted": statusClass = "status-accepted"; break;
                                    case "Rejected": statusClass = "status-rejected"; break;
                                }
                        %>
                        <tr>
                            <td><%= leave.getId() %></td>
                            <td><%= leave.getStartDate() %></td>
                            <td><%= leave.getEndDate() %></td>
                            <td><%= leave.getReason() %></td>
                            <td><span class="status-badge <%= statusClass %>"><%= leave.getStatus() %></span></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>

</body>
</html>