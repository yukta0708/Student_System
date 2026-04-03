<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timetable Management</title>
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
            --warning: #F59E0B;
            --gray: #6B7280;
            --border-radius: 10px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease-in-out;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"%3E%3Cpath fill="%235B21B6" fill-opacity="0.1" d="M0,128L48,144C96,160,192,192,288,186.7C384,181,480,139,576,122.7C672,107,768,117,864,149.3C960,181,1056,235,1152,229.3C1248,224,1344,160,1392,128L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"%3E%3C/path%3E%3C/svg%3E') no-repeat center center/cover, linear-gradient(135deg, #F3F4F6 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: var(--light);
            padding: 1rem 2rem;
            width: 100%;
            max-width: 1200px;
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
            gap: 0.75rem;
        }

        .navbar-brand h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.75rem;
            font-weight: 600;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .navbar-brand i {
            font-size: 1.75rem;
            color: var(--accent);
            animation: pulse 2s infinite;
        }

        .auth-buttons .btn {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            padding: 0.6rem 1.2rem;
            font-size: 0.9rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: var(--transition);
        }

        .auth-buttons .btn:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .container {
            max-width: 1200px;
            width: 100%;
            margin: 2rem 0;
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.25rem;
            font-weight: 700;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin-bottom: 2rem;
        }

        h4 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
            animation: slideUp 0.5s ease-out;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.4rem;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.9rem;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent);
            font-size: 0.9rem;
            transition: var(--transition);
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            border: 1px solid rgba(91, 33, 182, 0.2);
            border-radius: 8px;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            color: var(--dark);
        }

        input:focus,
        select:focus,
        input:hover,
        select:hover {
            border-color: var(--primary);
            box-shadow: 0 0 8px rgba(91, 33, 182, 0.2);
            background: var(--light);
        }

        .input-icon:hover i,
        input:focus + i,
        select:focus + i {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
        }

        .btn-primary:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(91, 33, 182, 0.3);
        }

        .btn-primary::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.4s ease, height 0.4s ease;
        }

        .btn-primary:hover::after {
            width: 200px;
            height: 200px;
        }

        .btn-danger {
            background: var(--warning);
            color: var(--light);
            font-size: 0.85rem;
            padding: 0.5rem 1rem;
        }

        .btn-danger:hover {
            background: #D97706;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(245, 158, 11, 0.3);
        }

        .alert {
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            position: relative;
            animation: slideIn 0.5s ease-out;
            border-left: 4px solid;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: var(--box-shadow);
        }

        .alert-success {
            border-color: var(--success);
            color: var(--dark);
        }

        .alert-danger {
            border-color: var(--warning);
            color: var(--dark);
        }

        .alert .btn-close {
            position: absolute;
            top: 0.75rem;
            right: 0.75rem;
            background: none;
            border: none;
            font-size: 0.9rem;
            cursor: pointer;
            color: var(--gray);
            transition: var(--transition);
        }

        .alert .btn-close:hover {
            color: var(--primary);
            transform: scale(1.2);
        }

        .table-container {
            overflow-x: auto;
            border-radius: var(--border-radius);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--light);
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
        }

        th, td {
            padding: 0.8rem;
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
        }

        th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 0.95rem;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        th:first-child {
            border-top-left-radius: var(--border-radius);
        }

        th:last-child {
            border-top-right-radius: var(--border-radius);
        }

        tr {
            transition: var(--transition);
        }

        tr:hover {
            background: rgba(91, 33, 182, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(91, 33, 182, 0.1);
        }

        td strong {
            color: var(--primary);
            font-weight: 600;
            transition: var(--transition);
        }

        td strong:hover {
            text-decoration: underline;
            text-decoration-color: var(--accent);
        }

        td small {
            color: var(--gray);
            font-size: 0.8rem;
            display: block;
            transition: var(--transition);
        }

        td small:hover {
            color: var(--accent);
        }

        .no-entry {
            color: var(--gray);
            font-style: italic;
            font-size: 0.85rem;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 1rem;
            }

            .navbar {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .table-container {
                margin: 0 -1rem;
            }

            table {
                font-size: 0.8rem;
            }

            th, td {
                padding: 0.6rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Timetable</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h2><i class="fas fa-calendar-alt"></i> Timetable Management</h2>

        <!-- Success & Error Messages -->
        <% String successMsg = request.getParameter("success");
           String errorMsg = request.getParameter("error");
           if (successMsg != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <%= successMsg %>
                <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'"></button>
            </div>
        <% } else if (errorMsg != null) { %>
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i> <%= errorMsg %>
                <button type="button" class="btn-close" onclick="this.parentElement.style.display='none'"></button>
            </div>
        <% } %>

        <!-- Timetable Form Card -->
        <div class="card">
            <h4><i class="fas fa-plus-circle"></i> Add Timetable Entry</h4>
            <form action="TimetableServlet" method="post">
                <div class="form-grid">
                    <div class="form-group input-icon">
                        <label>Day</label>
                        <i class="fas fa-calendar-day"></i>
                        <select name="day" required>
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                        </select>
                    </div>
                    <div class="form-group input-icon">
                        <label>Time Slot</label>
                        <i class="fas fa-clock"></i>
                        <select name="timeSlot" required>
                            <option value="10:10 AM - 11:10 AM">10:10 AM - 11:10 AM</option>
                            <option value="11:10 AM - 12:10 PM">11:10 AM - 12:10 PM</option>
                            <option value="12:10 PM - 1:10 PM">12:10 PM - 1:10 PM</option>
                            <option value="1:10 PM - 2:10 PM">1:10 PM - 2:10 PM</option>
                            <option value="2:10 PM - 3:10 PM">2:10 PM - 3:10 PM</option>
                            <option value="3:10 PM - 4:10 PM">3:10 PM - 4:10 PM</option>
                            <option value="4:10 PM - 4:40 PM">4:10 PM - 4:40 PM</option>
                        </select>
                    </div>
                    <div class="form-group input-icon">
                        <label>Subject</label>
                        <i class="fas fa-book"></i>
                        <input type="text" name="subject" placeholder="Enter subject" required>
                    </div>
                    <div class="form-group input-icon">
                        <label>Teacher Name</label>
                        <i class="fas fa-user"></i>
                        <input type="text" name="teacher" placeholder="Enter teacher name" required>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Add Timetable</button>
                </div>
            </form>
        </div>

        <!-- Timetable Table -->
        <div class="card">
            <h4><i class="fas fa-table"></i> Current Timetable</h4>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Time Slot</th>
                            <th>Monday</th>
                            <th>Tuesday</th>
                            <th>Wednesday</th>
                            <th>Thursday</th>
                            <th>Friday</th>
                            <th>Saturday</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection con = DBConnect.getConnection();
                            String[] timeSlots = {"10:10 AM - 11:10 AM", "11:10 AM - 12:10 PM", "12:10 PM - 1:10 PM", "1:10 PM - 2:10 PM", "2:10 PM - 3:10 PM", "3:10 PM - 4:10 PM", "4:10 PM - 4:40 PM"};
                            String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

                            for (String timeSlot : timeSlots) {
                        %>
                        <tr>
                            <td><strong><%= timeSlot %></strong></td>
                            <% 
                                int timetableId = -1;
                                for (String day : days) { 
                            %>
                            <td>
                                <% 
                                    PreparedStatement ps = con.prepareStatement("SELECT subject, teacher, id FROM timetable WHERE day=? AND time_slot=?");
                                    ps.setString(1, day);
                                    ps.setString(2, timeSlot);
                                    ResultSet rs = ps.executeQuery();

                                    if (rs.next()) { 
                                        timetableId = rs.getInt("id"); 
                                %>
                                        <strong><%= rs.getString("subject") %></strong><br>
                                        <small><%= rs.getString("teacher") %></small>
                                <% 
                                    } else {
                                %>
                                        <span class="no-entry">-</span>
                                <% 
                                    } 
                                    rs.close();
                                    ps.close();
                                %>
                            </td>
                            <% } %>
                            <td>
                                <% if (timetableId != -1) { %>
                                    <a href="DeleteTimetable?id=<%= timetableId %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this entry?');">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                <% } else { %>
                                    <span class="no-entry">No Action</span>
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>