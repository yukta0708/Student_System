<%@ page import="com.DAO.FeedbackDAO, com.entity.Feedback, java.util.*, com.DB.DBConnect" %>
<%
    FeedbackDAO dao = new FeedbackDAO(DBConnect.getConnection());
    List<Feedback> list = dao.getAllFeedback();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Received</title>
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
            border-radius: var(---border-radius);
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

        .table-container {
            padding: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            animation: fadeIn 0.5s ease-out;
        }

        th, td {
            padding: 0.75rem;
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
        }

        th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
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
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        tr:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        td {
            border: none;
        }

        .not-replied {
            padding: 0.4rem 0.75rem;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.8rem;
            background: rgba(107, 114, 128, 0.1);
            color: var(--gray);
            display: inline-block;
        }

        form {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
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

        input[type="text"] {
            width: 200px;
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

        input:focus,
        input:hover {
            border-color: var(--primary);
            box-shadow: 0 0 6px rgba(91, 33, 182, 0.15);
            background: var(--light);
        }

        button {
            padding: 0.65rem 1rem;
            border: none;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            color: var(--light);
        }

        button i {
            margin-right: 0.4rem;
        }

        button.reply-btn {
            background: var(--success);
        }

        button.delete-btn {
            background: var(--danger);
        }

        button:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        button.reply-btn:hover {
            background: #059669;
        }

        button.delete-btn:hover {
            background: #dc2626;
        }

        button::after {
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

        button:hover::after {
            width: 150px;
            height: 150px;
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

            table {
                font-size: 0.85rem;
            }

            th, td {
                padding: 0.6rem;
            }

            input[type="text"] {
                width: 150px;
                padding: 0.65rem 0.9rem 0.65rem 2rem;
                font-size: 0.85rem;
            }

            button {
                padding: 0.6rem 0.8rem;
                font-size: 0.8rem;
            }

            form {
                flex-direction: column;
                align-items: center;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Feedback</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h2><i class="fas fa-comments"></i> Feedback Received</h2>

        <div class="glass-panel">
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Parent Name</th>
                            <th>Student Name</th>
                            <th>Description</th>
                            <th>Reply</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Feedback f : list) { %>
                        <tr>
                            <td><%= f.getParentName() %></td>
                            <td><%= f.getStudentName() %></td>
                            <td><%= f.getDescription() %></td>
                            <td><%= (f.getReply() != null && !f.getReply().isEmpty()) ? f.getReply() : "<span class='not-replied'>Not Replied</span>" %></td>
                            <td>
                                <form action="ReplyFeedbackServlet" method="post">
                                    <input type="hidden" name="id" value="<%= f.getId() %>"/>
                                    <div class="input-icon">
                                        <i class="fas fa-comment"></i>
                                        <input type="text" name="reply" placeholder="Type reply" required/>
                                    </div>
                                    <button type="submit" class="reply-btn"><i class="fas fa-reply"></i> Reply</button>
                                </form>
                                <form action="DeleteFeedbackServlet" method="post">
                                    <input type="hidden" name="id" value="<%= f.getId() %>"/>
                                    <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
                                </form>
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