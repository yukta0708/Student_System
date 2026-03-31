<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Records</title>
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
            margin-bottom: 1.75rem;
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
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

        .alert {
            padding: 1rem 1.25rem;
            border-radius: var(--border-radius);
            margin: 1.5rem;
            position: relative;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: var(--box-shadow);
            font-size: 0.9rem;
        }

        .alert-success {
            border-color: var(--success);
            color: var(--dark);
        }

        .alert-success i {
            color: var(--success);
            margin-right: 0.5rem;
        }

        .alert-danger {
            border-color: var(--danger);
            color: var(--dark);
        }

        .alert-danger i {
            color: var(--danger);
            margin-right: 0.5rem;
        }

        .alert .btn-close {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: none;
            border: none;
            font-size: 0.8rem;
            color: var(--gray);
            cursor: pointer;
        }

        .table-container {
            padding: 1.5rem;
        }

        .premium-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            animation: fadeIn 0.5s ease-out;
        }

        .premium-table thead th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.75rem;
            border: none;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .premium-table th:first-child {
            border-top-left-radius: var(--border-radius);
        }

        .premium-table th:last-child {
            border-top-right-radius: var(--border-radius);
        }

        .premium-table tbody tr {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .premium-table tbody tr:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .premium-table td {
            padding: 0.75rem;
            vertical-align: middle;
            font-size: 0.9rem;
            border: none;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            font-size: 0.9rem;
            margin-right: 0.75rem;
        }

        .status-badge {
            padding: 0.4rem 0.75rem;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.8rem;
            text-transform: uppercase;
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }

        .action-btn {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 0.2rem;
            transition: var(--transition);
            color: var(--light);
        }

        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-edit {
            background: var(--primary);
        }

        .btn-delete {
            background: var(--danger);
        }

        .btn-view {
            background: var(--secondary);
        }

        .no-records {
            padding: 2rem;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            animation: fadeIn 0.5s ease-out;
        }

        .no-records i {
            font-size: 2rem;
            color: var(--gray);
            margin-bottom: 1rem;
        }

        .no-records h4 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .no-records p {
            font-size: 0.9rem;
            color: var(--gray);
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

            .table-container {
                padding: 1rem;
                overflow-x: auto;
            }

            .premium-table {
                font-size: 0.85rem;
            }

            .premium-table th,
            .premium-table td {
                padding: 0.6rem;
            }

            .user-avatar {
                width: 30px;
                height: 30px;
                font-size: 0.8rem;
                margin-right: 0.5rem;
            }

            .action-btn {
                width: 28px;
                height: 28px;
                font-size: 0.8rem;
            }

            .alert {
                margin: 1rem;
                font-size: 0.85rem;
            }

            .no-records {
                padding: 1.5rem;
            }

            .no-records i {
                font-size: 1.75rem;
            }

            .no-records h4 {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Student Records</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h2><i class="fas fa-user-graduate"></i> Student Records</h2>

        <div class="glass-panel">
          
            <c:if test="${not empty regmsg}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> ${regmsg}
                    <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'"></button>
                </div>
                <c:remove var="regmsg" scope="session" />
            </c:if>
            <c:if test="${not empty failedmsg}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> ${failedmsg}
                    <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'"></button>
                </div>
            </c:if>

            <div class="table-container">
                <table class="premium-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            UserDAO dao = new UserDAO(DBConnect.getConnection());
                            List<User> list = dao.getallUser();
                            if (list == null || list.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="6">
                                <div class="no-records">
                                    <i class="fas fa-user-graduate"></i>
                                    <h4>No Student Records Found</h4>
                                    <p>The student database is currently empty</p>
                                </div>
                            </td>
                        </tr>
                        <%
                            } else {
                                for (User p : list) {
                        %>
                        <tr>
                            <td><strong>#<%= p.getId() %></strong></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="user-avatar"><%= p.getName().charAt(0) %></div>
                                    <div>
                                        <h6 class="mb-0" style="font-weight: 600;"><%= p.getName() %></h6>
                                        <small class="text-muted">ID: <%= p.getId() %></small>
                                    </div>
                                </div>
                            </td>
                            <td><%= p.getEmail() %></td>
                            <td><%= p.getPhoneno() %></td>
                            <td><span class="status-badge">Active</span></td>
                            <td>
                                <a href="edit.jsp?id=<%= p.getId() %>" class="action-btn btn-edit" title="Edit">
                                    <i class="fas fa-pen"></i>
                                </a>
                                <a href="delete?id=<%= p.getId() %>" class="action-btn btn-delete" title="Delete" 
                                   onclick="return confirm('Are you sure you want to delete this student?');">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>