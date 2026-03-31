
<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User | Teacher Dashboard</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Google Fonts -->
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

        /* Glassmorphism Panel */
        .glass-panel {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            border: 1px solid rgba(93, 63, 211, 0.1);
            box-shadow: var(--shadow);
            padding: 2rem;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            animation: fadeIn 0.8s ease-in-out;
        }

        .glass-panel:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }

        /* Header */
        .dashboard-header {
            background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 2.5rem 0;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .dashboard-header::before {
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

        .header-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .header-subtitle {
            font-size: 1.1rem;
            font-weight: 400;
            opacity: 0.9;
        }

        /* Form Styling */
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            color: var(--dark);
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-group input {
            border: 1px solid rgba(93, 63, 211, 0.2);
            border-radius: 8px;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
        }

        .form-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(93, 63, 211, 0.25);
            outline: none;
        }

        .form-group i {
            position: absolute;
            left: 0.75rem;
            top: 2.75rem;
            color: var(--primary);
            font-size: 1rem;
        }

        /* Buttons */
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

        .btn-success {
            background: linear-gradient(90deg, var(--success) 0%, #34D399 100%);
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-success:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-secondary {
            background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            color: white;
        }

        /* Error Card */
        .error-card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 3rem;
            text-align: center;
            box-shadow: var(--shadow);
            margin: 2rem auto;
            max-width: 500px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .error-card i {
            font-size: 4rem;
            color: #DC3545;
            margin-bottom: 1.5rem;
            animation: pulse 2s infinite;
        }

        .error-card h4 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .error-card p {
            color: #6B7280;
            font-size: 0.95rem;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #E5E7EB;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(var(--primary), var(--secondary));
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--secondary);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }
            .glass-panel {
                padding: 1.5rem;
            }
            .btn {
                padding: 0.6rem 1.2rem;
                font-size: 0.9rem;
            }
            .error-card {
                margin: 1.5rem;
                padding: 2rem;
            }
        }

        @media (max-width: 480px) {
            .header-title {
                font-size: 1.75rem;
            }
            .form-group input {
                font-size: 0.85rem;
            }
            .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
            .error-card {
                padding: 1.5rem;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Edit User</h1>
        </div>
        
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
<br></br>

<div class="container mb-5">
    <%
        int id;
        User user = null;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            UserDAO dao = new UserDAO(DBConnect.getConnection());
            user = dao.getUserById(id);
        } catch (NumberFormatException e) {
            user = null; // Handle invalid ID
        }

        if (user == null) {
    %>
    <div class="error-card">
        <i class="fas fa-exclamation-circle"></i>
        <h4>User Not Found</h4>
        <p>The requested user could not be found in the database.</p>
        <a href="all_users.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left me-2"></i>Back to Users</a>
    </div>
    <%
        } else {
    %>
    <div class="glass-panel">
        <h3 style="font-family: 'Poppins', sans-serif; font-weight: 600; color: var(--primary);">
            <i class="fas fa-user me-2"></i>Edit User Details
        </h3>
        <form action="update" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <div class="form-group">
                <label for="name">Name</label>
                <i class="fas fa-user"></i>
                <input type="text" name="name" id="name" class="form-control" value="<%= user.getName() != null ? user.getName() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" class="form-control" value="<%= user.getEmail() != null ? user.getEmail() : "" %>" required>
            </div>

            <div class="form-group">
                <label for="phoneno">Phone No</label>
                <i class="fas fa-phone"></i>
                <input type="text" name="phoneno" id="phoneno" class="form-control" value="<%= user.getPhoneno() != null ? user.getPhoneno() : "" %>" required>
            </div>

            <div class="d-flex gap-3">
                <button type="submit" class="btn btn-success"><i class="fas fa-save me-2"></i>Update</button>
                <a href="all_users.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left me-2"></i>Back</a>
            </div>
        </form>
    </div>
    <%
        }
    %>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
