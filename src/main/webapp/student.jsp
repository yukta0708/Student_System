<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.entity.User" %>

<%
    User u = (User) session.getAttribute("userobj");
    if (u == null || !"student".equalsIgnoreCase(u.getRole())) {
        response.sendRedirect("user-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #5D3FD3;
            --secondary: #7C3AED;
            --accent: #38BDF8;
            --light: #F9FAFB;
            --dark: #1F2937;
            --success: #10B981;
            --warning: #F59E0B;
            --card-bg: rgba(255, 255, 255, 0.95);
            --shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"%3E%3Cpath fill="%235D3FD3" fill-opacity="0.1" d="M0,160L48,176C96,192,192,224,288,213.3C384,203,480,149,576,138.7C672,128,768,160,864,170.7C960,181,1056,171,1152,149.3C1248,128,1344,96,1392,80L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"%3E%3C/path%3E%3C/svg%3E') no-repeat center center/cover, linear-gradient(135deg, #F3F4F6 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            overflow-x: hidden;
        }

        .navbar {
            background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1.25rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .navbar-brand h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .navbar-brand i {
            font-size: 2rem;
            animation: pulse 2s infinite;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: white;
            color: var(--primary);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            background: var(--light);
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            backdrop-filter: blur(10px);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .welcome-section {
            text-align: center;
            padding: 4rem 1rem;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(93, 63, 211, 0.1) 0%, transparent 70%);
            z-index: -1;
            animation: rotate 20s linear infinite;
        }

        .welcome-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            color: var(--dark);
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .welcome-subtitle {
            font-size: 1.1rem;
            color: #6B7280;
            max-width: 700px;
            margin: 0 auto;
            font-weight: 400;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: var(--shadow);
            border: 1px solid rgba(93, 63, 211, 0.1);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
            background: linear-gradient(135deg, #FFFFFF, #F3E8FF);
        }

        .card i {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary);
            transition: all 0.3s ease;
        }

        .card:hover i {
            transform: scale(1.15) rotate(5deg);
            color: var(--secondary);
        }

        .card-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: var(--dark);
        }

        .card-desc {
            font-size: 0.9rem;
            color: #6B7280;
            margin-bottom: 1rem;
        }

        .card-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .pending-items {
            position: absolute;
            top: 15px;
            right: 15px;
            background: var(--warning);
            color: white;
            border-radius: 12px;
            padding: 4px 10px;
            font-size: 0.8rem;
            font-weight: 500;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            animation: bounce 1.5s infinite;
        }

        @media (max-width: 768px) {
            .dashboard {
                grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
                padding: 1.5rem;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .navbar {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .auth-buttons {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .dashboard {
                grid-template-columns: 1fr;
            }

            .btn {
                padding: 0.6rem 1.2rem;
                font-size: 0.85rem;
            }

            .welcome-title {
                font-size: 1.75rem;
            }
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }
        .delay-5 { animation-delay: 0.5s; }
        .delay-6 { animation-delay: 0.6s; }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-user-graduate"></i>
            <h1>Student Dashboard</h1>
        </div>
        <div class="auth-buttons">
            <c:choose>
                <c:when test="${not empty userobj}">
                    <a href="#" class="btn btn-primary">
                        <i class="fas fa-user"></i> ${userobj.name}
                    </a>
                    <a href="logout" class="btn btn-secondary" onclick="return confirm('Are you sure you want to logout?')">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="user-login.jsp" class="btn btn-primary">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                    <a href="user-register.jsp" class="btn btn-primary">
                        <i class="fas fa-user-plus"></i> Register
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="welcome-section">
        <h1 class="welcome-title">Welcome back, ${userobj.name}!</h1>
        <p class="welcome-subtitle">Explore your academic resources and stay on track</p>
    </div>

    <div class="dashboard">
        <div class="card fade-in delay-1">
            <a href="timetable.jsp" class="card-link">
                <i class="fas fa-calendar-alt"></i>
                <h3 class="card-title">Timetable</h3>
                <p class="card-desc">View your class schedule and upcoming lectures</p>
            </a>
        </div>

        <div class="card fade-in delay-2">
            <a href="view_attendance.jsp" class="card-link">
                <i class="fas fa-check-circle"></i>
                <h3 class="card-title">Attendance</h3>
                <p class="card-desc">Check your attendance records and status</p>
            </a>
        </div>

        <div class="card fade-in delay-3">
            <a href="studentNotifications.jsp" class="card-link">
                <i class="fas fa-bell"></i>
                <h3 class="card-title">Notifications</h3>
                <p class="card-desc">View important announcements and updates</p>
            </a>
        </div>

        <div class="card fade-in delay-4">
            <a href="applyLeave.jsp" class="card-link">
                <i class="fas fa-envelope-open-text"></i>
                <h3 class="card-title">Leave Application</h3>
                <p class="card-desc">Submit and track leave requests</p>
            </a>
        </div>

        <div class="card fade-in delay-5">
            <a href="resultview.jsp" class="card-link">
                <i class="fas fa-poll"></i>
                <h3 class="card-title">Results</h3>
                <p class="card-desc">Check your academic performance and grades</p>
            </a>
        </div>

        <div class="card fade-in delay-6">
            <a href="view_assignments.jsp" class="card-link">
                <i class="fas fa-book-open"></i>
                <h3 class="card-title">Assignments</h3>
                <p class="card-desc">View and submit your coursework</p>
            </a>
        </div>
    </div>

    <script>
        // Enhanced hover effects with smooth transitions
        document.querySelectorAll('.card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                const icon = card.querySelector('i');
                icon.style.transform = 'scale(1.15) rotate(5deg)';
                card.style.background = 'linear-gradient(135deg, #FFFFFF, #F3E8FF)';
            });
            
            card.addEventListener('mouseleave', () => {
                const icon = card.querySelector('i');
                icon.style.transform = 'scale(1)';
                card.style.background = 'var(--card-bg)';
            });
        });

        // Initialize on page load
        window.addEventListener('DOMContentLoaded', () => {
            updatePendingCounts();
        });
    </script>
</body>
</html>